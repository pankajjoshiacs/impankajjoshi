<?php
class ControllerModuleCategory extends Controller {
	protected $path = "";
	protected $breadcump = array();

	protected function index() {
		$this->language->load('module/category');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/category');
		$this->load->model('tool/seo_url');

		if (isset($this->request->get['path'])) {
			$this->path = $this->request->get['path'];
		}
		$this->data['category'] = ($this->path != "") ? $this->getCategories($this->path) : $this->getCategories(0);
		$this->id = 'category';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}

		$this->render();
	}

	private function getBreadcump($category_id) {
		if ($category_id != 0) {
			$result = $this->model_catalog_category->getCategory($category_id);
			$this->breadcump[] = $result["name"] . "_" . $result["category_id"];
			$this->getBreadcump($result['parent_id']);
		}
		return $this->breadcump;
	}

	protected function getCategories($parent_id, $current_path = '') {
		$breadCump = $this->getBreadcump($this->path);
		$category_id = $this->path;

		$output = '';
		$output .= '<div class="">';
		if ($parent_id != 0) {
			$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('common/home')) . '">TOP</a>';
			$output .= " > ";
			for ($i = count($breadCump)-1; $i >= 0 ; $i--) {
				$link = explode("_", $breadCump[$i]);
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $link[1])) . '">' . $link[0] . '</a>';
				if ($i > 0) {
					$output .= " > ";
				}
			}
		}
		$output .= '</div>';
		$results = $this->model_catalog_category->getCategories($parent_id);

		if ($results) {
			$output .= '<ul>';
		}

		$classname = 'Catlnk1';

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path;
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
			$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $new_path))  . '" class="'.$classname.'">' . $result['name'] . '</a>';

			$output .= $children;

			$output .= '</li>';
		}

		if ($results) {
			$output .= '</ul>';
		}

		if ($parent_id != 0) {
			$output .= '<div class="ContLeftTitle"><img src="catalog/view/theme/default/images/topcategories.jpeg" alt="Top Categories" /></div>';
			$output .= '<div class="ContLeftDes">';
			$output .= $this->getTopCategories($parent_id);
			$output .= '</div>';
		}
		return $output;
	}

	protected function getTopCategories($current_path) {
		$results = $this->model_catalog_category->getCategories(0);
		$classname = 'Catlnk1';
		$output = "<ul>";
		foreach ($results as $result) {
			if ($current_path != $result['category_id']) {
				$output .= '<li>';
				$output .= '<a href="' . $this->model_tool_seo_url->rewrite($this->url->http('product/category&path=' . $result['category_id'])) . '" class="' . $classname . '">' . $result['name'] . '</a>';
				$output .= '</li>';
			}
		}
		$output .= '</ul>';
		return $output;
	}
}
?>