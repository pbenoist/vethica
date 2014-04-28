<%@page contentType="text/html" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>angular + odata</title>
  <style type="text/css">
  [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
    display: none !important;
  }
  body {
    font-family: monospace !important;
  }
  ul {
    list-style-type: none;
  }
  label {
    font-weight: bold;
  }
  </style>
</head>
<body data-ng-app="app">
  <div ng-controller="ProprioEditorController">
  <ul ng-cloak>       
	
	<h2>Proprios</h2>
	<button ng-model="proprio_list" ng-click="fn_proprio_list()">Liste</button>		
	<button ng-model="proprio_add"  ng-click="fn_proprio_add()">Ajout</button>		
	<input type="text" ng-model="proprio_id" />  
	<button ng-click="fn_proprio_get()">Cherche</button>{{result_search}}
	
	<div ng-show=proprio_list>
    <li ng-repeat="proprio in proprios">
	  <p>
      <label>Id</label> : <span >{{proprio.Id}}</span>
      <label>nom</label> : <span >{{proprio.Nom}}</span>
      <label>prenom</label> : <span >{{proprio.Prenom}}</span>
			<button ng-click="fn_proprio_remove(proprio)">Remove</button>		
    </p>
	  </li>
	</div>
	
  </ul>
	

	<form ng-show="proprio_add">
  <fieldset>
    <label><span>Nom</span><input ng-model="fieldProprioNom" /></label>
    <label><span>Prenom</span><input ng-model="fieldProprioPrenom" /></label>
    <button ng-click="fn_proprio_save()">Save</button>
  </fieldset>
</form>
	
  </div>
</body>
</html>

<script src="http://code.jquery.com/jquery-2.1.0.js"></script>
<script src="http://code.angularjs.org/1.3.0-beta.6/angular.js"></script>
<script src="datajs-1.1.2.js"></script>
<script src="http://include.jaydata.org/jaydata.js"></script>
<script src="http://include.jaydata.org/jaydatamodules/angular.js"></script>

<script type="text/javascript">

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

	$scope.fn_proprio_get = function (){
		$scope.proprios = [];
//		$scope.proprios = DB.proprios.filter( function (prop) {return prop.Id == this.Id;} , { Id: $scope.proprio_id}).toArray(
		DB.proprios.filter( function (prop) {return prop.Id == this.Id;} , { Id: $scope.proprio_id}).toArray(
		{
                success: function (items) {
								if (items.length == 0)
								{
									$scope.result_search = "Raté";
										$scope.$apply();
								}
								else
								{
										$scope.result_search = "Success";
                    $log.log("items received:", items.length);
										$scope.proprios.push(items[0]);
										$scope.proprio_list = true;
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
		$log.log("Ouverture form add de proprio");
	};	
	
  $scope.fn_proprio_save = function () {
		var newProp = new DB.proprios.proprio( );
	  newProp.Nom = $scope.fieldProprioNom;
	  newProp.Prenom = $scope.fieldProprioPrenom;
		DB.proprios.add(newProp);
//    DB.saveChanges();
		
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


  
	

</script>