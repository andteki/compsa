<?php

require_once(realpath(dirname(__FILE__) . "/../../../config/config.php"));
require_once(realpath(dirname(__FILE__) . "/../../inc/footer.php"));
require_once(realpath(dirname(__FILE__) . "/../../inc/db.php"));
require_once("tform.php");
require_once("header.php");

function loadDonView() {
	global $app;	
	load_head();
	
	echo $app["version"];
	
	$mysqli = connectDb();
	$ids = getEnableds($mysqli);
	
	showTeacherForm($ids);
	
	closeDb($mysqli);	
	
	load_foot();	
}
