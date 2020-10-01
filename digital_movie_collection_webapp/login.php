<?php
// IT WORKS!!!
include 'includes/library.php';
// $username="";
if(isset($_POST['login'])){
  $pdo = & dbconnect();

  $error=false;

  $username=$_POST['username'] ?? null;
  $password = $_POST['password'];


  //Database pull request
  $sql="SELECT * FROM user_info where username=?";

  $stmt=$pdo->prepare($sql);
  $stmt->execute([$username]);
  $row=$stmt->fetch();


  //Validates password
  if($row && password_verify($password, $row['password']))
  {
    session_start();
    $_SESSION['user_id'] = $row['user_id'];

    header("Location: index.php?id=".$id);
    exit();

  }
  else
  {
    $error=true;
    echo"Sorry! Something went wrong. We will look into it.";
  }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Login";
    include 'includes/head_includes.php';
  ?>
</head>
<body>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "Login";
        $HEADING_TWO = "Login to the website";
        include 'includes/header.php';
      ?>
    </header>
   <aside class="otherAside">
     <nav>
       <ul>
         <li><a href="account.php">Create Account</a></li>
            <li><a href="login.php">Login</a></li>
       </ul>
     </nav>
   </aside>
   <main class="otherMain">
     <div class=centerpoint>
       <form class = "input" name="login" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
         <div>
           <label class="login" for="username">Username:</label>
           <input type="text" name="username" id="username" placeholder="Enter Username" required />
         </div>
         <div>
           <label for="password">Password:</label>
           <input type="password" name="password" id="password" placeholder="Enter Password" required />
         </div>

       <div>
         <div>
         <input type="checkbox" name="agree" class="remember" checked="checked" value="Y"/>
         <label>Remember Me</label>
       </div>
       <div>
         <div class="forgot"><a href="#">Forgot Password?</a></div>
       </div>
     </div>
     <div class = "button">
       <input type="submit" class="login" name="login" value="Login"/>
       <input type="reset" class="reset" name="reset" value="Reset"/>
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
