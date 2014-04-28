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
  label.cl_proprio_list {
    font-weight: bold;
  }
  label.cl_proprio_add {
    font-weight: bold;
		display: inline-block;
    width: 100px;
		color: red;
  }
	
	.TFtable{
		width:50%; 
		border-collapse:collapse; 
	}
	.TFtable td{ 
		padding:7px; border:#4e95f4 1px solid;
	}
	
	
  
	</style>
</head>
<body data-ng-app="app">
  <div ng-controller="ProprioEditorController" ng-cloak>

<!--	
  <ul>       
-->
	<h1>On CRUD road...</h1>
	<h2>Proprios</h2>
	<button ng-model="proprio_list" ng-click="fn_proprio_list()">Liste</button>		
	<button ng-model="proprio_add"  ng-click="fn_proprio_add()">Ajout</button>		
	<input type="text" ng-model="proprio_id" />  
	<button ng-click="fn_proprio_get()">Cherche</button>{{result_search}}

<!--	
	<div ng-show=proprio_list>
    <li ng-repeat="proprio in proprios">
	  <table>
      <label class="cl_proprio_list">Id</label> : <span >{{proprio.Id}}</span>
      <label class="cl_proprio_list">nom</label> : <span >{{proprio.Nom}}</span>
      <label class="cl_proprio_list">prenom</label> : <span >{{proprio.Prenom}}</span>
			<button ng-click="fn_proprio_remove(proprio)">Remove</button>		
	  </table>
	  </li>
	</div>
  </ul>
-->

	<div ng-show=proprio_list>
	<table class="TFtable">
	<tr>
		<th>ID</th>
		<th>Nom</th>
		<th>Prenom</th>
	</tr>
    <tbody ng:repeat="proprio in proprios">
        <tr>
				<td width="10%">{{proprio.Id}}</td>
				<td width="40%">{{proprio.Nom}}</td>
				<td width="40%">{{proprio.Prenom}}</td>
				<td width="10%"><button ng-click="fn_proprio_remove(proprio)">Remove</button>		</td>
				</tr>
    </tbody>
	</table>
	</div>

	

	<form ng-show="proprio_add">
  <fieldset >
    <p><label class="cl_proprio_add"><span>Nom</span><input ng-model="fieldProprioNom" /></label></p>
    <p><label class="cl_proprio_add"><span>Prenom</span><input ng-model="fieldProprioPrenom" /></label></p>
    <button ng-click="fn_proprio_save()">{{action_on_proprio}}</button>
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
<script src="vethica-proto.js"></script>

