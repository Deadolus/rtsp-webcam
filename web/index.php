<?php
session_start();
#echo isset($_SESSION['login']);
if(isset($_SESSION['login'])) {
	header('LOCATION:player.php'); die();
}
?>
<!DOCTYPE html>
<html>
   <head>
     <meta http-equiv='content-type' content='text/html;charset=utf-8' />
     <title>Login</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   </head>
<body>
  <div class="container">
    <h3 class="text-center">Welcome stranger</h3>
<?php
$user = "Asleep-Coronary-Kinfolk9"; //your user here
$pass = "Outflank-Pointer-Starship2"; //your password here
if(isset($_POST['submit'])){
	$username = $_POST['username']; $password = $_POST['password'];
	if($username === $user && $password === $pass ){
		$_SESSION['CREATED'] = time();  // update creation time
		$_SESSION['login'] = true; header('LOCATION:player.php'); die();
	} {
	echo "<div class='alert alert-danger'>Username and Password do not match.</div>";
		}

}
?>
    <form action="" method="post">
      <div class="form-group">
	<label for="username">Username:</label>
	<input type="text" class="form-control" id="username" name="username" required>
      </div>
      <div class="form-group">
	<label for="pwd">Password:</label>
	<input type="password" class="form-control" id="pwd" name="password" required>
      </div>
      <button type="submit" name="submit" class="btn btn-primary">Login</button>
    </form>
  </div>
</body>
</html>

