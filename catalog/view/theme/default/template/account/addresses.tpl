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
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <b style="margin-bottom: 2px; display: block;"><?php echo $text_address_book; ?></b>
    <?php foreach ($addresses as $result) { ?>
    <div class="content">
      <table width="100%">
        <tr>
          <td><?php echo $result['address']; ?></td>
          <td style="text-align: right;" width="200px;"><a onclick="location='<?php echo $result['update']; ?>'" class="button"><span><?php echo $button_edit; ?></span></a>&nbsp;<a onclick="location='<?php echo $result['delete']; ?>'" class="button"><span><?php echo $button_delete; ?></span></a></td>
        </tr>
      </table>
    </div>
    <?php } ?>
    <div class="buttons">
      <table>
        <tr>
          <td align="left"><a onclick="location='<?php echo $back; ?>'" class="button"><span><?php echo $button_back; ?></span></a></td>
          <td align="right"><a onclick="location='<?php echo $insert; ?>'" class="button"><span><?php echo $button_new_address; ?></span></a></td>
        </tr>
      </table>
    </div>
  </div>
  
  
   </div>
 </div>
</div>
<!--CONTAINER ENDS HERE-->
<?php echo $footer; ?> 