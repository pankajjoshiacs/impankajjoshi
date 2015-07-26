<?php  
class ControllerCommonLoginPopup extends Controller {
	private $error = array(); 
	
	public function index() { 
		if ($this->customer->isLogged()) {  
      		$this->redirect($this->url->https('account/account'));
    	}
		$this->language->load('account/login');
		
		$this->data['text_forgotten_password'] = $this->language->get('text_forgotten_password');
		$this->data['forgotten'] = $this->url->https('account/forgotten');
		
		$this->data['success'] = false;
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			
			$this->data['success'] = true;
			
			/*if (isset($this->request->post['redirect'])) {
				$this->redirect($this->request->post['redirect']);
			} else {
				$this->redirect($this->url->https('account/account'));
			}*/ 
		} 
		
		$this->data['heading_title'] = 'Already a Member? Login';
		
		
		
		if (isset($this->error['warning'])) {
			$this->data['error'] = $this->error['warning'];
		} else {
			$this->data['error'] = '';
		}
		
		
		
		$this->data['action'] = $this->url->https('common/login_popup');

			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/login_popup.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/login_popup.tpl';
		} else {
			$this->template = 'default/template/common/login_popup.tpl';
		}
			
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
		
	}
		
		
		
		
	private function validate() {
    	if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
      		$this->error['warning'] = $this->language->get('error_login');
    	}
	
    	if (!$this->error) {
      		return TRUE;
    	} else {
      		return FALSE;
    	}  	
  	}
}
?>