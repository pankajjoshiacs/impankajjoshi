<?php
class ControllerStep1 extends Controller {
	private $error = array();
	//echo "Here ";//exit;
	public function index() {
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->redirect($this->url->http('step_2'));
		}
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';	
		}		
		
		$this->data['action'] = $this->url->http('step_1');
		
		$this->children = array(
			'header',
			'footer'
		);
		
		$this->template = 'step_1.tpl';

		$this->response->setOutput($this->render(TRUE));
	}
	
	private function validate() {
		if (!isset($this->request->post['agree'])) {
			$this->error['warning'] = 'You must agree to the license before you can install OpenCart!';
		}
		
    	if (!$this->error) {
      		return TRUE;
    	} else {
      		return FALSE;
    	}		
	}	
}
?>