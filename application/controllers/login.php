<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {


  public function index()
  {
    if($this->input->post('ID') && $this->input->post('password')) {
      $id = $this->input->post('ID');
      $password = $this->input->post('password');

      $this->db->from('User')->where(array(
        'UserName' => $id, 
        'Password' => md5($password)));  //I am using md5, please add your own encryption if you want this to be more secure.
      $userInDatabase = $this->db->get();
      if($userInDatabase->num_rows()) {
        $detailedUserInformation = $userInDatabase->row_array();
        $_SESSION['user'] = array(
          'id' => $detailedUserInformation['ID'], 
          'userName' => $detailedUserInformation['UserName'], 
          'userType' => $detailedUserInformation['UserTypeID'], 
          'employeeNumber' => $detailedUserInformation['EmployeeNumber']);
        redirect('welcome');
      } else
        $error = "Could not validate those credentials. Please try again.";
    } else if($this->input->post('ID') || $this->input->post('password'))
      $error = "Plese fill in both fields to log in.";

    $this->load->model('userModel');

    $this->load->view('header', array(
      'access' => $this->userModel->getAccessArray(0)));
    $this->load->view('login', array(
      'error' => (isset($error) ? $error : false)));
    $this->load->view('footer');
  }

  public function logout() {
    if(isset($_SESSION['user']))
      unset($_SESSION['user']);
    $this->index();
  }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */