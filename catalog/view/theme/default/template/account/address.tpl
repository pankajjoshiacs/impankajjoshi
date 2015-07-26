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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address">
      <b style="margin-bottom: 2px; display: block;"><?php echo $text_edit_address; ?></b>
      <div class="content">
        <table>
          <tr>
            <td width="150"><span class="required">*</span> <?php echo $entry_firstname; ?></td>
            <td><input type="text" class="largeText" name="firstname" value="<?php echo $firstname; ?>" />
              <?php if ($error_firstname) { ?>
              <span class="error"><?php echo $error_firstname; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
            <td><input type="text" class="largeText" name="lastname" value="<?php echo $lastname; ?>" />
              <?php if ($error_lastname) { ?>
              <span class="error"><?php echo $error_lastname; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_company; ?></td>
            <td><input type="text" class="largeText" name="company" value="<?php echo $company; ?>" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
            <td><input type="text" class="largeText" name="address_1" value="<?php echo $address_1; ?>" />
              <?php if ($error_address_1) { ?>
              <span class="error"><?php echo $error_address_1; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_address_2; ?></td>
            <td><input type="text" class="largeText" name="address_2" value="<?php echo $address_2; ?>" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_city; ?></td>
            <td><input type="text" class="largeText" name="city" value="<?php echo $city; ?>" />
              <?php if ($error_city) { ?>
              <span class="error"><?php echo $error_city; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_postcode; ?></td>
            <td><input type="text" class="largeText" name="postcode" value="<?php echo $postcode; ?>" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_country; ?></td>
            <td><select name="country_id" id="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=account/address/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');" class="largeSelect">
                <option value="FALSE"><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <span class="error"><?php echo $error_country; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
            <td><select name="zone_id" class="largeSelect">
              </select>
              <?php if ($error_zone) { ?>
              <span class="error"><?php echo $error_zone; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_default; ?></td>
            <td><?php if ($default) { ?>
              <input type="radio" name="default" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <input type="radio" name="default" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="default" value="1" />
              <?php echo $text_yes; ?>
              <input type="radio" name="default" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
            <td align="left"><a onclick="location='<?php echo $back; ?>'" class="button"><span><?php echo $button_back; ?></span></a></td>
            <td align="right"><a onclick="$('#address').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          </tr>
        </table>
      </div>
    </form>
  </div>
  
   </div>
 </div>
</div>
<!--CONTAINER ENDS HERE-->

<script type="text/javascript"><!--
$('select[name=\'zone_id\']').load('index.php?route=account/address/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');

$('#country_id').attr('value', '<?php echo $country_id; ?>');
//--></script>
<?php echo $footer; ?> 