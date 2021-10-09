<?php
session_start();
if(!isset($_SESSION['login'])) {
	//echo "Session-login not set"; die;
	header('LOCATION:/index.php'); die();
}
if (!isset($_SESSION['CREATED'])) {
	//echo "Session-created not set"; die;
	header('LOCATION:/index.php'); die();
} else if (time() - $_SESSION['CREATED'] > 172800) { // session started more than 2 days ago
	session_regenerate_id(true);    // change session ID for the current session and invalidate old session ID
	$_SESSION['CREATED'] = time();  // update creation time
	echo "Session-too old"; die;
}
?>
<?php
header("X-Accel-Redirect: /protected/playlist.mpd");
header('Content-type: application/dash+xml');
?>
