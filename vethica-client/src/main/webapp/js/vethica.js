function animal_ctrl($scope){


    $scope.show_all = true;
    $scope.animal_mode_readonly = true;
    $scope.animal_modif_button_txt = "Modifier...";
    $scope.animal_class_intro = "animal_intro_read_only"
    
    $scope.owner_mode_readonly = true;
    $scope.owner_modif_button_txt = "Modifier...";
    $scope.owner_class_intro = "owner_intro_read_only"
    
    $scope.animal_picture = "bchien.jpg";
    $scope.animal_race = "Pue des pattes";
    $scope.animal_birthday = "01/01/2000";
    $scope.animal_color = "Blanche";
    
    $scope.owner_picture = "owner.jpg";
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

    $scope.animal_mode = function($value){
        return $scope.animal_mode_readonly;
    };
    $scope.owner_mode = function($value){
        return $scope.owner_mode_readonly;
    };
    
    $scope.animal_modif= function($value){
        if ($scope.animal_mode_readonly == true)
        {
            $scope.animal_mode_readonly = false;  
            $scope.animal_class_intro = "animal_intro_change"
            $scope.animal_modif_button_txt = "Enregistrer";
        }
        else
        {
            $scope.animal_mode_readonly = true;  
            $scope.animal_class_intro = "animal_intro_read_only"
            $scope.animal_modif_button_txt = "Modifier...";
        }
    };
    $scope.owner_modif= function($value){
        if ($scope.owner_mode_readonly == true)
        {
            $scope.owner_mode_readonly = false;  
            $scope.owner_class_intro = "owner_intro_change"
            $scope.owner_modif_button_txt = "Enregistrer";
        }
        else
        {
            $scope.owner_mode_readonly = true;  
            $scope.owner_class_intro = "owner_intro_read_only"
            $scope.owner_modif_button_txt = "Modifier...";
        }
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

function vet_action_ctrl($scope){

    $scope.vet_actions = [
{lib_action:'Vaccin rage',  date_action:'10/12/2012'},
{lib_action:'Infection virale', date_action:'10/01/2013'}
    ];
    
    $scope.vet_action_add = function(){
        $scope.vet_actions.push({lib_action:$scope.vet_action_form, date_action:false});
    };
    
}
