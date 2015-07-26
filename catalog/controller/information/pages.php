<?php 
class ControllerInformationPages extends Controller {
	public function index() {  
    	$this->language->load('information/information');
		
		$this->load->model('catalog/information');
		
		$this->document->breadcrumbs = array();
		
      	$this->document->breadcrumbs[] = array(
        	'href'      => $this->url->http('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => FALSE
      	);
		
		if (isset($this->request->get['page_id'])) {
			$page_id = $this->request->get['page_id'];
		} else {
			$page_id = 0;
		}
		
		$page_info = $this->model_catalog_information->getInformation($page_id);
   		
		if ($page_info) {
	  		$this->document->title = $page_info['title']; 

      		$this->document->breadcrumbs[] = array(
        		'href'      => $this->url->http('information/pages&page_id=' . $this->request->get['page_id']),
        		'text'      => $page_info['title'],
        		'separator' => $this->language->get('text_separator')
      		);		
						
      		$this->data['heading_title'] = $page_info['title'];
      		
      		$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['description'] = html_entity_decode($page_info['description']);
      		
			$this->data['continue'] = $this->url->http('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/pages.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/pages.tpl';
			} else {
				$this->template = 'default/template/information/pages.tpl';
			}
			
			$this->children = array(
				'common/header',
				'common/footer',
				'common/column_left',
				'common/column_right'
			);		
			
	  		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    	} else {
      		$this->document->breadcrumbs[] = array(
        		'href'      => $this->url->http('information/pages&page_id=' . $this->request->get['page_id']),
        		'text'      => $this->language->get('text_error'),
        		'separator' => $this->language->get('text_separator')
      		);
				
	  		$this->document->title = $this->language->get('text_error');
			
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->http('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/header',
				'common/footer',
				'common/column_left',
				'common/column_right'
			);
		
	  		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    	}
  	}
}
?>