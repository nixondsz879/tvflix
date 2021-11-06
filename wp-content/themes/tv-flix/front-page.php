<?php
get_header();
?>

	<main id="primary" class="site-main">

		<?php
		if ( have_posts() ) :

			/* Start the Loop */
			while ( have_posts() ) :
				the_post();
				the_content();

				get_template_part( 'template-parts/search-area' ); /* Search Area Template */
				get_template_part( 'template-parts/latest-movies' ); /* Latest Movies Template */
				
			endwhile;

		endif;
		?>

	</main><!-- #main -->

<?php
get_footer();
