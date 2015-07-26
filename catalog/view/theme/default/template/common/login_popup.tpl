<?php if ($success) { ?>
<script language="javascript" type="text/javascript">
  location.reload();
  $.nyroModalRemove();
  </script>
<?php } ?>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.3.2.min.js"></script>
  
  <div style="width:500px;">
  
  
  <h1 style="padding-left:10px;"><?php echo $heading_title; ?></h1>
  
    <div class="content">
    <p>Use your account information to make checkout faster.<br />
	Do you want to login? You will get the following benefits:<br /><br />
    <ul style="padding-left:20px;">
    <li>Ability to track you order</li>
    <li>Faster checkout proccess</li>
    <li>Address book entry</li>
    </ul>
    </p>

    </div>
    
    <form class="nyroModal" action="<?php echo $action; ?>" method="post" id="sendData">
        <?php if ($error) { ?>
        <div class="warning"><?php echo $error; ?></div>
        <?php } ?>
      
      <div class="content">
       <table width="100%" border="0">
          <tr>
            <td><span class="required">*</span>Email :</td>
            <td><input class="mediumText" type="text" name="email" value="" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Password :</td>
            <td><input class="mediumText" type="password" name="password" value="" /></td>
          </tr>
          <tr>
              <td></td>
              <td><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten_password; ?></a></td>
          </tr>
        </table>
      </div>
      
      <div class="buttons">
        <table width="70%">
          <tr>
            <td align="right"><a onclick="$('#sendData').submit();" class="button"><span>Login</span></a>&nbsp;</td>
            <td align="left"><a class="nyroModalClose button"><span>Cancel</span></a></td>
          </tr>
        </table>
      </div>
      
    </form>
    
  </div>
<script type="text/javascript"><!--
$('#sendData input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#sendData').submit();
	}
});
</script>