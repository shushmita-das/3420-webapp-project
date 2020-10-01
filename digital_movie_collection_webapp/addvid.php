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

  $errors=[];
 if(isset($_POST['addvid']))
 {
    $title=$_POST['title']?? null;

    $rating=$_POST['rating']?? null;


    $genrearray = $_POST['genre']??array();
    $genre = join(",", $genrearray);


    //how to save genre
    $mpa = $_POST['mpa_rating'] ?? array("empty");

    $year=$_POST['year'];
    if(!filter_var($year, FILTER_VALIDATE_INT))
    {
      $errors[]= "This isn't a valid year";
    }

    $runtime=$_POST['runtime']?? null;

    $theatre=$_POST['theatre_release']?? null;

    $dvdr=$_POST['dvd_release']?? null;

    $actor=$_POST['actor']?? null;
    //file upload


    $studio=$_POST['studio'] ?? null;

    $summary=$_POST['summary'] ?? null;

    $vidarray = $_POST['video_type']??array();
    $vidtype = join(",", $vidarray);

    $user_id = $_SESSION['user_id'];

    // No errors...do database work
   if(sizeof($errors)==0)
   {
   //call database connection function
    $pdo = & dbconnect();

    $sql="INSERT INTO movie_info (title, rating, genre, mpa_rating, year, runtime, theatre_release, dvd_release, actor, studio, plot_summary, video_type, user_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?)"; //movie details field
    $pdo->prepare($sql)-> execute([$title, $rating, $genre, $mpa, $year, $runtime, $theatre, $dvdr, $actor, $studio, $summary, $vidtype, $user_id ]); //edit this
    $movie_id=$pdo -> lastInsertId();

if(isset($_FILES['cover'])){
    $newname = createFilename('cover', 'www_data/covers/', 'cover', $movie_id);
    //file upload is limited to 1MB, WEBROOT is a const defined in the library file
    checkAndMoveFile('cover', 10240000, WEBROOT.$newname);

    $sql = "UPDATE movie_info set cover=? where movie_id=?";
    $pdo->prepare($sql)->execute([$newname,$movie_id]);
    header("Location:index.php");
}
  }else{
    echo "Check your connection pls";
  }
}
elseif (isset($_POST['reset'])) {
   // code...
}
   $_POST= array();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Add Video";
    include 'includes/head_includes.php';
  ?>
</head>
  <div id="container">
	  <header>
      <?php
        $HEADING_ONE = "My Vid Collections";
        $HEADING_TWO = "An individual video library";
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
          <li><a href="editvid.php?movie_id=<?php echo $row['movie_id'];?>">Edit Video</a></li>
          <li><a href="deletevid.php?movie_id=<?php echo $row['movie_id'];?>">Delete Video</a></li>
          <li><a href="search.php">Search</a></li>
          <li><a href="displaydetails.php?movie_id=<?php echo $row['movie_id'];?>">Display Details</a></li>
          <li><a href="logout.php">Logout</a></li>
        </ul>
      </nav>
   </aside>
    <main>
      <form class="addvid" enctype="multipart/form-data" id="addvidform" name="addvidform" action="addvid.php" method="post">

        <div>
         <label for="title">Title:</label>
         <input type="text" name="title" id="title" required />
        </div>

        <div>
          <label for="rating" class = "rating">Rating:</label>
          <select name="rating" id="rating">
            <option value="0">Select One</option>
            <option value="1">One star</option>
            <option value="2">Two star</option>
            <option value="3">Three star</option>
            <option value="4">Four star</option>
            <option value="5">Five star</option>
          </select>
            <span class="noerror">You must choose a rating</span>
        </div>

        <div>
          <label for="genre" class = "genre">Genre:</label>
          <select name="genre[]" id="genre" multiple="multiple">
            <option value="0">Comedy</option>
            <option value="1">Horror</option>
            <option value="2">Drama</option>
          </select>
          <span class="noerror">You must choose a genre</span>
        </div>

        <fieldset>
          <legend>MPA A Rating</legend>
          <div class="radiobutton">
          <input type="radio" name="mpa_rating" id="g" value="G" />
          <label for="g">G</label>
          <input type="radio" name="mpa_rating" id="pg" value="PG" />
          <label for="pg">PG</label>
          <input type="radio" name="mpa_rating" id="pg-13" value="PG-13" />
          <label for="pg-13">PG-13</label>
          <input type="radio" name="mpa_rating" id="r" value="R" />
          <label for="r">R</label>
          <input type="radio" name="mpa_rating" id="nc-17" value="NC-17" />
          <label for="nc-17">NC-17</label>
        </div>
          <span class="noerror">You must choose a MPA rating</span>
        </fieldset>

        <div>
          <label for="year">Year:</label>
          <input type="text" name="year" id="year" placeholder="yyyy"/>
        </div>

        <div>
          <label for="runtime">Run Time:</label>
          <input type="text" name="runtime" id="runtime"/>
        </div>

         <div>
           <label for="theatre">Theatre Release:</label>
           <input type="date" name="theatre_release" id="theatre" required />
         </div>

          <div>
            <label for="dvd">DVD Release:</label>
            <input type="date" name="dvd_release" id="dvd" />
          </div>

          <div>
            <label for="actor">Actors:</label>
            <input type="text" name="actor" id="actor" required />
          </div>

           <div>
            <label for="cover">Cover:</label>
            <input type="file" name="cover" id="cover"/>
           </div>

           <div>
            <label for="studio">Studio:</label>
            <input type="text" name="studio" id="studio" required />
           </div>

           <div>
            <label for="summary">Plot Summary:</label>
            <!--<pattern="[A-Za-z-0-9]+\s[A-Za-z-'0-9]+" required />-->
            <textarea name="summary" id="summary" cols="50" rows="6" required></textarea><span id="count">2500</span> Remaining
           </div>

           <fieldset>
             <legend>Video Type</legend>

             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkDVD" checked="checked" value="DVD"/>
               <label for="checkDVD">DVD</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkBlueray" checked="checked" value="Blueray"/>
               <label for="checkBlueray">Blueray</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkDigitalHD" checked="checked" value="DigitalHD"/>
               <label for="checkDigitalHD">Digital HD (1080P)</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="check4K" checked="checked" value="HD 4K"/>
               <label for="check4K">HD 4K</label>
             </div>
           </fieldset>
        <div>
          <input type="submit" class="addvid" name="addvid" value="Add Video"/>
          <input type="reset" class="reset" name="reset" value="Reset"/>
        </div>
      </form>
    </main>
    <footer>
      <span>&copy; 3420 Web Dev Inc.</span>
    </footer>
  </div>

</body>
</html>
