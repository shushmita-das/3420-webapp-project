<?php
// IT WORKS!!!
 //include library here
 include "includes/library.php";
 session_start(); //start session
 $_SESSION=array();
 session_destroy();
 header("Location: login.php");
 ?>
