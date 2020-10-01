<?php
include 'includes/library.php';
session_start();//start session


  if(isset($_POST['create'])){
     $errors=array();
     //get and validate the users name, must have length and at least one space
     $name=$_POST['name'];
     if(strlen($name) < 0 || strpos($name, " ")===FALSE)
      $errors[]="<h2>Pls enter a valid name</h2>";

     $username=$_POST['username'] ?? null;

     //get and validate the users email
     $email = $_POST['email'];
     if (!filter_var($email, FILTER_VALIDATE_EMAIL))
      $errors[]="<h2>Pls enter a valid email</h2>";
//password check
     $pass=$_POST['psw'];
     $password=$_POST['psw_repeat'];
     if($pass == $password){
          // password_hash ( string $password , int $algo [, array $options ] ) : string
          //md5(mysqli_real_escape_string($connect, $_POST["member_password"]));
          $hash = password_hash($pass, PASSWORD_DEFAULT);
     } else{
       $errors[]="<h2>Passwords do not match</h2>";
     }



     // No errors...do database work
     if(sizeof($errors)==0)
     {
     //call database connection function
      $pdo = & dbconnect();
//
      $sql="INSERT INTO user_info (username, name, email, password) values (?,?,?,?)";
      $pdo->prepare($sql)->execute([$username, $name, $email, $hash]);

//Use pdo to call the id
      $_SESSION['user_id'] = $pdo->lastInsertId();
      // $_SESSION['user'] = $username;

     header("Location: index.php");
   }


     foreach ($errors as $error)
       echo $error;
 }
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Account";
    include 'includes/head_includes.php';
  ?>
</head>
<body>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "Account";
        $HEADING_TWO = "Account Settings";
        include 'includes/header.php';
      ?>
    </header>
   <aside class="otherAside">
     <nav>
       <ul>
         <li><a href="index.php">Home</a></li>
         <li><a href="account.php">Create Account</a></li>
         <li><a href="login.php">Login</a></li>
       </ul>
     </nav>
   </aside>
   <main class="otherMain">
     <h1 class="headingOne">Create Account</h1>
     Please fill in this form to create an account.
     <hr>
     <div id="input">
       <form class = "createaccount" id="createaccount" name="createaccount" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
       <div>
         <label for="username"><b>Username</b></label>
         <input type="text" placeholder="Enter Username" name="username" id= "username" required>

         <label for="name"><b>Name</b></label>
         <input type="text" placeholder="Enter Name" name="name" id="name" required>

         <label for="email"><b>Email</b></label>
         <input type="text" placeholder="Enter Email" name="email" id="email" required>
        <span class="noerror">You must enter an valid email</span>

         <label for="psw"><b>Password</b></label>
         <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

         <label for="psw-repeat"><b>Repeat Password</b></label>
         <input type="password" placeholder="Repeat Password" name="psw_repeat" id="psw_repeat" required>
       </div>
       <label>
         <input type="checkbox" checked="checked" name="remember" id="remember" value="Remember Me">
         <label for="remember">Remember Me</label>
       </label>

       <div class="clearfix">
         <input type="submit" name='create' class="createbtn" value="Create"/>
       </div>
     </form>
     </div>
   </main>
   <footer>
     <span>&copy; 3420 Web Dev Inc.</span>
   </footer>
 </div>
</body>
</html>
