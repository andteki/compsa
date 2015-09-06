<?php
require_once(realpath(dirname(__FILE__) . "/../../inc/db.php"));

function insertNewExercise($data) {
	$sql = "INSERT INTO exercises SET topic = \"{$data->topic}\",  exercise = \"{$data->exercise}\", enable = \"{$data->enable}\"";
	$mysqli = connectDb();
	$mysqli->query($sql);
	echo $mysqli->insert_id;
	closeDb($mysqli);
}

function getExercise($exerciseId) {
	
}
