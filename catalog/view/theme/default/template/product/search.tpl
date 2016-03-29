<?php echo $header; ?>
<!--CONTAINER STARTS HERE-->
  <div class="ContainHolder">
    
    <?php echo $column_left; ?>
    
    <div class="ContRight">
      <div class="ContRightBot">
      <div class="ContRightBotTitle">
        <div class="LtstLeft"></div>
        <div class="Ltstmed">
        <span style="float:left; width:40%;"><?php echo $heading_title; ?></span>
        
        <div class="sort">
          <div class="div1">
            <select name="sort" onchange="location=this.value">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if (($sort . '-' . $order) == $sorts['value']) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="div2"><?php echo $text_sort; ?></div>
        </div>
    
        </div>
        <div class="LtstRight"></div>
      </div>
      	
        <div class="search-block" style="padding:0 5px;">
        
        <b><?php echo $text_critea; ?></b>
        <div id="content_search" class="common-block">
          <table>
            <tr>
              <td><?php echo $entry_search; ?></td>
              <td><?php if ($keyword) { ?>
                <input type="text" value="<?php echo $keyword; ?>" id="keyword" class="largeText" style="position:relative; top:2px;" />
                <?php } else { ?>
                <input type="text" value="<?php echo $text_keyword; ?>" id="keyword" onclick="this.value = '';" class="largeText" style="position:relative; top:2px;"/>
                <?php } ?>
                <!--
                <select id="category_id" class="largeSelect">
                  <option value="0"><?php echo $text_category; ?></option>
                  <?php foreach ($categories as $category) { ?>
                  <?php if ($category['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                -->
              </td>
            </tr>
            
          </table>
        </div>
        <div class="buttons">
      <table>
        <tr>
          <td align="right"><a onclick="contentSearch();" class="button"><span><?php echo $button_search; ?></span></a></td>
        </tr>
      </table>
    </div>
        
        </div>
        
        
       
       <?php if ($products) { ?>
        
        <div class="ProDctCatBox">
        
        <?php $count = 1; foreach($products as $product){ ?>
        
        <div class="PdoucCat">
            <div class="PdoucPic"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
            
            <div class="ProductDetail"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            
            <?php if ($display_price) { ?>
            
            <?php if (!$product['special']) { ?>
            <div class="ProductDetail"><b>Price : <?php echo $product['price']; ?></b></div>
            <?php }else{ ?>
            <div class="ProductDetail"><b>Price : <span style="text-decoration: line-through; color:#999999;"><?php echo $product['price']; ?></span>&nbsp;<?php echo $product['price']; ?></b></div>
            <?php } ?>
            
            <?php } ?>
            
            <div class="ProductDetail2">
                <a href="<?php echo $product['href']; ?>" target="_self" title="Details" class="pdtlslnk">Details</a>
                <form action="<?php echo $cart_action; ?>" method="post" enctype="multipart/form-data" id="product_<?php echo $product['product_id']; ?>">
                <input type="hidden" name="quantity" value="1" />
                <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
              	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <a onclick="$('#product_<?php echo $product['product_id']; ?>').submit();" title="Add to cart" class="AdLink">Add to cart</a>
                <div class="fb-share-button" style="padding-left: 24px; padding-top: 5px"
                     data-href="<?php echo $product['href']; ?>"
                     data-layout="button_count">
                </div>
                </form>
            </div>
            
        </div>
        
        <?php if($count%4 == 0 and $count != count($products)){ ?>
        </div><div class="ProDctCatBox">
    	<?php } ?>
        
     	<?php $count ++; } ?>
        </div>  
     	
       <div class="pagination"><?php echo $pagination; ?></div>
       
       <?php }else{ ?>
       <div class="not-found">Item not found!</div>
       <?php } ?>
        
      </div>
    </div>
  </div>
  <!--CONTAINER ENDS HERE-->

<script type="text/javascript"><!--
$('#content_search input').keydown(function(e) {
	if (e.keyCode == 13) {
		contentSearch();
	}
});

function contentSearch() {
	url = 'index.php?route=product/search';
	
	var keyword = $('#keyword').attr('value');
	
	if (keyword) {
		url += '&keyword=' + encodeURIComponent(keyword);
	}

	var category_id = $('#category_id').attr('value');
	
	if (category_id) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	location = url;
}
//--></script>

<?php echo $footer; ?> 