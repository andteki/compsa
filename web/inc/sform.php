<?php

function showStudentForm($ids, $teacherNames) {
	
echo <<<EOT
<div id="workbox" ng-hide="workbox">
<form action="fel.php">

<fieldset>
  <legend>Ismeretanyag felmérő rendszer</legend>
  
  <div class="description" ng-bind-html="description"></div>

<div class="selectionBox">

  <label>Tanár</label>
  <select class="form-control" ng-model="teacherName"
  ng-disabled="teacherNameDisabled">
EOT;

foreach($teacherNames as $name) {
	echo "<option>";
	echo $name;
	echo "</option>";
}

echo <<<EOT
  </select>

  <label for="exerciseId" class="exerciseIdDescription">Dolgozat azonosítója:</label>

  <select ng-click="getExercise()" ng-model="exerciseId" 
	ng-disabled="egy" class="form-control">

EOT;

foreach($ids as $id) {
	echo "<option>";
	echo $id;
	echo "</option>";
}

echo <<<EOT
  </select>




<br>




<label for="vnev">Téma:</label>
<input type="text" name="topic" id="topic" ng-model="topic" 
disabled class="form-control"/><br />



<button type="button" ng-click="enableComponent()" 
class="btn btn-default"
ng-disabled="egy">Megkezd</button>


<button type="button" ng-click="showAbout()" 
class="btn btn-default" id="aboutButton"
ng-disabled="egy">Névjegy</button>



</div>

<label for="name">Név:</label>
<input type="text" name="name" id="name" ng-model="name" 
ng-disabled="checked" class="form-control"
placeholder="Vezetéknév Keresztnév" 
/><br />

<label for="class">Osztály:</label>
<input type="text" name="class" id="class" ng-model="class" 
ng-disabled="checked" class="form-control"
placeholder="betűjel évfolyam"
/><br />

<label>Feladatok:</label>
<textarea rows="15" cols="80" id="f1" name="dolgozat" 
	ng-model="exercise" ng-disabled="checked" class="form-control">
</textarea>
<br>
<button ng-click="sendSolution()" type="button" 
class="btn btn-default">Beadom</button>
</form>
</div>


EOT;
	
}

