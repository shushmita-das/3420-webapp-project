
<?php
//IT WORKS!!!
//include library here
include "includes/library.php";
session_start();
if(!isset($_SESSION['user_id']))
{ //after getting id
  header("Location:login.php");
  exit();
}

$pdo = & dbconnect();//connection to db
//getting user_id and movie_id
$user_id =$_SESSION['user_id'];
$movie_id = $_GET['movie_id'];

//getting query to edit specific movie
$query = "SELECT * FROM movie_info where movie_id= ? and user_id= ?";
$stmt=$pdo->prepare($query);
$stmt->execute([$movie_id, $user_id]);

//destroy session if errors founf
if(!$stmt)
die("Database pull did not return any data");

$row=$stmt->fetch();//fetching the specific movie to be edited
if(isset($_POST['editvid'])){
  //getting movie id to be edited
  $movie_id = $_GET['movie_id'];

//initializing variables to be changed in the database
  $errors=array();//

  $title=$_POST['title']?? null;

  $rating=$_POST['rating']?? null;

  //how to save genre Genre is an array
  $genrearray = $_POST['genre']??array();
  $genre = join(",", $genrearray);

  $mpa = $_POST['mpa_rating'] ?? null;

  $year=$_POST['year'];

  $runtime=$_POST['runtime']?? null;

  $theatre=$_POST['theatre_release']?? null;

  $dvdr=$_POST['dvd_release']?? null;

  $actor=$_POST['actor']?? null;

  $studio=$_POST['studio'] ?? null;

  $summary=$_POST['plot_summary'] ?? null;

//saving video_type as an array
  $vidarray = $_POST['video_type']??array();
  $vidtype = join(",", $vidarray);

  //file upload
  if(!is_uploaded_file($_FILES['cover']['tmp_name'])){
    // $pdo = & dbconnect();
    $query = "UPDATE movie_info set title=?,rating=?, genre=?, mpa_rating=?, year=?, runtime=?, theatre_release=?, dvd_release=?, actor=?, studio=?, plot_summary=?, video_type=? where movie_id=? and user_id=?";
    $pdo->prepare($query)->execute([$title, $rating, $genre, $mpa, $year, $runtime, $theatre, $dvdr, $actor, $studio, $summary, $vidtype, $movie_id, $user_id]);
    header("Location:index.php");
    }
    else{
     // echo "Check your connection pls";
     $newname = createFilename('cover', 'www_data/covers/', 'cover', $movie_id);
     //file upload is limited to 1MB, WEBROOT is a const defined in the library file
     checkAndMoveFile('cover', 10240000, WEBROOT.$newname);
//the query to add in in cover with all the other data fields
     $query = "UPDATE movie_info set title=?,rating=?, genre=?, mpa_rating=?, year=?, runtime=?, theatre_release=?, dvd_release=?, actor=?, cover=?, studio=?, plot_summary=?, video_type=? where movie_id=? and user_id=?";
     $pdo->prepare($query)->execute([$title, $rating, $genre, $mpa, $year, $runtime, $theatre, $dvdr, $actor, $newname, $studio, $summary, $vidtype, $movie_id, $user_id]);

     header("Location:index.php");
   }
 }
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    $PAGE_TITLE = "Edit Video";
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
      <form enctype="multipart/form-data" id="addvidform" name="editvidform" action="<?php echo $_SERVER['PHP_SELF']."?".$_SERVER['QUERY_STRING'];?>" method="post" enctype="multipart/form-data">

        <div>
         <label for="title">Title:</label>
         <input type="text" name="title" id="title" value="<?php echo $row['title']?>"required />
        </div>

        <div>
          <label for="rating">Rating:</label>
          <select name="rating" id="rating">
            <option value="0">Select One</option>
            <option value="1">One star</option>
            <option value="2">Two star</option>
            <option value="3">Three star</option>
            <option value="4">Four star</option>
            <option value="5">Five star</option>
          </select>
        </div>

        <div>
          <label for="genre">Genre:</label>
          <select name="genre[]" id="genre" multiple="multiple">
            <option value="Comedy">Comedy</option>
            <option value="Horror">Horror</option>
            <option value="Drama">Drama</option>
          </select>
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
        </fieldset>

        <div>
          <label for="year">Year:</label>
          <input type="text" name="year" id="year" placeholder="yyyy" value="<?php echo $row['year']?>"/>
        </div>

        <div>
          <label for="runtime">Run Time:</label>
          <input type="text" name="runtime" id="runtime"value="<?php echo $row['runtime']?>"/>
        </div>

         <div>
           <label for="theatre">Theatre Release:</label>
           <input type="date" for="datepickerth" name="theatre_release" id="datepickerth" value="<?php echo $row['theatre_release']?>" required />
         </div>

          <div>
            <label for="dvd">DVD Release:</label>
            <input type="date" for="datepickerdvd" name="dvd_release" id="datepickerdvd" value="<?php echo $row['dvd_release']?>" required/>
          </div>

          <div>
            <label for="actor">Actors:</label>
            <input type="text" name="actor" id="actor" value="<?php echo $row['actor']?>"/>
          </div>

           <div>
             <input type="hidden" name="MAX_FILE_SIZE" value ="10240000" />
            <label for="cover">Cover:</label>
            <input type="file" name="cover" id="cover"/>
           </div>

           <div>
            <label for="studio">Studio:</label>
            <input type="text" name="studio" id="studio" value="<?php echo $row['studio']?>" />
           </div>

           <div>
            <label for="summary">Plot Summary:</label>
            <!--<pattern="[A-Za-z-0-9]+\s[A-Za-z-'0-9]+" required />-->
            <textarea name="plot_summary" id="summary" cols="50" rows="6" value="<?php echo $row['plot_summary']?>"></textarea><span id="count">2500</span> Remainings
           </div>

           <fieldset>
             <legend>Video Type</legend>

             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkDVD"  value="DVD"/>
               <label for="checkDVD">DVD</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkBlueray"  value="Blueray"/>
               <label for="checkBlueray">Blueray</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="checkDigitalHD"  value="DigitalHD(1080p)"/>
               <label for="checkDigitalHD">Digital HD (1080P)</label>
             </div>
             <div class="checkbox">
               <input type="checkbox" name="video_type[]" id="check4K"  value="HD 4K"/>
               <label for="check4K">HD 4K</label>
             </div>
           </fieldset>
        <div>
          <input type="submit" class="editvid" name="editvid" value="Edit Video"/>
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
