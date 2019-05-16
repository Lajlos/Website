<?php
include('server.php');
$connect = mysqli_connect("localhost", "root", "", "piwne_smaki");
mysqli_query($connect, "SET CHARSET utf8");
mysqli_query($connect, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
$query = "SELECT * FROM rodzaje";
$result = mysqli_query($connect, $query);
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<meta charset="utf-8" />
	<title>Ciekawi smaków piwa!</title>
	<meta name="description" content="To nie blog o alkoholiźmie a o zrozumieniu i degustacji wspaniałych trunków Sprawdź czy znasz takie rodzaje piwa!"/>
	<meta name="keywords" content="piwo, ipa, stout, lager, pilzner, kozlak, piwo hybrydowe, ale, bitter, porter, porter baltycki, india pale ale,hefeweizen, witbier, grodziskie, belgisjkie mocne, barley wine, saison, lambic, piwa z dodatkami, historia piwa, jak zrobic piwo, top piwo, najlepsze piwo, slod, chmiel, jan heweliusz, kopyra z blog kopyra.com "/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="stylesheet" href="style.css" type="text/css" />
	
</head>

<body>
		<div id="logo">
			HELLO MY BEER
		</div>
		
	<div id="menu" >

        <div class="nav">
			<ol>
            <li><a href="index.php">Strona główna</a></li>
			<li><a href="login.php">Logowanie</a></li>
            <li><a href="register.php">Rejestracja</a></li>
			</ol>
        </div>			

	</div>

<div class="layout">
		

		<div class="home_content">
		<div class="header">
	
		<h2>Rejestracja</h2>
	</div>
	
	<form method="post" action="register.php">
		<?php include('errors.php'); ?>
		<div class="input-group">
			<label>Nick</label>
			<input type="text" name="username" value="<?php echo $username; ?>">
		</div>
		<div class="input-group">
			<label>Email</label>
			<input type="email" name="email" value="<?php echo $email; ?>">
		</div>
		<div class="input-group">
			<label>Hasło</label>
			<input type="password" name="password_1">
		</div>
		<div class="input-group">
			<label>Powtórz hasło</label>
			<input type="password" name="password_2">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="reg_user">Zarejestruj</button>
		</div>
		<p>
			Masz już konto? <a href="login.php">Zaloguj się</a>
		</p>
	</form>
		</div>
		<div>
		<span id="page_details"></span>
			</div>

			

	
</div>
			<div class="footer">
			Ciekawi smaków    &copy; All rights reserved   Powered by Damian Pilny & Wojciech Lindenheim-Locher
		</div>
</body>
</html>

<script>
 function load_page_details(id)
 {
	 //hides the content placed on the main page in the <div class="content">
	 $('.home_content').hide();

  $.ajax({
   url:"fetch.php",
   method:"POST",
   data:{id:id},
   success:function(data)
   {
    $('#page_details').html(data);
   }
  });
 }
 //determine the response to the click
 $('.navd li').click(function(){
  var id_rodzaju_skladnika = $(this).attr("id");
  load_page_details(id_rodzaju_skladnika);
 });
 
</script>