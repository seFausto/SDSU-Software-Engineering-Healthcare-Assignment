angular.module('healthtrak', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/patient_records', {templateUrl: 'http://localhost:8888/healthtrak/angular_templates/patient_records.html', controller: patientRecordsController}).
      when('/patient_records/:pid', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/single_patient_record.html', controller : singlePatientRecordController}).
      when('/patient_history/:pid', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/patient_history.html', controller : patientHistoryController}).
      when('/add_patient', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/add_patient.html', controller : addPatientController}).
      when('/home', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/dashboard.html', controller: homeController}).
      otherwise({redirectTo: '/home'});
}])

.directive('htdatepicker', function() {
    return {
      restrict : 'A', //Attribute Only
      require : '?ngModel', 
      link : function postLink(scope, element, attributes, ngModel) {
        if(!ngModel)
          return false;

        function read(value) {
          ngModel.$setViewValue(value);
        }


        $(element).datepicker().on('changeDate', function(ev) {
          scope.$apply(read(ev.date.valueOf()))
        })
      }

    }
  })


.directive('htphysicians', function($http) {
    return {
      restrict : 'A', //Attribute Only
      require : '?ngModel', 
      link : function postLink(scope, element, attributes, ngModel) {
        if(!ngModel)
          return false;

        $http({method: 'GET', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/getPhysicians'}).
        success(function(data, status, headers, config) {
          scope.physicians = data;
          $(element).typeahead({
          source : scope.physicians

          }).on("change", function() {
            scope.$apply(read($(this).val()));
          })
        }).
        error(function(data, status, headers, config) {
          scope.physicians = [];
        });

        function read(value) {
          ngModel.$setViewValue(value);
        }


        
      }

    }
  })

