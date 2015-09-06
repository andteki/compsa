<?php

require_once(realpath(dirname(__FILE__) . "/../../config/config.php"));
require_once("db.php");

$postdata = file_get_contents("php://input");
$request = json_decode($postdata);

$mysqli = connectDb();
$sor = getPassword($mysqli, $request->exerciseId);

print(json_encode($sor));
closeDb($mysqli);
