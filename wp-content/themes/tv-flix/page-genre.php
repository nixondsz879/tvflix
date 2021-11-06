<?php
global $genres;

$genre = get_query_var("genre");

if(!isset($genres[$genre])) {
	wp_redirect( home_url() );
	exit;
}

get_header();
?>

	<main id="primary" class="site-main">

		<?php
		if ( have_posts() ) :

			/* Start the Loop */
			while ( have_posts() ) :
				the_post();
				?>
				<section class="moviesListView">
				    <div class="searchArea">
				        <?php get_template_part( 'template-parts/backdrop-slider' ); ?>
				        <div class="overlay"></div>
				    </div>
				    <div class="container">
				    	<h1 class="page-title">
				    		Movies showing for "<?php echo $genres[$genre]; ?>"
				    	</h1>
				        <div class="actions">
				            <span>Sort By: </span>
				            <ul>
				                <li class="rating">
				                    <label for="rating"><span class="material-icons">star_border</span> Rating</label><input type="radio" name="sort" id="rating" value="vote_average" data-default="desc" />
				                </li>
				                <li class="date">
				                	<label for="date"><span class="material-icons">event</span> Date</label><input type="radio" name="sort" id="date" value="release_date" data-default="desc" />
				                </li>
				                <li class="title">
				                	<label for="title"><span class="material-icons">sort_by_alpha</span> Title</label><input type="radio" name="sort" id="title" data-default="desc" value="original_title" />
				                </li>
				            </ul>
				        </div>
				        <div class="movieList">
					        <?php
					        get_template_part( 'template-parts/get_latest_movies', null, ["page" => 1, "genre" => $genre] );
					        ?>
				        </div>
				        <div id="loadmore" data-page="2">
				        	<img src="<?php echo BASE_URI; ?>/assets/build/src/img/loader.svg" alt="TV Flix" />
				        </div>
				    </div>
				</section>
				<?php
				
			endwhile;

		endif;
		?>

	</main><!-- #main -->

<?php
get_footer();
