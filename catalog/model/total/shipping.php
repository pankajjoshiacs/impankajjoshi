<?php
class ModelTotalShipping extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		
		$this->calculateShipping($total);
		
		
		if ($this->cart->hasShipping() && isset($this->session->data['shipping_method']) && $this->config->get('shipping_status')) {
			$total_data[] = array( 
        		'title'      => 'Shipping costs:',//$this->session->data['shipping_method']['title'] . ':',
        		'text'       => $this->currency->format($this->session->data['shipping_method']['cost']),
        		'value'      => $this->session->data['shipping_method']['cost'],
				'sort_order' => $this->config->get('shipping_sort_order')
			);

			if ($this->session->data['shipping_method']['tax_class_id']) {
				if (!isset($taxes[$this->session->data['shipping_method']['tax_class_id']])) {
					$taxes[$this->session->data['shipping_method']['tax_class_id']] = $this->session->data['shipping_method']['cost'] / 100 * $this->tax->getRate($this->session->data['shipping_method']['tax_class_id']);
				} else {
					$taxes[$this->session->data['shipping_method']['tax_class_id']] += $this->session->data['shipping_method']['cost'] / 100 * $this->tax->getRate($this->session->data['shipping_method']['tax_class_id']);
				}
			}
			
			$total += $this->session->data['shipping_method']['cost'];
		}			
	}
	
	public function calculateShipping(&$total){
		
		$dry_pack = false;
		$cool_pack = false;
		
		foreach ($this->cart->getProducts() as $result) {
			if($result['pack']=='dry')
			$dry_pack = true;
			elseif($result['pack']=='cool')
			$cool_pack = true;
		}
		
		
		if( $dry_pack == true and $cool_pack == true ){
			if($total < 9500){
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods']['drycool']['quote']['drycool'];
			}
			else{
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods']['free']['quote']['free'];
			}
		}
		elseif( $dry_pack == true and $cool_pack == false ){
			if($total < 6500){
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods']['dry']['quote']['dry'];
			}
			else{
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods']['free']['quote']['free'];
			}
		}
		else{
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods']['cool']['quote']['cool'];
		}
		
	}
}
?>