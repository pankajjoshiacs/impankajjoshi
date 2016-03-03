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
  
  
  <div class="middle">
    <div class="content">
      <table width="100%">
        <tr>
          <td width="49%" valign="top"><?php if ($shipping_address) { ?>
            <b><?php echo $text_shipping_address; ?></b><br />
            <?php echo $shipping_address; ?><br />
            <a href="<?php echo $checkout_shipping_address; ?>"><?php echo $text_change; ?></a>
            <?php } ?></td>
          <td width="49%" valign="top"><b><?php echo $text_payment_address; ?></b><br />
            <?php echo $payment_address; ?><br />
            <a href="<?php echo $checkout_payment_address; ?>"><?php echo $text_change; ?></a></td>
        </tr>
      </table>
    </div>
    <div class="content">
      <table width="100%" id="shopCart">
        <tr>
          <th align="left"><?php echo $column_product; ?></th>
          <th align="right"><?php echo $column_quantity; ?></th>
          <th align="right"><?php echo $column_price; ?></th>
          <th align="right"><?php echo $column_total; ?></th>
        </tr>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td align="left" valign="top"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <!--<td align="left" valign="top"><?php echo $product['weight']; ?></td>-->
          <td align="right" valign="top"><?php echo $product['quantity']; ?></td>
          <td align="right" valign="top"><?php echo $product['price']; ?></td>
          <td align="right" valign="top"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
      </table>
      <div style="width: 100%; display: inline-block; border: 1px solid #e1e1e1;">
        <table style="float: right; display: inline-block;">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td align="right"><?php echo $total['title']; ?></td>
            <td align="right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <br />
      </div>
    </div>
    <?php if ($comment) { ?>
    <b style="margin-bottom: 2px; display: block;"><?php echo $text_comment; ?></b>
    <div class="content"><?php echo $comment; ?></div>
    <?php } ?>
    <div id="payment"><?php echo $payment; ?></div>
  </div>
  
  
   </div>
 </div>
</div>
<!--CONTAINER ENDS HERE-->
<?php echo $footer; ?> 