<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="profile" href="https://gmpg.org/xfn/11" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet"> 
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<header class="header" >
    <!-- Desktop Header -->
    <div class="container d-flex align-center justify-space-between">
        <!-- Header Logo Template -->
        <div class="header__logo">
            <?php get_template_part( 'template-parts/custom_logo' ); ?>
        </div><!-- Header Logo Template End -->

        <!-- Header Menu Template -->
        <div class="header__menu">
            <?php get_template_part( 'template-parts/header_menu' ); ?>
        </div><!-- Header Menu Template End -->
    </div><!-- Desktop Header End -->
    
    <!-- Sticky/Mobile Header -->
    <div id="stickyHeader">
        <div class="container d-flex align-center justify-space-between">
            <!-- Header Logo Template -->
            <div class="header__logo">
                <?php get_template_part( 'template-parts/custom_logo' ); ?>
            </div><!-- Header Logo Template End -->

            <!-- Header Search Template -->
            <div class="headerSearch">
                <?php get_template_part( 'template-parts/search-block' ); ?>
            </div><!-- Header Search Template End -->

            <!-- Header Menu Template -->
            <div class="header__menu">
                <button class="menuToggle">
                    <span class="material-icons material-icons-outlined open-menu">menu</span>
                    <span class="material-icons material-icons-outlined close-menu inactive">close</span>
                </button>
                <?php get_template_part( 'template-parts/header_menu' ); ?>
            </div><!-- Header Menu Template End -->
        </div>
    </div><!-- Sticky/Mobile End -->
    
</header>