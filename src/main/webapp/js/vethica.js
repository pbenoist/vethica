function animal_ctrl($scope){

    $scope.show_all = false;
	$scope.numero_puce= "123456789013245";
    $scope.animal_picture = "bchien.jpg";
    $scope.animal_race = "Pue des pattes";
    $scope.animal_birthday = "01/01/2000";
    $scope.animal_color = "Blanche";
    
    $scope.owner_name = "toto";
    $scope.owner_tel  = "01 02 03 04 05";

    $scope.animal_search = function(){
        $scope.show_all = true;
    };

    $scope.change_puce = function() {
        if ($scope.numero_puce.length < 15)
            $scope.show_all = false;
    };

    $scope.info_add = function(){
        $scope.infos.push({val:$scope.info_form, done:false});
    };
    
    $scope.getInfoCount = function(){
        return $scope.infos.length;
    };

    $scope.info_show = function($value){
        
        if ($value == 0)
        {
            return true;
/*
            $scope.clearFilter = function() {
            $scope.query = {};            
            };
*/
        }

        if ($value == 1)
        {
            $scope.infos =  _.filter($scope.infos, function(info){
            return !info.done;
           });
        }

        if ($value == 2)
        {
            $scope.infos =  _.filter($scope.infos, function(info){
            return info.done;
           });
        }

    };
    
}