<?php
// IT WORKS!!!
session_start();
if(!isset($_SESSION['user_id'])){//after getting user id
  header("Location:login.php");
  exit();
} else{
  include 'includes/library.php';

  $pdo = & dbconnect();//database connection

  //getting userid and movie id
  $user_id = $_SESSION['user_id'];
  $movie_id = $_GET['movie_id'];

//build and execute query to delete all the movies
  $query = "DELETE FROM movie_info where user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$user_id]);
//build and execute query to delete the user account all together
  $query = "DELETE FROM user_info where user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$user_id]);

  header("Location:account.php");//redirect to create account page
}

?>
