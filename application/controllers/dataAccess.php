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

  public function getPatientInformationHistory($patientId = false)
  {
    if($patientId)
    {
      $this->db->from('PatientHistory')->where('PatientHistory.PatientID', $patientId)->join('User', 'User.ID = PatientHistory.ChangeByID')->order_by('HistoryID', 'Desc');
      $query = $this->db->get();

      $result = array();
      foreach ($query->result_array() as $row) {
        array_push($result, $row);
      }

        echo json_encode($result);
    } 
  }

  public function setPatientInformation() {
    $patientInfo = json_decode(file_get_contents("php://input"));

    $this->db->from('Patient')->where('ID', $patientInfo->ID);
    $query = $this->db->get();
    if($query->num_rows()) {
      $result = $query->row();
      $this->db->insert('PatientHistory', array(
        'PatientID' => $result->ID, 
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
        'ChangeDate' => time()*1000));
    }


    if($patientInfo->ID) {
      $this->db->where('ID', $patientInfo->ID);
      $this->db->update('Patient', $patientInfo);

    } else {
      echo "ERRO"; die();
    }
  }

  public function revertPatientRecord() {
    $recordInfo = json_decode(file_get_contents("php://input"));

    $this->db->where('ID', $recordInfo->PatientID)->update('Patient', array(
      'NameFirst' => $recordInfo->NameFirst, 
        'NameLast' => $recordInfo->NameLast, 
        'NameMiddle' => $recordInfo->NameMiddle, 
        'Address' => $recordInfo->Address, 
        'Phone' => $recordInfo->Phone, 
        'InsuranceCarrierID' => $recordInfo->InsuranceCarrierID,
        'DateOfBirth' => $recordInfo->DateOfBirth, 
        'Gender' => $recordInfo->Gender, 
        'ChangeByID' => $_SESSION['user']['id'], 
        'ChangeDate' => time()
      ));

    $this->db->where(array('HistoryID >=' => $recordInfo->HistoryID, 'PatientID' => $recordInfo->PatientID))->delete('PatientHistory');
    
  }
  public function addPatient() {
    $patientInfo = json_decode(file_get_contents("php://input"));
    $this->db->insert('Patient', $patientInfo);
  }

  public function getPhysicians() {
    $this->db->from('Employee')->where(array('EmployeeTypeID >= ' => 1, 'EmployeeTypeID <=' => 7));
    $query = $this->db->get();

    $docs = array();
    if($query->num_rows()) {
      foreach($query->result_array() as $doc) {
        array_push($docs, $doc['NameFirst'] . ' ' . $doc['NameLast']);
      }
    }

    echo json_encode($docs);
  }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */