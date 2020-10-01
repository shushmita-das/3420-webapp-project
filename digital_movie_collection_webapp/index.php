index.php

<?php
// IT WORKS!!!
session_start();
if(!isset($_SESSION['user_id'])){//after getting user id
  header("Location:login.php");
  exit();
} else{
  include 'includes/library.php';//including library.php that does the database connection stuff
  $pdo = & dbconnect();//connecting to database
  $user_id = $_SESSION['user_id'];//getting user id from session start

  //query for displaying all the movies added in by the user from the movie_info table in database
  $query = "SELECT * FROM movie_info where user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$user_id]);

  //destroy database session when any error found abouve
  if(!$stmt){
  die("Database pull did not return any data");

  }
  $row=$stmt->fetch();//the 1st item added by the user after creating doesnt display
  //as the fetch get all the information excluding the 1st one. I tried to include the 1st one but failed.

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Index";
    include 'includes/head_includes.php';
  ?>

</head>
<body>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "Index";
        $HEADING_TWO = "Collection library";
        include 'includes/header.php';
      ?>
    </header>
   <aside>
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
   <main>
     <div class="thumbnails">
       <table class="image">
         <!--Image source: https://images-na.ssl-images-amazon.com/images/I/51TySijKc3L._SX342_.jpg-->
         <!--Image source: https://m.media-amazon.com/images/M/MV5BNDYyNzYxNjYtNmYzMC00MTE0LWIwMmYtNTAyZDBjYTIxMTRhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_.jpg -->
         <!--Image source: https://images-na.ssl-images-amazon.com/images/I/91JUCF0OONL._SY445_.jpg -->
         <!--Image source: https://images-na.ssl-images-amazon.com/images/I/71aYephNm9L._SY606_.jpg -->
         <!--Image source: https://artsmargaretriver.com/wp-content/uploads/2014/01/Frozen-movie-poster.jpg-->
         <!--Image source: https://scdn.nflximg.net/images/2919/11722919.jpg-->
         <!--Image source: https://m.media-amazon.com/images/M/MV5BNjRlZmM0ODktY2RjNS00ZDdjLWJhZGYtNDljNWZkMGM5MTg0XkEyXkFqcGdeQXVyNjAwMjI5MDk@._V1_.jpg-->
         <!--Image source: https://www.sonypictures.com/movies/venom/assets/images/onesheet.jpg-->
         <!--Image source: https://images-na.ssl-images-amazon.com/images/I/91%20VySrmrfL._RI_.jpg-->
         <!--Image source: https://superclub.videotron.com/media/catalog/product/cache/image/500x711/e9c3970ab036de70892d86c6d221abfe/v/a/vaavengers_infinity_war_dvd_3d.jpg -->
         <!--Image source: https://i.pinimg.com/originals/7c/03/24/7c03246acad7da8b12edc6f51fc38fd9.jpg-->
         <!--Image source: https://i.pinimg.com/originals/50/d3/46/50d3466030af79f03a1a3a34a087eab2.jpg-->

         <!-- <tr> -->
           <div class="row">

             <tr>
               <?php
               $loop=0;//for displaying movie items in a row in multiples of 4 then moving on to new row
               foreach ($stmt as $row):?>
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
