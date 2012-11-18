angular.module('healthtrak', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/patient_records', {templateUrl: 'http://localhost:8888/healthtrak/angular_templates/patient_records.html', controller: patientRecordsController}).
      when('/patient_records/:pid', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/single_patient_record.html', controller : singlePatientRecordController}).
      when('/patient_history/:pid', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/patient_history.html', controller : patientHistoryController}).
      when('/add_patient', {templateUrl : 'http://localhost:8888/healthtrak/angular_templates/add_patient.html', controller : addPatientController})
}]);

