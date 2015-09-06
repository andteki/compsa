<?php

function load_foot() {
	echo "<div class=\"writer\">Copyright (c) Sallai András, 2015</div>";
	
	echo "<div id=\"aboutBox\" ng-hide=\"hiddenAboutBox\" 
		 ng-click=\"hideAbout()\" ng-attr-display=\"valami\">
		
		Comp 1.0<br>
		Sallai András<br>
		Ismeretanyag felmérő rendszer<br>
		Copyright (c) Sallai András, 2015<br>
		Készült: jQuery és AngularJs felhasználásával.<br>
		A Comp MySQL adatbázisba dolgozik.<br>
		Weboldal: <a href=\"http://szit.hu\" target=\"_black\">http://szit.hu</a>
		
		</div>";

	echo "</div>";
	
	echo "\n</body>\n</html>";
}
