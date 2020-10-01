<?php
// IT WORKS!!!
session_start();
if(!isset($_SESSION['user_id'])){//after getting user id
  header("Location:login.php");
  exit();
} else{
  include 'includes/library.php';

  $pdo = & dbconnect();
  $user_id = $_SESSION['user_id'];
  $movie_id = $_GET['movie_id'];
  $query = "DELETE FROM movie_info where movie_id= ? and user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$movie_id, $user_id]);
    header("Location:index.php");
}

?>
