<?php

/**
 * This file is the entry point for the Bedrock site.
 */

// Load the Composer autoloader
require __DIR__ . '/../vendor/autoload.php';

// Load the environment variables
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

// Define the WordPress directory
define('WP_USE_THEMES', true);
define('WP_HOME', getenv('WP_HOME'));
define('WP_SITEURL', getenv('WP_SITEURL'));

// Include the WordPress core
require __DIR__ . '/wp/wp-blog-header.php';
