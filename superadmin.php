<?php

$host = "localhost";
$user = "username";
$password = "password";
$dbname = "database_name";

$conn = mysqli_connect($host, $user, $password, $dbname);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
if(LOGIN_SUPERADMIN==$_POST["action"]){

  $username = $_POST['username'];
  $password = $_POST['password'];

  $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
  $result = mysqli_query($conn, $sql);

  if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    if ($row['type'] == 0) {
      echo "success";
    } else {
      echo "Error: Not a superadmin";
    }
  } else {
    echo "Error: Invalid username or password";
  }
}

if("GET_ALL_USER"==$_POST["action"]){
    $sql = "SELECT * FROM users WHERE type != 0";
    $result = mysqli_query($conn, $sql);
    $user_details = array();
  
    if (mysqli_num_rows($result) > 0) {
      while($row = mysqli_fetch_assoc($result)) {
        $user_details[] = $row;
      }
    }
    echo json_encode($user_details);

  }
  if("UPDATE_ACCOUNT"==$_POST["action"]){
    $id = $_POST['id'];
    $block = $_POST['block'];
  
    $sql = "SELECT * FROM users WHERE id=$id";
    $result = mysqli_query($conn, $sql);
  
    if (mysqli_num_rows($result) > 0) {
      $row = mysqli_fetch_assoc($result);
      if ($row['type'] == 0) {
        echo "Error: Cannot block or release a superadmin";
      } else {
        $sql = "UPDATE users SET block='$block' WHERE id=$id";
        $result = mysqli_query($conn, $sql);
  
        echo "success";
      }
    } else {
      echo "Error: Invalid user or admin ID";
    }
  }
  if("SEND_MESSAGE"==$_POST["action"]){
    $sender_id = $_POST['sender_id'];
    $receiver_id = $_POST['receiver_id'];
    $message = $_POST['message'];
  
    $query = "INSERT INTO chat (sender, recipient, message) VALUES ($sender_id, $receiver_id, '$message')";
    mysqli_query($db, $query);
  }
  if("FETCH_MESSAGE"==$_POST["action"]){
    $query = "SELECT * FROM chat WHERE sender='superadmin'OR receiver='superadmin'";
$result = mysqli_query($conn, $query);
$messages = array();
while ($row = mysqli_fetch_assoc($result)) {
    $messages[] = $row;
}
echo json_encode($messages);



  }



mysqli_close($conn);

?>
