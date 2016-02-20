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
    <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="contact">

      <div class="content">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1620.085229486397!2d139.7717737!3d35.6974227!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzXCsDQxJzUwLjQiTiAxMznCsDQ2JzIxLjciRQ!5e0!3m2!1sen!2sjp!4v1455370562030" width="689.74" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>

      <div class="content">
        <div style="display: inline-block; width: 100%;">
          <div style="float: left; display: inline-block; width: 50%;"><b><?php echo $text_address; ?></b><br />
            <?php echo $store; ?><br />
            <?php echo $address; ?></div>
          <div style="float: right; display: inline-block; width: 50%;">
            <?php if ($telephone) { ?>
            <b><?php echo $text_telephone; ?></b><br />
            <?php echo $telephone; ?><br />
            <br />
            <?php } ?>
            <?php if ($fax) { ?>
            <b><?php echo $text_fax; ?></b><br />
            <?php echo $fax; ?>
            <?php } ?>
          </div>
        </div>
      </div>
      <div class="content">
        <table width="100%">
          <tr>
            <td><?php echo $entry_name; ?><br />
              <input type="text" class="largeText" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <div class="clear">&nbsp;</div>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_email; ?><br />
              <input type="text" class="largeText" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <div class="clear">&nbsp;</div>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_enquiry; ?><br />
              <textarea name="enquiry" style="width: 99%;" rows="10"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="clear">&nbsp;</div>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_captcha; ?><br />
              <input type="text" class="largeText" name="captcha" value="<?php echo $captcha; ?>" />
              <?php if ($error_captcha) { ?>
              <div class="clear">&nbsp;</div>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
              <br />
              <img src="index.php?route=information/contact/captcha" /></td>
          </tr>
        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><a onclick="$('#contact').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
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