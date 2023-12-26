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
        // Set your specific MySQL URL here
        $jawsdb_url = 'mysql://ob2izbsa8yx1yh8f:bsfxkigjebobhcbb@r98du2bxwqkq3shg.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/donadzl6ia5ws7if';

        $url = parse_url($jawsdb_url);

        $this->host = $url['host'];
        $this->username = $url['user'];
        $this->password = $url['pass'];
        $this->database = ltrim($url['path'], '/');
        $this->port = isset($url['port']) ? $url['port'] : 3306;

        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database, $this->port);

        if ($this->conn->connect_error) {
            error_log("Connection failed: " . $this->conn->connect_error);
            die("Connection failed. Please check the logs.");
        }
    }

    public function __destruct(){
        $this->conn->close();
    }
}
?>
