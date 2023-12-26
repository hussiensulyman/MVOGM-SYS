<?php
if(!defined('DB_SERVER')){
    require_once("../initialize.php");
}
<?php
class DBConnection {

    private $host = 'r98du2bxwqkq3shg.cbetxkdyhwsb.us-east-1.rds.amazonaws.com';
    private $username = 'ob2izbsa8yx1yh8f';
    private $password = 'bsfxkigjebobhcbb';
    private $database = 'donadzl6ia5ws7if';
    private $port = 3306;  // Default MySQL port

    public $conn;

    public function __construct() {
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
