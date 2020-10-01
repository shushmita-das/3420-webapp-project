<?php
  include 'includes/library.php';
  $pdo =  & dbconnect();


$username =$_GET['username'];

//sql query
$query = "SELECT username FROM user_info WHERE username = ?";
$stmt = $pdo->prepare($query);
$stmt->execute([$username]);
if($stmt->fetchColumn()){
   echo true;
}else{
   echo false;
}

?>
