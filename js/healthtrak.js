angular.module('healthtrak', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/login', {templateUrl: 'angular_templates/login.html',   controller: loginController}).
      when('/patient_records', {templateUrl: 'angular_templates/patient_records.html', controller: patientRecordsController}).
      when('/patient_records/:pid', {templateUrl : 'angular_templates/single_patient_record.html', controller : singlePatientRecordController})
}]);