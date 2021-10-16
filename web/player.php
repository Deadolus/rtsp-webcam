<?php
session_start();
if(!isset($_SESSION['login'])) {
	//echo "Session-login not set"; die;
	header('LOCATION:index.php'); die();
}
if (!isset($_SESSION['CREATED'])) {
	//echo "Session-created not set"; die;
	header('LOCATION:index.php'); die();
} else if (time() - $_SESSION['CREATED'] > 172800) { // session started more than 2 days ago
	session_regenerate_id(true);    // change session ID for the current session and invalidate old session ID
	$_SESSION['CREATED'] = time();  // update creation time
	echo "Session-too old"; die;
}

// logout
if(isset($_POST['logout'])){
	session_destroy();
	header('Location: index.php');
}
?>
<html>
    <head>
	<title>Babycam</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<!--<link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">-->
<link href="https://vjs.zencdn.net/7.14.3/video-js.css" rel="stylesheet" />
		<style>
#html body .page {
#	height: 100%;
#	width: 100%;
#}
		#video {
		#	width: 95%;
		#}
		.wrapper {
			width: 50%;
			margin: auto;
		}
		@media (max-width: 800px) {
		.wrapper {
			width: 95%;
			margin: auto;
		}
		}
		.grid-container {
			  display: grid;
			  width: 10%;
			  margin-left: 45%;
			  margin-top: 1em;
			  align-items: center;
			  gap: 10px;
		}
		.left {
			  justify-self: center;
			  grid-column: 1;
			  grid-row: 2;
		}
		.right {
			  justify-self: center;
			  grid-column: 3;
			  grid-row: 2;
		}
		.live {
			  justify-self: center;
			  grid-column: 0;
			  grid-row: 1;
		}
		.up {
			  justify-self: center;
			  grid-column: 2;
			  grid-row: 1;
		}
		.down {
			  justify-self: center;
			  grid-column: 2;
			  grid-row: 2;
		}
		.zoomin {
			  grid-column: 4;
			  grid-row: 1;
		}
		.zoomout {
			  grid-column: 4;
			  grid-row: 2;
		}
		.btn-logout {
			  float: right;
		}


		</style>
    </head>
    <body>
<form method='post' action="">
	    <input type="submit" value="Logout" class="btn btn-secondary btn-logout" name="logout">
	</form>
		<div class="page">
			<div class="wrapper">
				<h1>Camera</h1>
				<h3>
<?php
	echo "Session created at: ".strval($_SESSION['CREATED']).", age:".(time() - $_SESSION['CREATED']);   // update creation time
?>
</h3>
				<!--<video data-dashjs-player autoplay controls type="application/dash+xml"></video>-->
<video id=example-video  class="video-js vjs-fluid vjs-default-skin" preload="auto" controls> </video>
			</div>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<!--<script src="https://unpkg.com/video.js/dist/video.js"></script>-->
<script src="https://vjs.zencdn.net/7.14.3/video.min.js"></script>
  <script src="https://unpkg.com/@videojs/http-streaming/dist/videojs-http-streaming.js"></script>
<script>
var playlist="protected/download.mpd";
  var player = videojs('example-video', {liveui: true});
  <!--var player = videojs('example-video');-->
  player.src({ src: playlist, type: 'application/dash+xml'});
    player.play();
  </script>

<script>
//function to send commands via webhook to HASS, so it will move the camera
function cameraXhr(direction) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "https://yourHASSsite/api/webhook/webcamera", true);
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.send(JSON.stringify({
	direction: direction
	}));
}
</script>
	<div class="grid-container" >
		<div class="grid-item live" >  <button type="button" class="btn btn-secondary" onclick="player.liveTracker.seekToLiveEdge()">Live</button> </div>
		<div class="grid-item up" >  <button type="button" class="btn btn-primary" onclick="cameraXhr('up')">up</button> </div>
		<div class="grid-item left" ><button type="button" class="btn btn-primary" onclick="cameraXhr('left')">left</button> </div>
		<div class="grid-item down"> <button type="button" class="btn btn-primary" onclick="cameraXhr('down')">down</button> </div>
		<div class="grid-item right"><button type="button" class="btn btn-primary" onclick="cameraXhr('right')">right</button> </div>
		<!--<div class="grid-item zoomin"><button type="button" class="btn btn-primary" onclick="cameraXhr('zoomin')">Zoom in</button> </div>
		<div class="grid-item zoomout"><button type="button" class="btn btn-primary" onclick="cameraXhr('zoomout')">Zoom out</button> </div>-->
	</div>
    </body>
</html>
