var healthtrakController = function($scope, $http) {
    
}

var loginController = function($scope, $http) {

} 

var patientRecordsController = function($scope, $http) {
  $http({method: 'GET', url: 'DataAccess/getMultiplePatients.php'}).
  success(function(data, status, headers, config) {
    $scope.patients = data;
  }).
  error(function(data, status, headers, config) {
    //Should do something to handle errors.
  });
}

var singlePatientRecordController = function($scope, $http, $routeParams) {
  console.log("Loaded");
  $http({method: 'GET', url: 'DataAccess/getPatientInformation.php?pid=' + $routeParams.pid}).
  success(function(data, status, headers, config) {
    $scope.patient = data;
    console.log($scope.patient);
  }).
  error(function(data, status, headers, config) {
    //Should do something to handle errors.
  });

  $scope.save = function() {
    $http({method: 'POST', url: 'DataAccess/setPatientInformation.php', data: $scope.patient}).
    success(function(data, status, headers, config) {
      
    }).
    error(function(data, status, headers, config) {
      //Should do something to handle errors.
    });
  }
} 