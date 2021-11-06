<a href="<?php echo site_url(); ?>" class=" d-flex align-center">
    <?php
    if ( has_custom_logo() ) {
        $logo = wp_get_attachment_image_src( get_theme_mod( 'custom_logo' ), 'full' );
        ?>
        <img class="sr-banner-logo" src="<?php echo $logo[0]; ?>" alt="<?php echo get_bloginfo( 'name' ); ?>"> <span><?php echo get_bloginfo( 'name' ); ?></span>
        <?php
    }
    ?>
</a>
            