<?php

include_once("db.php");

$jsondata = file_get_contents("php://input");
$data = json_decode($jsondata);

insertNewExercise($data);
