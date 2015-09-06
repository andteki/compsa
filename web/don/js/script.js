

var compDonApp = angular.module("CompDonApp", []);
compDonApp.controller("compDonCtrl", function($scope, $http) {

	$scope.save = function() {
		$http.post("inc/save.php", {
			topic: $scope.topic,
			exercise: $scope.exercise,
			enable: $scope.enable
		})
		.success(function(data) {
			$scope.exerciseId = data;
		})
		.error(function() {
			alert("Hiba! A küldés nem sikerült!");
		});		
	}
	
	$scope.previousForm = function() {
		$http.post("inc/get.php", {
			exerciseId: $scope.exerciseId
		})
		.success(function(data) {
			
		})
		.error(function() {
			alert("Hiba! A küldés nem sikerült!");
		});				
	}
});
