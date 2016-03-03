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

<?php echo $footer; ?> 