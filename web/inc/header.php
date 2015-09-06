<?php

function load_head() {

echo <<<EOT
<!doctype html>
<html ng-app="CompApp">
<head>
<meta charset="utf-8">
<title>Comp</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<script src="libs/angular.min.js"></script>
<script src="libs/angular-sanitize.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="js/script.js"></script>

</head>
<body ng-controller="compCtrl">

<div id="content">

<h1>Comp</h1>

EOT;

}
