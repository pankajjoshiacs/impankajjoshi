  <link href="catalog/view/theme/default/stylesheet/tom-murphy-style.css" rel="stylesheet" type="text/css" media="screen" />
  <link href="catalog/view/theme/default/stylesheet/nyroModal.css" rel="stylesheet" type="text/css" media="screen" />
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
    <h3>Ask a question about - <?php if(isset($product_name)) echo $product_name; ?></h3><br />
    Here at Honoka Computers we take pride in our customer relations. We aim to answer any questions you may have in as much detail as possible. We will hopefully have a response to your questions back to you within 24 hours.
    </div>
    <form class="nyroModal" action="<?php echo $action; ?>" method="post" id="sendData">
      <div class="content">
        
        <table width="100%" border="0">
          <tr>
            <td>
            <table>
          <tr>
            <td width="100"><span class="required">*</span> Name</td>
            <td><input class="mediumText" type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Email</td>
            <td><input class="mediumText" type="text" name="email" value="<?php echo $email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td> Telephone</td>
            <td><input class="mediumText" type="text" name="telephone" value="<?php echo $telephone; ?>" /></td>
          </tr>
          <tr>
            <td> Size Required</td>
            <td><input class="mediumText" type="text" name="size" value="<?php echo $size; ?>" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Your Question</td>
            <td><textarea name="question" cols="23" rows="3"><?php echo $question; ?></textarea>
              <?php if ($error_question) { ?>
              <span class="error"><?php echo $error_question; ?></span>
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