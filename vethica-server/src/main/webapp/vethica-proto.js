
var app = angular.module('app', ['jaydata']);

app.controller('ProprioEditorController', ['$scope', '$data', '$log', function($scope, $data, $log) {
  var DB;
	$log.log("init variables");

	$scope.proprio_list = false;
	$scope.proprio_add  = false;
	$scope.proprios = [];
	$scope.vetos    = [];
	
  $data.initService('Vethica.svc')
  .then(function (result) {
		$log.log("init service ok");
    DB = result;
  });

  $scope.fn_proprio_list = function () {
  	$scope.proprio_list = true;
		$scope.proprio_add  = false;
		$log.log("demande de liste");
    $scope.proprios = DB.proprios.toLiveArray();
	};	
			
/*
	$scope.fn_proprio_get = function (){
		$scope.proprios = DB.proprios.filter( function (prop) {
			return prop.Id == this.Id;} , { Id: $scope.proprio_id}).toLiveArray() ;
	}	
*/

	// regarder filter.map ....
	//
	$scope.fn_proprio_get = function (){
		$scope.proprios = [];
//		$scope.proprios = DB.proprios.filter( function (prop) {return prop.Id == this.Id;} , { Id: $scope.proprio_id}).toArray(
		DB.proprios.filter( function (prop) {return prop.Id == this.Id;} , { Id: $scope.proprio_id}).toArray(
		{
                success: function (items) {
								if (items.length == 0)
								{
										$scope.result_search = " Inexistant";
										$scope.$apply();
								}
								else
								{
										$scope.result_search = "Success";
                    $log.log("items received:", items.length);
										$scope.proprios.push(items[0]);
										$scope.proprio_add = true;
										$scope.proprio_list = false;
										$scope.action_on_proprio = "Update";
										$scope.fieldProprioNom = items[0].Nom;
										$scope.fieldProprioPrenom = items[0].Prenom;
                    $log.log(items);
										$scope.$apply();
								}
								
                },
                error: function (err) {
										$scope.result_search = "Raté";
                    $log.log("Errors occured:", err);
										$scope.$apply();
                }
		})
		};
		

	
  $scope.fn_proprio_add = function () {
  	$scope.proprio_list = false;
  	$scope.proprio_add = true;
		$scope.action_on_proprio = "Save";
		$log.log("Ouverture form add de proprio");
	};	
	
  $scope.fn_proprio_save = function () {
		if ($scope.action_on_proprio == "Save")
		{
			var newProp = new DB.proprios.proprio( );
			newProp.Nom = $scope.fieldProprioNom;
			newProp.Prenom = $scope.fieldProprioPrenom;
			DB.proprios.add(newProp);
		}
		else
		{
			proprio = $scope.proprios[0];
			var aze = proprio.entityState;		
			DB.proprios.attach(proprio);			
			proprio.Nom = $scope.fieldProprioNom;
			proprio.Prenom = $scope.fieldProprioPrenom;
			proprio.entityState = $data.EntityState.Modified;		
			var aze2 = proprio.entityState;		
			$log.log("change state");
			
			// update
		}
		
		$scope.saveChanges();	
  	$scope.proprio_list = false;
  	$scope.proprio_add = false;
		$log.log("Save de proprio");
	};	
	
	
  $scope.fn_proprio_remove = function (curproprio) {
		$log.log("dans le remove");
		DB.proprios.remove(curproprio);
		$scope.saveChanges();
	};	
  
  $scope.saveChanges = function () {
		$log.log("dans saveChanges");
    DB.saveChanges()
    .then(function () {
      $scope.selectedProduct = null;
    },function() {
      DB.stateManager.reset();
    });
  };  
  }]) ;

