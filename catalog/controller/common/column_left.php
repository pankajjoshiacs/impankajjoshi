<?php  
class ControllerCommonColumnLeft extends Controller {
	protected function index() {
		$module_data = array();
		
		$this->load->model('checkout/extension');
		$this->load->model('catalog/product');
		
		$results = $this->model_checkout_extension->getExtensions('module');

		foreach ($results as $result) {
			if ($this->config->get($result['key'] . '_status') && ($this->config->get($result['key'] . '_position') == 'left')) {
				$module_data[] = array(
					'code'       => $result['key'],
					'sort_order' => $this->config->get($result['key'] . '_sort_order')
				);
				
				$this->children[] = 'module/' . $result['key'];		
			}
		}

		$sort_order = array(); 
	  
		foreach ($module_data as $key => $value) {
      		$sort_order[$key] = $value['sort_order'];
    	}

    	array_multisort($sort_order, SORT_ASC, $module_data);			
		
		$this->data['modules'] = $module_data;
		
		
		$sproduct = $this->model_catalog_product->getSpecialProduct1();
		
		$this->data['sproduct'] = array();
			
		if($sproduct){
		
			if ($sproduct['image']) {
				$image = $sproduct['image'];
			} else {
				$image = 'no_image.jpg';
			}						
			
			$this->load->helper('image');
								
			$this->data['sproduct'] = array(
				'product_id' => $sproduct['product_id'],
				'name'    => $sproduct['name'],
				'model'   => $sproduct['model'],
				'thumb'   => image_resize($image, 146, 145),
				'price'   => $this->currency->format($this->tax->calculate($sproduct['price'], $sproduct['tax_class_id'], $this->config->get('config_tax'))),
				'special' => $this->currency->format($this->tax->calculate($sproduct['special'], $sproduct['tax_class_id'], $this->config->get('config_tax'))),
				'href'    => $this->model_tool_seo_url->rewrite($this->url->http('product/product&product_id=' . $sproduct['product_id']))
			);
		
		}
		
		$this->id = 'column_left';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/column_left.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/column_left.tpl';
		} else {
			$this->template = 'default/template/common/column_left.tpl';
		}
		
		$this->render();
	}
}
?>