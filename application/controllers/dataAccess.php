<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class DataAccess extends CI_Controller {

  
  public function getMultiplePatients($limit = false)
  {
    $this->db->from('Patient')->limit(constant('maxNumberOfResults'));
    $query = $this->db->get();
    if($query->num_rows())
    {
      header("HTTP/1.0 200 OK");
      $returnArray = array();
      foreach($query->result_array() as $row) {
        array_push($returnArray, $row);
      }
      echo json_encode($returnArray);
    }
  }

  public function getPatientInformation($patientId = false) {
    if($patientId) {
      $this->db->from('Patient')->where('ID', $patientId);
      $query = $this->db->get();
      if($query->num_rows())
      {
        //Set output headers
        echo json_encode($query->row_array());
      }
    }
  }

  public function setPatientInformation() {
    $patientInfo = json_decode(file_get_contents("php://input"));

    $this->db->from('Patient')->where('ID', $patientInfo->ID);
    $query = $this->db->get();
    if($query->num_rows()) {
      $result = $query->row();
      $this->db->insert('PatientHistory', array(
        'ID' => $result->ID, 
        'NameFirst' => $result->NameFirst, 
        'NameLast' => $result->NameLast, 
        'NameMiddle' => $result->NameMiddle, 
        'Address' => $result->Address, 
        'Phone' => $result->Phone, 
        'InsuranceCarrierID' => $result->InsuranceCarrierID,
        'DateOfBirth' => $result->DateOfBirth, 
        'Gender' => $result->Gender, 
        'PrimaryCarePhysician' => $result->PrimaryCarePhysician, 
        'ChangeByID' => $_SESSION['user']['id'], 
        'ChangeDate' => time()));
    }


    if($patientInfo->ID) {
      $this->db->where('ID', $patientInfo->ID);
      $this->db->update('Patient', $patientInfo);
    } else {
      echo "ERRO"; die();
    }
  }

  public function addPatient() {
    $patientInfo = json_decode(file_get_contents("php://input"));
    $this->db->insert('Patient', $patientInfo);
  }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */