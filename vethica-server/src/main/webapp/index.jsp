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
      <li ng-repeat="proprio in proprios">
        <label>nom</label>    <span >{{proprio.Nom}}</span>
      </li>
    </ul>
  </div>
</body>
</html>

<script src="http://code.jquery.com/jquery-2.1.0.js"></script>
<script src="http://code.angularjs.org/1.3.0-beta.5/angular.js"></script>
<script src="datajs-1.1.2.js"></script>
<script src="http://include.jaydata.org/jaydata.js"></script>
<script src="http://include.jaydata.org/jaydatamodules/angular.js"></script>

<script type="text/javascript">

var app = angular.module('app', ['jaydata']);

function ProprioEditorController($scope, $data) {
  $scope.proprios = [];

  $data.initService('<c:url value="/Vethica.svc"/>')
  .then(function (vethica) {
    $scope.proprios = vethica.Proprios.toLiveArray();
  });
}

</script>