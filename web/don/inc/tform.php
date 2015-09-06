<?php

function showTeacherForm($ids) {
	
echo <<<EOT
<div id="workbox" ng-hide="workbox">
<form action="fel.php">

<fieldset>
  <legend>Ismeretanyag felmérő rendszer - Tanári modul</legend>
  
  <div class="description">
  Új dolgozat készítése
  </div>





<div class="selectionBox">  




<button type="button" ng-click="previousForm()" 
class="btn btn-default" >Előző</button>

<button type="button" ng-click="nextForm()" 
class="btn btn-default" >Következő</button>

<button type="button" ng-click="newForm()" 
class="btn btn-default" >Új</button>

<button type="button" ng-click="listForm()" 
class="btn btn-default" >Lista</button>

<button type="button" ng-click="helpForm()" 
class="btn btn-default" >Segítség</button>



<button type="button" ng-click="showAbout()" 
class="btn btn-default" id="aboutButton"
ng-disabled="egy">Névjegy</button>

<br>

</div>



<label for="enable">Engedélyezve:</label>
<input type="checkbox" name="enable" value="enable" id="enable" 
class="form-control" ng-model="enable" />
<br />



<label for="exerciseId">Azonosítószám:</label>
<input type="text" name="exerciseId" id="exerciseId" ng-model="exerciseId" 
class="form-control" placeholder="Mentés után lesz azonosító"
disabled/><br />



<label for="topic">Téma:</label>
<input type="text" name="topic" id="topic" ng-model="topic" 
class="form-control"/><br />



<textarea rows="15" cols="80" id="f1" name="exercise" 
	ng-model="exercise" class="form-control">
</textarea>

<br>

<button ng-click="save()" type="button" 
class="btn btn-default">Ment</button>


</form>
</div>
EOT;
	
}

