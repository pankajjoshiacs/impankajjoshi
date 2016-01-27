<?php
class ControllerModuleCategory extends Controller {
	protected $category_id = 0;
	protected $path = array();
	protected $separator = "|_";

	protected function index() {
		$this->language->load('module/category');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/category');
		$this->load->model('tool/seo_url');

		if (isset($this->request->get['path'])) {
			$this->path = explode('_', $this->request->get['path']);

			$this->category_id = end($this->path);
		}

		$this->data['category'] = $this->getCategories(0);

		$this->id = 'category';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}

		$this->render();
	}

	protected function getCategories($parent_id, $current_path = '') {
		$this->separator .= "_";
		$category_id = array_shift($this->path);
		$output = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		if ($results) {
			$output .= '<ul>';
		}

		$classname = 'Catlnk1';
		$parentCat ='';
		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			if( $classname == 'Catlnk1' )
				$classname = 'Catlnk2';
			else
				$classname = 'Catlnk1';
			$output .= '<li>';

			$children = '';

			if ($category_id == $result['category_id']) {
				$children = $this->getCategories($result['category_id'], $new_path);
			}

			if ($this->category_id == $result['category_id'] && $result['parent_id'] != 0 ) {
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $new_path))  . '" class="'.$classname.' cat-selected">' . $this->separator . $result['name'] . '</a>';
				$parentCat = $result['name'];
			} else if ($this->category_id == $result['parent_id'] && $result['parent_id'] != 0) {
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $new_path))  . '" class="'.$classname.'">' . $parentCat . $this->separator . $result['name'] . '</a>';
			} else if ($result['parent_id'] != 0) {
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $new_path))  . '" class="'.$classname.'">' . $this->separator . $result['name'] . '</a>';
			} else {
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $new_path))  . '" class="'.$classname.'">' . $result['name'] . '</a>';
			}

			$output .= $children;

			$output .= '</li>';
		}

		if ($results) {
			$output .= '</ul>';
		}

		return $output;
	}
}
?>