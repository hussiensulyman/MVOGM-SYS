<?php
if(!defined('DB_SERVER')){
    require_once("../initialize.php");
}
class DBConnection{

    private $host = DB_SERVER;
    private $username = DB_USERNAME;
    private $password = DB_PASSWORD;
    private $database = DB_NAME;
    
    public $conn;
    
    public function __construct() {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->database);
    
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
