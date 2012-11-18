<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class userModel extends CI_Model {

  function isLoggedIn() {
    //Look for a session token.
    if(isset($_SESSION['user'])) {
      return true;
    } 
    return false;
  }

  function getAccessArray($id) {
    $accessArray = array(
      'patient_records' => false, 
      'pharmacy' => false, 
      'physician_scheduler' => false, 
      'administration' => false, 
      'billing' => false, 
      'equipment' => false, 
      'add patient' => false
      );

    if($id == 0)
      return $accessArray;
    switch ($id) {
      case 1: 
        $accessArray = array(
        'patient_records' => true, 
        'pharmacy' => true, 
        'physician_scheduler' => true, 
        'administration' => true, 
        'billing' => false, 
        'equipment' => true, 
        'add patient' => true
        );
        break;
      case 2:
        $accessArray = array(
          'patient_records' => true, 
          'pharmacy' => false, 
          'physician_scheduler' => true, 
          'administration' => false, 
          'billing' => true, 
          'equipment' => false, 
          'add patient' => true
        );
        break;
      case 3:
        $accessArray = array(
          'patient_records' => true, 
          'pharmacy' => false, 
          'physician_scheduler' => true, 
          'administration' => false, 
          'billing' => true, 
          'equipment' => false, 
          'add patient' => true
        );
        break;
        case 8:
        $accessArray = array(
          'patient_records' => true, 
          'pharmacy' => false, 
          'physician_scheduler' => true, 
          'administration' => false, 
          'billing' => true, 
          'equipment' => false, 
          'add patient' => true
        );
        break;
        case 4:
        $accessArray = array(
          'patient_records' => true, 
          'pharmacy' => false, 
          'physician_scheduler' => false, 
          'administration' => false, 
          'billing' => true, 
          'equipment' => false, 
          'add patient' => true
        );
        break;
        case 5:
        $accessArray = array(
          'patient_records' => false, 
          'pharmacy' => false, 
          'physician_scheduler' => false, 
          'administration' => false, 
          'billing' => false, 
          'equipment' => true, 
          'add patient' => false
        );
        break;
      
    }
    return $accessArray;
  }
}

?>