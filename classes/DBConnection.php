<?php
if (!defined('DB_SERVER')) {
    require_once("../initialize.php");
}

class DBConnection {
    private $host;
    private $username;
    private $password;
    private $database;
    private $port;
    public $conn;

    public function __construct() {
        // Check if the JAWSDB_URL environment variable is set (Heroku environment)
        if (getenv('mysql://ob2izbsa8yx1yh8f:bsfxkigjebobhcbb@r98du2bxwqkq3shg.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/donadzl6ia5ws7if')) {
            $url = parse_url(getenv('JAWSDB_URL'));

            $this->host = $url['host'];
            $this->username = $url['user'];
            $this->password = $url['pass'];
            $this->database = ltrim($url['path'], '/'); // Remove the leading slash
            $this->port = isset($url['port']) ? $url['port'] : 3306;
        } else {
            // If JAWSDB_URL is not set, use the constants from initialize.php
            $this->host = DB_SERVER;
            $this->username = DB_USERNAME;
            $this->password = DB_PASSWORD;
            $this->database = DB_NAME;
            $this->port = 3306; // Default MySQL port
        }

        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database, $this->port);

        if ($this->conn->connect_error) {
            // In a production environment, you should log this to a file instead and not output it.
            error_log("Connection failed: " . $this->conn->connect_error);
            // For development, you could uncomment the next line to get the error message
            // echo "Connection failed: " . $this->conn->connect_error;
            die("Connection failed. Please check the logs.");
        }
    }

    public function __destruct(){
        $this->conn->close();
    }
}
?>
