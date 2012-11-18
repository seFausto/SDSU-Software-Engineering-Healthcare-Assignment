var healthtrakController = function($scope, $http) {
    
}

var loginController = function($scope, $http) {

} 

var patientRecordsController = function($scope, $http) {
  $http({method: 'GET', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/getMultiplePatients'}).
  success(function(data, status, headers, config) {
    $scope.patients = data;
  }).
  error(function(data, status, headers, config) {
    //Should do something to handle errors.
  });

  $scope.getFullName = function(patient) {
    if(patient.NameMiddle)
      return patient.NameFirst + " " + patient.NameMiddle + " " + patient.NameLast;
    else
      return patient.NameFirst + " " + patient.NameLast;
  }
  $scope.getGender = function(patient) {
    if(patient.Gender == 0)
      return "Female";
    else if(patient.Gender == 1)
      return "Male";
    return "--";
  }
}

var singlePatientRecordController = function($scope, $http, $routeParams) {
  console.log("Loaded");
  $http({method: 'GET', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/getPatientInformation/' + $routeParams.pid}).
  success(function(data, status, headers, config) {
    $scope.patient = data;
    console.log($scope.patient);
  }).
  error(function(data, status, headers, config) {
    //Should do something to handle errors.
  });

  $scope.save = function() {
    $http({method: 'POST', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/setPatientInformation/', data: $scope.patient}).
    success(function(data, status, headers, config) {
      window.history.back(-1);
    }).
    error(function(data, status, headers, config) {
      //Should do something to handle errors.
    });
  }

  $(".datepicker").datepicker({
    changeYear: true,
    yearRange : "1970:2012",
    onSelect : function(date, obj) { 
      $scope.patient.DateOfBirth = Date.parse(date).getTime()/1000;
    }
  });

}

var addPatientController = function($scope, $http) {
  $scope.patient = {};
  $scope.patient.Gender = 0;

  $scope.save = function() {
    $http({method: 'POST', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/addPatient/', data: $scope.patient}).
    success(function(data, status, headers, config) {
      window.history.back(-1);
    }).
    error(function(data, status, headers, config) {
      //Should do something to handle errors.
    });


    
  }
} 

var patientHistoryController = function($scope, $http, $routeParams) {
  $http({method: 'GET', url: 'http://localhost:8888/healthtrak/index.php/dataAccess/getPatientInformation/' + $routeParams.pid}).
  success(function(data, status, headers, config) {
    $scope.history = data;
    console.log($scope.history);
  }).
  error(function(data, status, headers, config) {
    //Should do something to handle errors.
  });
}