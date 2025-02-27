# Stage 1: Install Composer dependencies
FROM composer:latest AS composer

WORKDIR /var/www/html

# Copy only Composer-related files
COPY composer.json composer.lock ./

# Ensure required plugins are allowed and install dependencies
RUN composer config --no-plugins allow-plugins.composer/installers true \
    && composer config --no-plugins allow-plugins.roots/wordpress-core-installer true \
    && composer install --no-dev --no-progress --prefer-dist

# Stage 2: Install Node.js dependencies
FROM node:lts AS node

WORKDIR /var/www/html

# Copy package manager files
COPY package.json package-lock.json ./
RUN npm install --no-progress --no-audit

# Stage 3: Build the final image
FROM php:8.3-apache

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    curl \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    libxml2-dev \
    mariadb-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip xml \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy Apache config
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy Composer and Node.js dependencies from previous stages
COPY --from=composer /var/www/html/vendor /var/www/html/vendor
COPY --from=composer /var/www/html/web/wp /var/www/html/web/wp
COPY --from=node /var/www/html/node_modules /var/www/html/node_modules

# Copy application files (excluding wp/, vendor/, and node_modules/)
COPY . /var/www/html/

# Ensure the correct ownership for Apache
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 and start Apache
EXPOSE 80
CMD ["apache2-foreground"]
