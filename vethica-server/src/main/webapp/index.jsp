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
	<h2>Proprio !!!s</h2>
      <li ng-repeat="proprio in proprios">
	  <p>
        <label>Id</label> : <span >{{proprio.Id}}</span>
        <label>nom</label> : <span >{{proprio.Nom}}</span>
        <label>prenom</label> : <span >{{proprio.Prenom}}</span>
		<button ng-click="remove(proprio)">Remove</button>		
      </p>
	  </li>
  
	<h2>Vétos</h2>
	<li ng-repeat="veto in vetos">
        <p><label>Id</label> : <span >{{veto.Id}}</span>
        <label>N°</label> : <span >{{veto.NuOrdre}}</span>
        <label>nom</label> : <span >{{veto.Nom}}</span>
        <label>Ville</label> : <span >{{veto.Ville}}</span></p>
        <label>Code postal</label> : <span >{{veto.Codpost}}</span></p>
     </li>
    	  
    </ul>

<!--	
	
<form ng-if="selectedProprio">
  <fieldset>
    <legend>{{selectedProprio.Nom}}</legend>
    <label><span>ID:</span><span>{{selectedProprio.Id}}</span></label>
    <label><span>Nom</span><input ng-model="selectedProprio.Nom" /></label>
    <label><span>Prenom</span><input ng-model="selectedProprio.Prenom" /></label>
    <button ng-click="save()">Save</button>
  </fieldset>
</form>

  <div ng-controller="ProprioSearchController">
		<input type="text" ng-model="proprio_id" />  
		<button ng-click="getProprio()">Cherche</button>{{result_button}}
		<p><label>nom trouvé </label> : <span >{{proprio.Nom}}</span></p>
        <p><label>prenom trouvé </label> : <span >{{proprio.Prenom}}</span></p>
  </div>
-->	
	
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
  $scope.proprios = [];

  $data.initService('Vethica.svc')
  .then(function (result) {
    $scope.result = result;
    $scope.proprios = result.proprios.toLiveArray();
    $scope.vetos = result.vetos.toLiveArray();
  })  ;

  $scope.remove = function (curproprio) {
		$log.log("dans le remove");
		$scope.result.proprios.remove(curproprio);
		$scope.saveChanges();
	};	
  
  $scope.saveChanges = function () {
    $scope.result.saveChanges()
    .then(function () {
      $scope.selectedProduct = null;
    },function() {
      $scope.result.stateManager.reset();
    });
  };  
  }]) ;


  
	

</script>