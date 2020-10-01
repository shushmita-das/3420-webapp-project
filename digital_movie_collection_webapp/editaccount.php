<?php
// IT WORKS!!!
//include library here
include "includes/library.php";
session_start();
if(!isset($_SESSION['user_id']))
{ //after getting id
  header("Location:login.php");
  exit();
}
else
{
  $pdo = & dbconnect();//database connection attempt
  $user_id=$_SESSION['user_id'];//gettinf user_id

  //build and execute query
  $query = "SELECT * FROM user_info where user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$user_id]);

//if connection not possible destroy session
  if(!$stmt)
  die("Database pull did not return any data");

  $row=$stmt->fetch();//fetch specific

  if(isset($_POST['edit'])){
    $user_id=$_SESSION['user_id'];
    $errors=array();

   //get and validate the users name, must have length and at least one space
   $name=$_POST['name'];
   if(strlen($name) < 0 || strpos($name, " ")===FALSE)
     $errors[]="<h2>You must enter a valid name</h2>";

   //get and validate the users name, must have length and at least one spac
   $username=$_POST['username'];
   if(strlen($username) < 0)
   $errors[]="<h2>You must enter a valid username</h2>";

   //get and validate the users email
   $email = $_POST['email'];
   if (!filter_var($email, FILTER_VALIDATE_EMAIL))
     $errors[]="<h2>You must enter a valid email</h2>";

   //get password from user
   $pass = $_POST['psw'];
   //get user to re-enter the password and doublecheck if it matches to previous one
   $password = $_POST['psw-repeat'];

   if ($password==$pass && $password!=null){
     $hash = password_hash($pass, PASSWORD_DEFAULT);
     $query="UPDATE user_info set name=?,username=?,email=?,password=? WHERE user_id=?";
     $pdo->prepare($query)->execute([$name,$username,$email,$hash,$user_id]);
   } elseif($password==null){
     $query="UPDATE user_info set name=?,username=?,email=?,password=? WHERE user_id=?";
     $pdo->prepare($query)->execute([$name,$username,$email,$user_id]);
   }else{
     $errors[]="<h2>Passwords don't match</h2>";
   }

   echo"Your account details have been edited. Redrecting to login page.";
   header("Location:login.php");//redirect to login page


  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Edit Account";
    include 'includes/head_includes.php';
  ?>
</head>
<body>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "Edit Account";
        $HEADING_TWO = "Account Settings";
        include 'includes/header.php';
      ?>
    </header>
   <aside class="otherAside">
     <nav>
       <ul>
         <li><a href="index.php">Home</a></li>
          <li><a href="account.php">Create Account</a></li>
          <li><a href="editaccount.php">Edit Account</a></li>
          <li><a class="deletAcc" href="deleteaccount.php">Delete Account</a></li>
          <li><a href="addvid.php">Add Video</a></li>
          <li><a href="editvid.php?movie_id=<?php echo $row['movie_id'];?>">Edit Video</a></li>
          <li><a href="deletevid.php?movie_id=<?php echo $row['movie_id'];?>">Delete Video</a></li>
          <li><a href="search.php">Search</a></li>
          <li><a href="displaydetails.php?movie_id=<?php echo $row['movie_id'];?>">Display Details</a></li>
          <li><a href="logout.php">Logout</a></li>
       </ul>
     </nav>
   </aside>
   <main class="otherMain">
     <h1 class="headingOne">Edit Account</h1>
     Please fill in this form to create an account.
     <hr>
     <div id="input">
       <form class = "editaccount" id="editaccount" name="editaccount" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
         <label for="username"><b>Username</b></label>
         <input type="text" placeholder="Enter Username" name="username" id= "username" value="<?php echo $row['username']?>" required>

         <label for="name"><b>Name</b></label>
         <input type="text" placeholder="Enter Name" name="name" id="name" value="<?php echo $row['name']?>"required>

         <label for="email"><b>Email</b></label>
         <input type="text" placeholder="Enter Email" name="email" id="email" value="<?php echo $row['email']?>"required>
         <span class="noerror">You must enter an valid email</span>

         <label for="psw"><b>Password</b></label>
         <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

         <label for="psw-repeat"><b>Repeat Password</b></label>
         <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

         <div class="clearfix">
           <button type="submit" name="edit" class="createbtn" >Edit</button>
         </div>
       </form>
     </div>
     </div>
   </main>
   <footer>
     <span>&copy; 3420 Web Dev Inc.</span>
   </footer>
 </div>
</body>
</html>
