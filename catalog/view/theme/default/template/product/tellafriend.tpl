  <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.3.2.min.js"></script>
  <h1 style="padding-left:10px;"><?php echo $heading_title; ?></h1>
  
  <div style="border:none; width:550px; padding-left:10px;">
    <?php if($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div><br />

    <?php } elseif($success) { ?>
    <div class="content">
    <div class="successfullySent"><?php echo $success; ?>
    </div><br />

    <div class="clear"></div>
    
    <div class="buttons">
      <table>
        <tr>
          <td align="right"><a class="nyroModalClose button"><span>Close</span></a></td>
        </tr>
      </table>
    </div>
    
    </div><br />

    <?php } else {?>
    <div class="content">
    <h3>Tell a friend about - <?php if(isset($product_name)) echo $product_name; ?></h3><br />
    
Would this product be perfect for a friend of yours, or do you want their opinion before you make a purchase? Please fill in the form below and we will send them an email including your message and the details for this product.

    </div>
    <form class="nyroModal" action="<?php echo $action; ?>" method="post" id="sendData">
      <div class="content">
       <table width="100%" border="0">
          <tr>
            <td>
            
            <table>
          <tr>
            <td width="100"><span class="required">*</span> Friends Name</td>
            <td><input class="mediumText" type="text" name="fname" value="<?php echo $fname; ?>" />
              <?php if ($error_fname) { ?>
              <span class="error"><?php echo $error_fname; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Friends Email</td>
            <td><input class="mediumText" type="text" name="femail" value="<?php echo $femail; ?>" />
              <?php if ($error_femail) { ?>
              <span class="error"><?php echo $error_femail; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td width="100"><span class="required">*</span>Your Name</td>
            <td><input class="mediumText" type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>Your Email</td>
            <td><input class="mediumText" type="text" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Your Message</td>
            <td><textarea name="message" cols="23" rows="3"><?php echo $message; ?></textarea>
              <?php if ($error_message) { ?>
              <span class="error"><?php echo $error_message; ?></span>
              <?php } ?></td>
          </tr>
          
        </table>
            
            </td>
            <td>
            <img src="<?php echo $thumb; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" id="image" width="150" />
            
            </td>
          </tr>
        </table>

       
        
      </div>
      <div class="buttons">
        <table width="70%">
          <tr>
            <td align="right"><a onclick="$('#sendData').submit();" class="button"><span>Send</span></a>&nbsp;</td>
            <td align="left"><a class="nyroModalClose button"><span>Cancel</span></a></td>
          </tr>
        </table>
      </div>
      
    </form>
    <?php } ?>
  </div>