<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
<title><?php echo $title; ?></title>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($icon) { ?>
<link href="image/<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/common.css" />
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/unitpngfix/unitpngfix.js"></script>
<![endif]-->
<?php foreach ($styles as $style) { ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/<?php echo $style; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/thickbox/thickbox-compressed.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/thickbox/thickbox.css" />

<script type="text/javascript" src="catalog/view/theme/default/nyro/js/jquery.nyroModal-1.5.5.pack.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/nyro/styles/nyroModal.css" />


<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="view/javascript/jquery/<?php echo $script; ?>"></script>
<?php } ?>
	<meta property="og:url"           content="http://www.honokacomputers.com" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="Online store for electronics" />
	<meta property="og:description"   content="We sell PCs, laptops, smartphones and tablets" />
	<meta property="og:image"         content="catalog/view/theme/default/images/advertisement_fujitsu_lifebook.jpg" />
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

<div class="mainwraper">
  <!--HEADER STARTS HERE-->
   <div class="hedwraper">
      <div class="HedTop">
        <div class="LogoHolder"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $store; ?>" alt="<?php echo $store; ?>" /></a></div>
        <!--<div class="LogoHolder"><a href="<?php echo ""; ?>"><img src="<?php echo ""; ?>" title="<?php echo ""; ?>" alt="<?php echo ""; ?>" /></a></div>-->
	<div class="HedTopRight">
           <div class="HedTopHelp"><a href="index.php?route=/information/pages&page_id=7" class="nyroModal">Why buy from us?</a><br />Help&nbsp;Line:&nbsp;<small><?php echo $telephone; ?></small></div>     <div class="ShopingBox">
              <div class="ShopingLeft"></div>
               <div class="ShopingMed">
                 <h3><a href="<?php echo $cart_href; ?>"><img src="catalog/view/theme/default/images/Sopinpic.jpg" alt="Shopping Cart" /> Shopping Cart </a></h3>
                 <div class="SpinNoItem">Now in your cart <b><?php if($cart_count < 2 ) echo $cart_count . ' Item'; else echo $cart_count . ' Items'; ?></b></div>
                 <div class="SpinNoItem">
                   <?php if (!$logged) { ?>
                   <a href="index.php?route=/common/login_popup" class="nyroModal">Log In</a>
                   <?php } else { ?>
                   <a href="<?php echo $logout; ?>" target="_self" title="Log In">Log Out</a>
                   <?php } ?>
                   <a href="<?php echo $checkout; ?>" target="_self" title="Checkout">Checkout</a>
                   <?php if (!$logged) { ?>
                   <a href="index.php?route=/common/login_popup" class="nyroModal">My Account</a>
                   <?php } else { ?>
                   <a href="<?php echo $account; ?>" title="My Account" target="_self">My Account</a>
                   <?php } ?>
                 </div>
             </div>
			<div class="ShopingRight"></div>
           </div>
        </div>
        <div class="navHolder">
           <div class="NavLeft">
              <a href="<?php echo $home; ?>" id="tab_home" class="butnhome" title="HOME">HOME</a>
              <a href="<?php echo $about; ?>" id="tab_about" class="butnabout" title="ABOUT US">ABOUT US</a>
              <a href="<?php echo $product; ?>" id="tab_product" class="butnproduct" title="PRODUCTS">PRODUCTS</a>
              <a href="<?php echo $policy; ?>" id="tab_policy" class="butnpolicy" title="SHIPPING POLICY">SHIPPING POLICY</a>
              <a href="<?php echo $special; ?>" id="tab_special" class="butnspecial" title="SPECIAL PRODUCTS">SPECIAL PRODUCTS</a>
              <a href="<?php echo $contact; ?>" id="tab_contanct" class="butncontact" title="CONTACT US">CONTACT US</a>
           </div>

           <div class="NavSearch">
            <form action="" onsubmit="return false;">
            <?php if ($keyword) { ?>
            <input type="text" value="<?php echo $keyword; ?>" id="filter_keyword" class="navInput" />
            <?php } else { ?>
            <input type="text" value="<?php echo $text_keyword; ?>" id="filter_keyword" onclick="this.value = '';" class="navInput" />
            <?php } ?>

            <input type="hidden" value="0" id="filter_category_id" />
            <input type="submit" class="navSubmit" value="" onclick="moduleSearch();" />
            </form>
           </div>
        </div>
        <div class="HedBlank"></div>
     </div>
    <!--HEADER ENDS HERE-->



<script type="text/javascript"><!-- 
function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

$(document).ready(function() {
	route = getURLVar('route');
	
	if (!route) {
		$('#tab_home').addClass('HomeActv');
	} else {
		part = route.split('/');
		
		if (route == 'common/home') {
			$('#tab_home').addClass('HomeActv');
		} else if (route == 'information/information') {
			information_id = getURLVar('information_id');
			if(information_id == 4){
				$('#tab_about').addClass('AboutActv');
			}
			if(information_id == 3){
				$('#tab_policy').addClass('PolicyActv');
			}
		} else if (route == 'product/special') {
			$('#tab_special').addClass('SpecialActv');
		} else if (part[0] == 'product') {
			$('#tab_product').addClass('ProductActv');
		} else if (route == 'information/contact') {
			$('#tab_contanct').addClass('ContactActv');
		} else {
			$('#tab_home').addClass('HomeActv');
		}
	}
});
//--></script>
<script type="text/javascript"><!--
$('#module_search input').keydown(function(e) {
	if (e.keyCode == 13) {
		moduleSearch();
	}
});

function moduleSearch() {
	url = 'index.php?route=product/search';
	
	var filter_keyword = $('#filter_keyword').attr('value')
	
	if (filter_keyword) {
		url += '&keyword=' + encodeURIComponent(filter_keyword);
	}
	
	var filter_category_id = $('#filter_category_id').attr('value');
	
	if (filter_category_id) {
		url += '&category_id=' + filter_category_id;
	}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$('.switcher').bind('click', function() {
	$(this).find('.option').slideToggle('fast');
});
//--></script>