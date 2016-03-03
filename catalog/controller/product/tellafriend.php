<?php  
class ControllerProductTellafriend extends Controller {
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
				$image = $product_info['image'];
			} else {
				$image = 'no_image.jpg';
			}	
					
			$this->data['thumb'] = image_resize($image, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			
		}
		
		$this->data['success'] = '';
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$subject = 'Your friend sent you a link';
			
			$message = '';
			
			$message .= 'Friends Name = ' . $this->request->post['name']. "\n\n";
			$message .= 'Friends Email = ' . $this->request->post['email']. "\n\n";
			$message .= 'Message = ' . $this->request->post['message']. "\n\n";
			
			
			$mail = new Mail($this->config->get('config_mail_protocol'), $this->config->get('config_smtp_host'), $this->config->get('config_smtp_username'), html_entity_decode($this->config->get('config_smtp_password')), $this->config->get('config_smtp_port'), $this->config->get('config_smtp_timeout'));
			$mail->setTo($this->request->post['femail']);
	  		$mail->setFrom($this->config->get('config_email'));
	  		$mail->setSender($this->config->get('config_store'));
	  		$mail->setSubject($subject);
			$mail->setText($message);
      		//$mail->send();
	  	  
		  	$this->data['success'] = 'Your message was sent successfully to your friend!';
	  		//$this->redirect($this->url->https('account/success'));
    	} 
		
		
		$this->data['heading_title'] = 'Tell a Friend';
		
		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		
		if (isset($this->error['fname'])) {
			$this->data['error_fname'] = $this->error['fname'];
		} else {
			$this->data['error_fname'] = '';
		}	
		
		if (isset($this->error['femail'])) {
			$this->data['error_femail'] = $this->error['femail'];
		} else {
			$this->data['error_femail'] = '';
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
		
		if (isset($this->error['message'])) {
			$this->data['error_message'] = $this->error['message'];
		} else {
			$this->data['error_message'] = '';
		}
		
		
		$this->data['action'] = $this->url->https('product/tellafriend&product_id='.$product_id);

		if (isset($this->request->post['fname'])) {
    		$this->data['fname'] = $this->request->post['fname'];
		} else {
			$this->data['fname'] = '';
		}
		
		if (isset($this->request->post['femail'])) {
    		$this->data['femail'] = $this->request->post['femail'];
		} else {
			$this->data['femail'] = '';
		}
		
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
		
		
		if (isset($this->request->post['message'])) {
    		$this->data['message'] = $this->request->post['message'];
		} else {
			$this->data['message'] = '';
		}
		
			
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/tellafriend.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/tellafriend.tpl';
		} else {
			$this->template = 'default/template/product/tellafriend.tpl';
		}
			
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
		
		}
		
		
		
		
		private function validate() {
    	if ((strlen(utf8_decode($this->request->post['fname'])) < 1) || (strlen(utf8_decode($this->request->post['fname'])) > 32)) {
      		$this->error['fname'] = 'Friends Name must be greater than 1 and less than 32 characters!';
    	}

    	$pattern = '/^[A-Z0-9._%-]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';

    	if (!preg_match($pattern, $this->request->post['femail'])) {
      		$this->error['femail'] = 'Friends E-Mail Address does not appear to be valid!';
    	}
		
		if ((strlen(utf8_decode($this->request->post['name'])) < 1) || (strlen(utf8_decode($this->request->post['name'])) > 32)) {
      		$this->error['name'] = 'Your Name must be greater than 1 and less than 32 characters!';
    	}

    	$pattern = '/^[A-Z0-9._%-]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';

    	if (!preg_match($pattern, $this->request->post['email'])) {
      		$this->error['email'] = 'Your E-Mail Address does not appear to be valid!';
    	}


    	if ((strlen(utf8_decode($this->request->post['message'])) < 1) || (strlen(utf8_decode($this->request->post['message'])) > 500)) {
      		$this->error['message'] = 'Your Message must be 1 to 500 character length!';
    	}
		
    	if (!$this->error) {
      		return TRUE;
    	} else {
      		return FALSE;
    	}
  	}
}
?>