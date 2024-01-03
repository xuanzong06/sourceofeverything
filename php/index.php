<?php
$servername = "localhost:3306";
$username = "it01";
$password = "it0123";
$dbname = "test";

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: *');


echo "hello World";
$action = $_POST['action'];
//$action = "INS";

$param1 = $_POST['param1'];
$param2 = $_POST['param2'];
$param3 = $_POST['param3'];

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($action == "SEL") {
    $sql = "SELECT id, firstname, lastname FROM MyGuests";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "id: " .
                $row["id"] .
                " - Name: " .
                $row["firstname"] .
                " " .
                $row["lastname"] .
                "<br>";
        }
    } else {
        echo "0 results";
    }
    $conn->close();
}

//回傳json
if ($action == "INS") {
    $sql = "INSERT INTO test.demo (col1, col2, col3)
	VALUES ('$param1', '$param2', '$param3')";

$response = array();

if ($conn->query($sql) === true) {
    $response['success'] = true;
    $response['message'] = "New record created successfully";
} else {
    $response['success'] = false;
    $response['message'] = "Error: " . $sql . "<br>" . $conn->error;
}

// 將回應轉換為 JSON 格式並輸出
header('Content-Type: application/json');
echo json_encode($response);

    $conn->close();
}

//基本版
if ($action == "INS2") {
    $sql = "INSERT INTO test.demo (col1, col2, col3)
	VALUES ('$param1', '$param2', '$param3')";
    if ($conn->query($sql) === true) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}

?>
