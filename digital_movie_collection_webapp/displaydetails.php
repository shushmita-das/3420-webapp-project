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
  $query = "SELECT * FROM movie_info where movie_id= ? and user_id= ?";
  $stmt=$pdo->prepare($query);
  $stmt->execute([$movie_id, $user_id]);
  // $stmt->execute([$user_id]);

  if(!$stmt)
  die("Database pull did not return any data");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <?php
    $PAGE_TITLE = "Display Details";
    include 'includes/head_includes.php';
  ?>
</head>

<body>
  <div id="container">

    <header>
      <?php
        $HEADING_ONE = "My Vid Collection";
        $HEADING_TWO = "An individual video library";
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
      <form id="displaydetails" name="displaydetails" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
        <div>
          <?php foreach ($stmt as $row); //loop through result set?>
          <!-- <img class = "movieImg" src="img/italianJob.jpg" alt="Movie Reel Logo"/> -->
          <img class="movieImg" src="<?php echo "/~shushmitadas/".$row['cover'] ?>" alt="<?php echo $row['title']; ?> cover"/>
          <p><strong><?php $row['title']//output movie title name?></strong></p>

          <div class = "dvdtype">
            <ul>
              <li>DVD</li>
              <li>BluRay</li>
              <li>Digital SD</li>
              <li>Digital SD</li>
            </ul>
          </div>

          <div><strong>MPAA:</strong><?php echo $row['mpa_rating']//output movie mpaa rating name?> </div>
          <div><strong>Year:</strong><?php echo $row['year']//output movie title name?></div>
          <div><strong>Studio:</strong><?php echo $row['studio']//output movie studio name?></div>
          <div>
            <strong>Theatrical Release:</strong><?php echo $row['theatre_release']//output theatre release date?>
            <strong>Dvd Release:</strong><?php echo $row['dvd_release']//output movie studio name?>
          </div>
          <div><strong>Actors:</strong><?php echo $row['actor']//output movie studio name?></div>
          <div><strong>Genres:</strong><?php echo $row['genre']//output movie studio name?></div>

          <div><strong>Plot Summary:</strong><?php echo $row['plot_summary']//output movie studio name?></div>
        </div>
      </form>
    </main>

    <footer>
      <span>&copy; 3420 Web Dev Inc.</span>
    </footer>

  </div>
</body>
</html>
