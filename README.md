# My Bedrock Site

This is a WordPress Bedrock site, which is a modern WordPress stack that helps you manage your WordPress projects more effectively.

## Project Structure

- **config/**: Contains configuration files for the application and environment-specific settings.
  - **application.php**: Main application configuration settings.
  - **environments/**: Contains environment-specific configuration files.
    - **development.php**: Settings for the development environment.
    - **staging.php**: Settings for the staging environment.
    - **production.php**: Settings for the production environment.
  
- **web/**: The web root directory for the application.
  - **app/**: Contains application-specific files.
    - **mu-plugins/**: Must-use plugins that are automatically activated.
    - **plugins/**: Standard WordPress plugins.
    - **themes/**: WordPress themes.
    - **uploads/**: Directory for media uploads.
  - **wp/**: Contains the WordPress core files.
  - **index.php**: Entry point for the Bedrock site.

- **.env**: Environment variables for the application, including sensitive information like database credentials.

- **composer.json**: Composer configuration file listing project dependencies.

- **composer.lock**: Locks the versions of the dependencies specified in composer.json.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```
   cd my-bedrock-site
   ```

3. Install dependencies using Composer:
   ```
   composer install
   ```

4. Configure your environment variables in the `.env` file.

5. Set up your web server to point to the `web` directory.

6. Access your site in the browser.

## Usage Guidelines

- Use the `config/environments/` directory to manage different environment settings.
- Place your custom plugins in the `web/app/plugins/` directory.
- Store your themes in the `web/app/themes/` directory.
- Use the `web/app/uploads/` directory for media uploads.

For more information, refer to the [Bedrock documentation](https://roots.io/bedrock/docs/).