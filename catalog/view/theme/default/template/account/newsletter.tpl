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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter">
      <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
        <table>
          <tr>
            <td width="150"><?php echo $entry_newsletter; ?></td>
            <td><?php if ($newsletter) { ?>
              <input type="radio" name="newsletter" value="1" checked="checked" />
              <?php echo $text_yes; ?>&nbsp;
              <input type="radio" name="newsletter" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="newsletter" value="1" />
              <?php echo $text_yes; ?>&nbsp;
              <input type="radio" name="newsletter" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
            <td align="left"><a onclick="location='<?php echo $back; ?>'" class="button"><span><?php echo $button_back; ?></span></a></td>
            <td align="right"><a onclick="$('#newsletter').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          </tr>
        </table>
      </div>
    </form>
  </div>
  
  
  
  </div>
 </div>
</div>
<!--CONTAINER ENDS HERE-->

<?php echo $footer; ?> 