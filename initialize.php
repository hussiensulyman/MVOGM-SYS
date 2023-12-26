<?php
$dev_data = array('id'=>'-1','firstname'=>'Developer','lastname'=>'','username'=>'dev_oretnom','password'=>'5da283a2d990e8d8512cf967df5bc0d0','last_login'=>'','date_updated'=>'','date_added'=>'');

if(!defined('base_url')) define('base_url','http://localhost/mvogms/');
if(!defined('base_app')) define('base_app', str_replace('\\','/',__DIR__).'/' );
if(!defined('dev_data')) define('dev_data',$dev_data);

// Check if on Heroku with environment variable set for database URL
$dbUrl = getenv('mysql://ob2izbsa8yx1yh8f:bsfxkigjebobhcbb@r98du2bxwqkq3shg.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/donadzl6ia5ws7if'); // Replace 'JAWSDB_URL' with your actual environment variable name
if ($dbUrl) {
    // Parse database URL to extract components
    $components = parse_url($dbUrl);
    define('DB_SERVER', $components['host']);
    define('DB_USERNAME', $components['user']);
    define('DB_PASSWORD', $components['pass']);
    define('DB_NAME', ltrim($components['path'], '/'));
} else {
    // Local development environment
    define('DB_SERVER', "localhost");
    define('DB_USERNAME', "root");
    define('DB_PASSWORD', "");
    define('DB_NAME', "mvogms_db");
}
?>
