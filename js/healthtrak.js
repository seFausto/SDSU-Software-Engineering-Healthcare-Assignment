angular.module('healthtrak', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/patient_records', {templateUrl: 'http://localhost:8888/healthtrak/angular_templates/patient_records.html', controller: patientRecordsController}).
      when('/patient_records/:pid', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/single_patient_record.html', controller : singlePatientRecordController})
}]);