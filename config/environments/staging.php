<?php

define('WP_ENV', 'staging');

// Debugging OFF
define('WP_DEBUG', false);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
@ini_set('display_errors', 0);

// Disable file modifications in staging
define('DISALLOW_FILE_MODS', true);
