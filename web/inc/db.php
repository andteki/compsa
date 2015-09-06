<?php

require_once(realpath(dirname(__FILE__) . "/../../config/config.php"));

function connectDb() {
	global $db;
	$mysqli = new mysqli($db['host'], $db['user'], $db['pass'], $db['dbname']);
	if($mysqli->connect_error)
		die("Hiba a kapcsolódás során (" . $mysqli->connect_errno . ")"
		. $mysqli->connect_error);
	$mysqli->set_charset("utf8");	
	return $mysqli;	
}

function closeDb($mysqli) {
	$mysqli->close();
}

function getEnableds($mysqli) { 
	$ids = array();
	
	$sql = "SELECT id, enable FROM `exercises`";
	if($result = $mysqli->query($sql)) {
		while($sor = $result->fetch_assoc()) {
			if($sor["enable"] == "1") {
				array_push($ids, $sor["id"]);
			} 
		}
		$result->free();
	}else {
		echo "Lekérés hiba";
	}
	return $ids;
}

function getPassword($mysqli, $id) { 
	$password = "";
	
	$sql = "SELECT id, pass FROM `exercises` WHERE id=$id";
	if($result = $mysqli->query($sql)) {
		while($sor = $result->fetch_assoc()) {
			if(strlen($sor["pass"]) > 0) {
				$password = $sor["pass"];
			} 
		}
		$result->free();
	}else {
		echo "Lekérés hiba";
	}
	return $password;
}

function sendExercise($mysqli, $id) {	
	$sql = "SELECT * FROM `exercises` where id=$id";
	if($result = $mysqli->query($sql)) {
		$sor = $result->fetch_assoc();		
		$result->free();
	}else {
		echo "Lekérés hiba";
	}
	return $sor;
}

function insertSolution($mysqli, $data) {
	$sql = "INSERT INTO solvings SET studentName = \"{$data->studentName}\", solving = \"{$data->solving}\", class = \"{$data->class}\", topic = \"{$data->topic}\", ip = \"{$_SERVER['REMOTE_ADDR']}\", exerciseId = \"{$data->exerciseId}\", teacherName = \"{$data->teacherName}\"";
	$mysqli = connectDb();
	//~ dblog($mysqli, "sql: $sql");	
	$mysqli->query($sql);
	closeDb($mysqli);	
}

function dblog($mysqli, $msg) {	
	$sql = "INSERT INTO slog SET msg = '$msg'";
	$mysqli->query($sql);	
}


function getTeacherNames($mysqli) {
	$teacherNames = array();
	
	$sql = "SELECT teacherName FROM `teachers` WHERE enable = 1";
	if($result = $mysqli->query($sql)) {
		if(mysqli_num_rows ( $result )>0) {
			while($sor = $result->fetch_assoc()) {			
				array_push($teacherNames, $sor["teacherName"]);			 
			}
		}else {
			dblog($mysqli, "Lekérési hiba! Nincs tanár felvéve!");
		}
		$result->free();
	}else {		
		echo "Lekérés hiba";
	}
	return $teacherNames;
}
