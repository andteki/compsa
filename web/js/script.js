
var compApp = angular.module("CompApp", ['ngSanitize']);

compApp.controller("compCtrl", ['$scope', '$http', function($scope, $http){
	
	$scope.checked = true;
	$scope.hiddenAboutBox = true;
	$scope.egy = false;
	var exercise = null;
	$scope.description = "Válaszd ki a megoldandó dolgozat számát.<br>" +
	"A \"Megkezd\" gomb lenyomásával kezd meg a feladat megoldását.";
	
	$scope.getExercise = function() {		
		$http.post("inc/sendExercise.php", {exerciseId:$scope.exerciseId})
		.success(function(data) {
			exercise = data["exercise"];
			$scope.topic = data["topic"];
		})
		.error(function() {
			alert("Hiba");
		});	
	}
	
	$scope.sendSolution = function() {
		
		if($scope.name == null) {
			alert("Nem adtál meg nevet!");
		}else if($scope.class == null) {
			alert("Nem adtál meg osztályt!");
		}else if($scope.teacherName == null){
			alert("Nem választottál tanárt!");
		}else {		
			$http.post("inc/acceptSolution.php", 
				{
					teacherName: $scope.teacherName,
					exerciseId: $scope.exerciseId,
					studentName: $scope.name, 
					class: $scope.class,
					solving: $scope.exercise,
					topic: $scope.topic				
				})
			.success(function(data) {
				$scope.exercise = data["exercise"];
				$scope.topic = data["topic"];
				$scope.name = "";
				$scope.class = "";
			})
			.error(function() {
				alert("Hiba! A küldés nem sikerült!");
			});
			$scope.workbox = true;
		}
		
	}

	$scope.enableComponent = function() {		
		if($scope.exerciseId == null) {
			alert("Nem választottál dolgozatot!");
		}else if($scope.teacherName == null ) {
			alert("Nem választottál tanárt");
		}else {
			
			var dolgozatMehet = false;			
			$http.post("inc/getpass.php", {exerciseId:$scope.exerciseId})
			.success(function(data) {
				password = angular.fromJson(data);
				
				if(password.length > 0) {					
					var inputPassword = window.prompt("A dolgozat jelszava: ");
					if(password == inputPassword) {
						dolgozatMehet = true;
					}else {
						alert("Hibás jelszó!");
					}
				}else {
					dolgozatMehet = true;
				}

				if(dolgozatMehet == true) {
					$scope.checked = false;
					$scope.egy = true;
					$scope.exercise = exercise;	
					$scope.teacherNameDisabled = true;
					$scope.description = "Old meg a lenti feladatot, majd mentsd el";
				}		
			})
			.error(function() {
				alert("Hiba");
			});
		}
	}
	
	$scope.showAbout = function() {
		$("#aboutBox").css({ "display": "block" });
		$scope.hiddenAboutBox = false;
	}
	$scope.hideAbout = function() {
		$scope.hiddenAboutBox = true;
	}
		
}]);



