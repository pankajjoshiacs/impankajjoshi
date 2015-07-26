<?php  
class ControllerProductAskaquestion extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');	
		$this->load->model('tool/seo_url'); 
		
		if (isset($this->request->get['product_id'])) {
			$product_id = $this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if($product_info){
			$this->data['product_name'] = $product_info['name'];
			$this->data['product_name'] = $product_info['name'];
			
			$this->load->helper('image');
			
			if ($product_info['image']) {
				$image = 'no_image.jpg';//$product_info['image'];
			} else {
				$image = 'no_image.jpg';
			}	
					
			$this->data['thumb'] = image_resize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			
		}
		
		$this->data['success'] = '';
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$subject = 'Ask a question mail on Tom Murphy';
			
			$message = '';
			
			$message .= 'Name = ' . $this->request->post['name']. "\n\n";
			$message .= 'Telephone = ' . $this->request->post['telephone']. "\n\n";
			$message .= 'Size required = ' . $this->request->post['size']. "\n\n";
			$message .= 'Question = ' . $this->request->post['question']. "\n\n";
			
			
			$mail = new Mail($this->config->get('config_mail_protocol'), $this->config->get('config_smtp_host'), $this->config->get('config_smtp_username'), html_entity_decode($this->config->get('config_smtp_password')), $this->config->get('config_smtp_port'), $this->config->get('config_smtp_timeout'));
			$mail->setTo($this->config->get('config_email'));//$this->config->get('config_email')
	  		$mail->setFrom($this->request->post['email']);
	  		$mail->setSender($this->request->post['email']);
	  		$mail->setSubject($subject);
			$mail->setText($message);
      		$mail->send();
	  	  
		  	$this->data['success'] = 'Your question sent successfully! Our team will contanct you soon.';
	  		//$this->redirect($this->url->https('account/success'));
    	} 
		
		
		$this->data['heading_title'] = 'Ask a Question';
		
		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		
		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}	
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
		
		if (isset($this->error['question'])) {
			$this->data['error_question'] = $this->error['question'];
		} else {
			$this->data['error_question'] = '';
		}
		
		
		$this->data['action'] = $this->url->https('product/askaquestion&product_id='.$product_id);

		if (isset($this->request->post['name'])) {
    		$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = '';
		}
		
		if (isset($this->request->post['email'])) {
    		$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}
		
		if (isset($this->request->post['telephone'])) {
    		$this->data['telephone'] = $this->request->post['telephone'];
		} else {
			$this->data['telephone'] = '';
		}
		
		if (isset($this->request->post['size'])) {
    		$this->data['size'] = $this->request->post['size'];
		} else {
			$this->data['size'] = '';
		}
		
		if (isset($this->request->post['question'])) {
    		$this->data['question'] = $this->request->post['question'];
		} else {
			$this->data['question'] = '';
		}
		
			
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/askaquestion.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/askaquestion.tpl';
		} else {
			$this->template = 'default/template/product/askaquestion.tpl';
		}
			
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
		
		}
		
		
		
		
		private function validate() {
    	if ((strlen(utf8_decode($this->request->post['name'])) < 1) || (strlen(utf8_decode($this->request->post['name'])) > 32)) {
      		$this->error['name'] = 'Name must be greater than 1 and less than 32 characters!';
    	}

    	$pattern = '/^[A-Z0-9._%-]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';

    	if (!preg_match($pattern, $this->request->post['email'])) {
      		$this->error['email'] = 'E-Mail Address does not appear to be valid!';
    	}

    	if ((strlen(utf8_decode($this->request->post['question'])) < 1) || (strlen(utf8_decode($this->request->post['question'])) > 500)) {
      		$this->error['question'] = 'Your question must be 1 to 500 character length!';
    	}
		
    	if (!$this->error) {
      		return TRUE;
    	} else {
      		return FALSE;
    	}
  	}
}
?>