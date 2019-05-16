<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<link rel="stylesheet" href="style.css" type="text/css" />	
	<link rel="stylesheet" href="css/fontello.css" type="text/css" />

	
</head>
<?php 
session_start(); 
if(isset($_POST["id"]))
{	
 $connect = mysqli_connect("localhost", "root", "", "piwne_smaki");
 mysqli_query($connect, "SET CHARSET utf8");
mysqli_query($connect, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");

//saelecting content to subpages
 $query = "SELECT * FROM rodzaje WHERE id_rodzaju_skladnika = '".$_POST["id"]."'";
 $result = mysqli_query($connect, $query);
 $output = '';
 while($row = mysqli_fetch_array($result))
 {
  $output .= '
  <h1>'.$row["nazwa"].'</h1>
  <p>'.$row["opis"].'</p>
  <h3>Smak</h3>
  <p>'.$row["smak"].'</p>
  <h3>Kraj pochodzenia</h3>
  <p>'.$row["kraj_pochodzenia"].'</p>
  ';
 }
 echo $output;
}					//getting logged in user id 
                   $postid = $_POST["id"];
					if(isset($_SESSION['username'])){
					$query = "SELECT id_user FROM users WHERE username = '".$_SESSION['username']."'";
					$result = mysqli_query($connect, $query);
					$row = mysqli_fetch_array($result);
					
					$userid = $row['id_user'] ;

					
                    // Checking user status
                    $status_query = "SELECT count(*) as cntStatus,type FROM like_unlike WHERE userid=".$userid." and postid=".$postid;
                    $status_result = mysqli_query($connect,$status_query);
                    $status_row = mysqli_fetch_array($status_result);
                    $count_status = $status_row['cntStatus'];
                    if($count_status > 0){
                        $type = $status_row['type'];
                    }
					}
                    // Count post total likes and unlikes
                    $like_query = "SELECT COUNT(*) AS cntLikes FROM like_unlike WHERE type=1 and postid=".$postid;
                    $like_result = mysqli_query($connect,$like_query);
                    $like_row = mysqli_fetch_array($like_result);
                    $total_likes = $like_row['cntLikes'];

                    $unlike_query = "SELECT COUNT(*) AS cntUnlikes FROM like_unlike WHERE type=0 and postid=".$postid;
                    $unlike_result = mysqli_query($connect,$unlike_query);
                    $unlike_row = mysqli_fetch_array($unlike_result);
                    $total_unlikes = $unlike_row['cntUnlikes'];

            ?>

<body>
		
		 <div class="post-action">
<i class="icon-thumbs-up-alt"></i>
                            <input type="button" value="Like" id="like_<?php echo $postid; ?>" class="like" style="<?php if($type == 1){ echo "color: #ffa449;"; } ?>" />&nbsp;(<span id="likes_<?php echo $postid; ?>"><?php echo $total_likes; ?></span>)&nbsp;
<i class="icon-thumbs-down-alt"></i>
                            <input type="button" value="Unlike" id="unlike_<?php echo $postid; ?>" class="unlike" style="<?php if($type == 0){ echo "color: #ffa449;"; } ?>" />&nbsp;(<span id="unlikes_<?php echo $postid; ?>"><?php echo $total_unlikes; ?></span>)

                        </div>

</body>
</html>

<script>
$(document).ready(function(){

    // like and unlike click
    $(".like, .unlike").click(function(){
        var id = this.id;   // Getting Button id
        var split_id = id.split("_");

        var text = split_id[0];
        var postid = split_id[1];  // postid

        // Finding click type
        var type = 0;
        if(text == "like"){
            type = 1;
        }else{
            type = 0;
        }

        // AJAX Request
        $.ajax({
            url: 'likeunlike.php',
            type: 'post',
            data: {postid:postid,type:type},
            dataType: 'json',
			
			//On successful callback update total counts on the elements
            success: function(data){
                var likes = data['likes'];
                var unlikes = data['unlikes'];

                $("#likes_"+postid).text(likes);        // setting likes
                $("#unlikes_"+postid).text(unlikes);    // setting unlikes
				
				//Change color of the button based on the click
                if(type == 1){
                    $("#like_"+postid).css("color","#ffa449");
                    $("#unlike_"+postid).css("color","lightseagreen");
                }

                if(type == 0){
                    $("#unlike_"+postid).css("color","#ffa449");
                    $("#like_"+postid).css("color","lightseagreen");
                }
            }
        });
    });
});
</script>