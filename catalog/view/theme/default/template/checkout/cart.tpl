<?php echo $header; ?>
<!--CONTAINER STARTS HERE-->
  <div class="ContainHolder">
     <?php echo $column_right; ?>
     
    <div class="ContRight">
      
      <div class="ContRightBot">
      <div class="ContRightBotTitle">
        <div class="LtstLeft"></div>
        <div class="Ltstmed"><?php echo $heading_title; ?></div>
        <div class="LtstRight"></div>
      </div>
       <div class="clear">&nbsp;</div> 
        <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="success"><?php echo $success; ?></div>
        <?php } ?>
         
         <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cart">
         <div class="InrPductDtls">      
            <div class="InrPdoctCat">
              <div class="InrBox1Top"></div>
              <div class="InrBox1Med">
               <div class="InrBox1Med2">
                 <div class="CartPagTitle">
                   <ul>
                     <li>Remove</li>
                     <li>Image</li>
                     <li style="width:150px;">Name</li>
                     <li>Weight</li>
                     <li style="width:80px;">Quantity</li>
                     <li style="width:90px;">Unit Price</li>
                     <li style="width:90px;">Total</li>
                   </ul>
                 </div>
                
                <?php $classname = 'CartPagDes2'; ?>
                 
                <?php foreach ($products as $product) { ?>
                 
                 <?php if($classname == 'CartPagDes2') $classname = 'CartPagDes'; else $classname = 'CartPagDes2'; ?>
                 
                 <div class="<?php echo $classname; ?>">
                   <ul>
                     <li><input type="checkbox" name="remove[<?php echo $product['key']; ?>]" class="CartCheck" /></li>
                     <li><div class="inrSmlBoxpading"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div></li>
                     <li style="width:150px;">
                     <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php if (!$product['stock']) { ?>
                        <span style="color: #FF0000; font-weight: bold;">***</span>
                        <?php } ?>
                        <div>
                          <?php foreach ($product['option'] as $option) { ?>
                          - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                          <?php } ?>
                        </div>
                     </li>
                     <li><?php echo $product['weight']; ?></li>
                     <li style="width:80px;"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" class="CartInpt" /></li>
                     <li style="width:90px;"><?php echo $product['price']; ?></li>
                     <li style="width:90px;"><?php echo $product['total']; ?></li>
                   </ul>
                 </div>
                <?php } ?>
                 
                 
                 
                 <div class="Carttotal">
                   <ul>
                     <li><?php echo $sub_total; ?></li>
                     <li><?php echo $text_sub_total; ?></li>
                   </ul>
                 </div>
                 
               </div>              
              </div>
              <div class="InrBox1Bot"></div>
            </div>
          </div>
          
         <div class="InrPductDtls" style="padding-top:25px;">      
           <a onclick="$('#cart').submit();" target="_self" title="Update" class="CartUpdate">Update</a>
           <a onclick="location='<?php echo $continue; ?>'" target="_self" title="Continue Shopping" class="CartShoping">Continue Shopping</a>
           <a onclick="location='<?php echo $checkout; ?>'" target="_self" title="Checkout" class="CartCheckout">Checkout</a>
           <!--<a href="#" target="_self" title="Paypal" class="ChecPaypal">Paypal</a>-->
          </div>
         </form>
         
         <div style="width: 558px; display: inline-block; margin-top:20px;">
          <div style="float: left; width: 340px;">
            <div style="border: 1px solid #DDDDDD; min-height: 125px;">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="coupon">
                <div style="background: #F7F7F7 url('catalog/view/theme/default/image/discount.png') 8px 8px no-repeat; border-bottom: 1px solid #DDDDDD; padding: 8px 8px 8px 29px;"><span style="text-transform: uppercase; font-size: 14px; font-weight: bold;"><?php echo $text_discount; ?></span></div>
                <div style="padding: 8px;"><?php echo $text_coupon; ?><br /><br />

                  <input type="text" name="coupon" value="<?php echo $coupon; ?>" class="mediumText" />
                  <a onclick="$('#coupon').submit();" class="button"><span><?php echo $button_coupon; ?></span></a></div>
              </form>
            </div>
          </div>
        </div>
          
        
      </div>
    </div>
  </div>
  <!--CONTAINER ENDS HERE-->
<?php echo $footer; ?> 