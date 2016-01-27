<div class="ContLeft">
      
      <?php foreach ($modules as $module) { ?>
      <?php echo ${$module['code']}; ?>
      <?php } ?>
      
      <?php if($sproduct){ ?>
      <div class="ContLeftTitle"><img src="catalog/view/theme/default/images/Spepoduct.jpg" alt="Special product" /></div>
      <div class="ContLeftDes">
      <div class="Spedes">
        <a href="<?php echo $sproduct['href']; ?>"><img src="<?php echo $sproduct['thumb']; ?>" alt="Special product" title="<?php echo $sproduct['name']; ?>" /></a>
        <div style="padding:5px 0;"><a href="<?php echo $sproduct['href']; ?>"><?php echo $sproduct['name']; ?></a></div>
      </div>  
        <div class="Spedes">
         <a href="<?php echo $sproduct['href']; ?>" target="_self" title="Details" class="pdtlslnk" style="float:right; margin-right:10px;"></a>
         <b>Price : <span style="text-decoration:line-through; color:#999999;"><?php echo $sproduct['price']; ?></span> <?php echo $sproduct['special']; ?></b>
        </div>
      </div>
      <?php } ?>
      
      
      <div class="ContLeftTitle"><img src="catalog/view/theme/default/images/addtitle.jpg" alt="Advertisements" /></div>
      <div class="ContLeftDes">
       <img src="catalog/view/theme/default/images/advertisement_fujitsu_lifebook.jpg" alt="Advertisements" width="235px" />
       <img src="catalog/view/theme/default/images/advertisement_hp_products.jpg" alt="Advertisements" width="235px" />
      </div>
      
    </div>