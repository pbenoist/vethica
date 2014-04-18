<%@page contentType="text/html" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>buildhub + angular + odata</title>
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
<body data-ng-app="buildhubApp">
  <div ng-controller="BuildController">
    <ul ng-cloak>       
      <li ng-repeat="build in builds">
        <label>id</label>  <span >{{build.Id}}</span>
        <label>gav</label> <span >{{build.Gav}}</span>
      </li>
    </ul>
  </div>
</body>
</html>

<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
<script src="https://code.angularjs.org/1.3.0-beta.5/angular.js"></script>

<script src="datajs-1.1.2.js"></script>
<script src="jaydata.js"></script>
<script src="jaydatamodules/angular.js"></script>

<script type="text/javascript">

var buildhub = angular.module('buildhubApp', ['jaydata']);

function BuildController($scope, $data) {
  $scope.builds = [];

  $data.initService('/runciter/BuildHub.svc')
  .then(function (buildhub_odata) {
    $scope.builds = buildhub_odata.Builds.toLiveArray();
  });
}

</script>