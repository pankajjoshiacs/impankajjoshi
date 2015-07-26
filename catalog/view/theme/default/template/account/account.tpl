<?php echo $header; ?>
<!--CONTAINER STARTS HERE-->
<div class="ContainHolder">
 <?php echo $column_left; ?>
 
<div class="ContRight">
  
  <div class="ContRightBot">
  <div class="ContRightBotTitle">
    <div class="LtstLeft"></div>
    <div class="Ltstmed"><?php echo $heading_title; ?></div>
    <div class="LtstRight"></div>
  </div>
   <div class="clear">&nbsp;</div>
   
  <div class="middle">
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <p style="margin:10px 0;"><b><?php echo $text_my_account; ?></b></p>
    <ul style="margin-left:10px;">
      <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
    </ul>
    <p style="margin:10px 0;"><b><?php echo $text_my_orders; ?></b></p>
    <ul style="margin-left:10px;">
      <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
     
    </ul>
    <p style="margin:10px 0;"><b><?php echo $text_my_newsletter; ?></b></p>
    <ul style="margin-left:10px;">
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  
  
    </div>
  </div>
</div>
<!--CONTAINER ENDS HERE-->
<?php echo $footer; ?> 