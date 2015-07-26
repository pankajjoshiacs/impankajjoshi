<?php echo $header; ?>
<!--CONTAINER STARTS HERE-->
  <div class="ContainHolder">
    
    <?php echo $column_left; ?>
    
    <div class="ContRight">
      <div class="ContRightBot">
      <div class="ContRightBotTitle">
        <div class="LtstLeft"></div>
        <div class="Ltstmed">PRODUCT DETAILS </div>
        <div class="LtstRight"></div>
      </div>
      	
        
        
        <div class="InrPductDtls">
              <div class="innerCatDtlsLeft">
                <div class="innerThambProduct">
                  <div class="InrThmbTop"></div>
                  <div class="InrThmbMed"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="thickbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" style="margin-bottom: 3px;" /></a></div>  
                  <div class="InrThmbBot"></div>
                </div>
                
                
                <div class="innerSmallPicTitle">Click on image to enlarge</div>
                <?php if ($images) { ?>
            	<div class="innerSmallCat">
                <?php foreach ($images as $image) { ?>
                  <div class="inrSmlBoxpading"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="thickbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                <?php } ?>
                </div>
                <div class="innerSmallPicTitle">Click on image to enlarge</div>
                <?php } ?>  
               
                
              </div>
              
              <div class="innerCatDtlsRight">
                 
                 <h1><?php echo $heading_title; ?></h1>
                 <?php if ($display_price) { ?>
                 <div class="InrDtlsProduct"><p><b>Price :&nbsp;</b>  <?php if (!$special) { ?><small><?php echo $price; ?></small><?php } else { ?><span style="text-decoration: line-through; color:#999999;"><?php echo $price; ?></span>&nbsp;<small><?php echo $special; ?></small><?php } ?></p></div>
                 <?php } ?>  
                 
              	<?php if($description!=''){ ?>
                <div class="InrDtlsProduct">
              	<p><b>Description :</b></p>
                   <div class="prodDesc" style="padding:5px 0;">
                   <?php echo $description; ?>
                   </div>
                 </div>
                <?php } ?> 
                 <?php if ($display_price) { ?>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="product">
                  <?php if ($options) { ?>
                  <div class="InrDtlsProduct">
                  <p><b><?php echo $text_options; ?></b></p>
                  <table style="width: 100%;" cellpadding="5">
                  <?php foreach ($options as $option) { ?>
                  <tr>
                    <td><label for="option"><?php echo $option['name']; ?></label>
                      <select name="option[<?php echo $option['option_id']; ?>]">
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        <?php echo $option_value['prefix']; ?><?php echo $option_value['price']; ?>
                        <?php } ?>
                        </option>
                        <?php } ?>
                      </select></td>
                  </tr>
                  <?php } ?>
                </table>
                 
                 </div>
                  <?php } ?>
                  
                  <?php if ($discounts) { ?>
                  <div class="InrDtlsProduct">
                  <p><b><?php echo $text_discount; ?> :</b></p>
                  <table style="width: 100%;">
                  <tr>
                    <td style="text-align: right;"><b><?php echo $text_order_quantity; ?></b></td>
                    <td style="text-align: right;"><b><?php echo $text_price_per_item; ?></b></td>
                  </tr>
                  <?php foreach ($discounts as $discount) { ?>
                  <tr>
                    <td style="text-align: right;"><?php echo $discount['quantity']; ?></td>
                    <td style="text-align: right;"><?php echo $discount['price']; ?></td>
                  </tr>
                  <?php } ?>
                </table>
                 
                 </div>
                  <?php } ?>
                  
                 <div class="InrDtlsProduct">
                   <input type="hidden" name="quantity" value="1" />
                   <a onclick="$('#product').submit();" id="add_to_cart" class="inradcart" title="Add To Cart">Add To Cart</a>
                   <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              	   <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                 </div>
                </form>
                <?php } ?>
                 
                 <div class="InrDtlsProduct" style="padding-top:30px;">
            <ul>
              <li><a href="index.php?route=/information/pages&page_id=6" class="nyroModal"><img src="catalog/view/theme/default/images/dpic.jpg" alt="Delivery Details" /></a></li>
              <li><a href="index.php?route=/information/pages&page_id=6" class="nyroModal">Delivery&nbsp;Details</a></li>
            </ul>
            <ul>
              <li><a href="index.php?route=/product/askaquestion&product_id=<?php echo $product_id; ?>" class="nyroModal"><img src="catalog/view/theme/default/images/Ask.jpg" alt="Ask a Question" /></a></li>
              <li><a href="index.php?route=/product/askaquestion&product_id=<?php echo $product_id; ?>" class="nyroModal">Ask&nbsp;a&nbsp;Question</a></li>
            </ul>
            <ul>
              <li><a href="index.php?route=/product/tellafriend&product_id=<?php echo $product_id; ?>" class="nyroModal"><img src="catalog/view/theme/default/images/frient.jpg" alt="Send to a friend" /></a></li>
              <li><a href="index.php?route=/product/tellafriend&product_id=<?php echo $product_id; ?>" class="nyroModal">Send to a friend</a></li>
            </ul>
                 </div>
              
            </div>
            
            <?php if ($products) { ?>
            
            <div class="InrPdoctCat">
              <div class="InrBox1Top"></div>
              
              
              <div class="InrBox1Med">
                <div class="ContRightBotTitle">
            <div class="LtstLeft"></div>
            <div class="Ltstmed" style="width:656px;">OTHER PRODUCT AND CUSTOMER PURCHASED</div>
            <div class="LtstRight"></div>
          </div>
          
          
          
          <div class="InrBox1Med2">
           
           	<?php $count = 1; foreach($products as $product){ ?>
            
            <div class="PdoucCat2">
            <div class="PdoucPic"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
            
            <div class="ProductDetail"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div class="ProductDetail"><?php echo $product['weight']; ?></div>
            
            <?php if ($display_price) { ?>
            
            <?php if (!$product['special']) { ?>
            <div class="ProductDetail"><b>Price : <?php echo $product['price']; ?></b></div>
            <?php }else{ ?>
            <div class="ProductDetail"><b>Price : <span style="text-decoration: line-through; color:#999999;"><?php echo $product['price']; ?></span>&nbsp;<?php echo $product['price']; ?></b></div>
            <?php } ?>
            
            <?php } ?>
            
            <div class="ProductDetail2">
                <a href="<?php echo $product['href']; ?>" target="_self" title="Details" class="pdtlslnk">Details</a>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="product_<?php echo $product['product_id']; ?>">
                <input type="hidden" name="quantity" value="1" />
                <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
              	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <a onclick="$('#product_<?php echo $product['product_id']; ?>').submit();" title="Add to cart" class="AdLink">Add to cart</a>
                </form>
            </div>
            
            </div>
            
            
            
        
     	<?php $count ++; } ?>
            
        </div>
              
        
          </div>
          
              
              
              <div class="InrBox1Bot"></div>
            </div>
            
            <?php } ?>
            
          </div>
        
        
        
        
      </div>
    </div>
  </div>
  <!--CONTAINER ENDS HERE-->

<?php echo $footer; ?> 