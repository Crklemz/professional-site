<?php

define('WP_ENV', 'development');

// Debugging ON for development
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
@ini_set('display_errors', 1);

// Allow file modifications in local environment
define('DISALLOW_FILE_MODS', false);
