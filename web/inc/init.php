<?php

require_once(realpath(dirname(__FILE__) . "/../../config/config.php"));
require_once("header.php");
require_once("footer.php");
require_once("db.php");
require_once("sform.php");

function loadView() {
	global $app;
	load_head();
	
	$mysqli = connectDb();
	$ids = getEnableds($mysqli);
	$teacherNames = getTeacherNames($mysqli);
	
	showStudentForm($ids, $teacherNames);
	
	closeDb($mysqli);	
	
	load_foot();	
}
