function todo_ctrl($scope){

    $scope.infos = [
{id:1, code:'CD1', val:'Libellé cd1', done:false},
{id:2, code:'CD2', val:'Libellé cd2', done:false},
{id:3, code:'CD3', val:'Libellé cd3', done:false}
    ];
    


    $scope.info_add = function(){
        $scope.infos.push({val:$scope.info_form, done:false});
    };
    
    $scope.getInfoCount = function(){
        return $scope.infos.length;
    };

    $scope.info_unchecked = function($filter){
        
/*        $scope.infos = $filter('filter')($scope.infos, 'info.done');        */

        $scope.infos =  _.filter($scope.infos, function(info){
            return info.done;
           });

    };
    
}