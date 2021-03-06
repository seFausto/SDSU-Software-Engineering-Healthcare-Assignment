<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	error_reporting(E_ALL);
ini_set('display_errors', '1');
class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->model('userModel');
		if(!$this->userModel->isLoggedIn()) 
			redirect('login');

		$access = $this->userModel->getAccessArray($_SESSION['user']['userType']);

		$this->load->view('header', array(
			'access' => $access));
		$this->load->view('index');
		$this->load->view('footer');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */