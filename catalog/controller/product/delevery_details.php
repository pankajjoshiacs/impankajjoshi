<?php  
class ControllerProductDeleveryDetails extends Controller {
	private $error = array(); 
	
	public function index() { 
		//$this->load->model('catalog/product');
		//$this->load->model('catalog/category');	
		//$this->load->model('tool/seo_url'); 
		
		/*if (isset($this->request->get['product_id'])) {
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
			
		}*/
		
		
		$this->data['heading_title'] = 'Tell a Friend';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/delevery_details.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/delevery_details.tpl';
		} else {
			$this->template = 'default/template/product/delevery_details.tpl';
		}
			
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
		
		
  	}
}
?>