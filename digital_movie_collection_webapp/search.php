<?php

  include 'includes/library.php';

session_start();

if(!isset($_SESSION['user_id'])){//after getting user id
  header("Location:login.php");
  exit();
}

  if(isset($_POST['search'])){

       if(preg_match("/^[a-zA-Z]+/", $_POST['searchterm'])){
      $search = $_POST['searchterm'];
      //$search= mysql_real_escape_string($search);

      $pdo = & dbconnect();

      $userid = $_SESSION['user_id'];


      $sql = "SELECT * FROM movie_info Where user_id=? and title LIKE '%" .$search."%'";//prepare and execute she saidSELECT  ID, FirstName, LastName FROM Contacts WHERE FirstName LIKE '%" . $name .  "%' OR LastName LIKE '%" . $name ."%'";
      $stmt=$pdo->prepare($sql);
      $stmt->execute([$userid]);

      if(!$stmt)
      {
         die("Database pull did not return data");
      }

      $row= array();
      $row=$stmt;
      print_r($row);
   }

   }


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Search";
    include 'includes/head_includes.php';
  ?>
</head>
<body>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "Search";
        $HEADING_TWO = "Search for collection";
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
         <li><a href="search.php">Search</a></li>
         <li><a href="displaydetails.php?movie_id=<?php echo $row['movie_id'];?>">Display Details</a></li>
         <li><a href="logout.php">Logout</a></li>
       </ul>
     </nav>
   </aside>
   <main class>
     <form class = "row" method = "post">
     <div>
       <div>
         <label for="searchterm">Search:</label>
         <input type="text" name="searchterm" id="searchterm"  pattern="[A-Za-z-0-9]+\s[A-Za-z-'0-9]+" required />
       </div>
       <div>
         <button type="submit" name="search" class="searchbtn">Search</button>
       </div>
     </div>
   </form>
   <div class="row">

     <tr>
       <?php

       $loop=0;
      foreach ($stmt as $row):
         ?>
     <td>
     <figure class="moviepic">
       <img class="movieImg" src="<?php echo "/~shushmitadas/".$row['cover'] ?>" alt="<?php echo $row['title']; ?> cover"/>
       <figcaption class="caption"><?php echo $row['title']//output movie title name?></figcaption>
       <div class="icons">
         <a href="displaydetails.php?movie_id=<?php echo $row['movie_id'];?>"><i class="fas fa-info"></i></a>
         <a href="editvid.php?movie_id=<?php echo $row['movie_id'];?>"><i class="fas fa-edit"></i></a>
         <a class="deletevideo" href="deletevid.php?movie_id=<?php echo $row['movie_id'];?>"><i class="fas fa-trash-alt"></i></a>
       </div>
     </figure>
   <?php $loop++;
   if ($loop % 4 == 0){
     echo "</tr> <tr>";
   }
   ?>
 <!-- </tr> -->
<?php endforeach?>
</tr>
</table>
</div>

   </main>
   <footer>
     <span>&copy; 3420 Web Dev Inc.</span>
   </footer>
 </div>
</body>
</html>
