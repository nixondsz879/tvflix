<section class="latestMovies">
    <div class="container">
        <div class="movieList">
            
            <?php
            $latest_movies = get_trending();

		    if( isset($latest_movies->results) && !empty($latest_movies->results) ) {
		    	$i = 1;
		    	$movie_list = "";
				ob_start();
		    	foreach ($latest_movies->results as $movie) {
		    		if($movie->poster_path) {
		    			?>
			    		<div class="slide movieItem movieItem-<?php echo $i; ?>">
				            <?php get_template_part( 'template-parts/movie', null, ["movie" => $movie] ); ?>
				        </div>
			    		<?php

			    		if($i == 10) {
			    			break;
			    		}

			    		$i++;
		    		}
		    	}

		    	$movie_list = ob_get_clean();

				echo $movie_list;
		    }
		    ?>
            <div class="clearFix"></div>
            <a href="<?php echo site_url(); ?>/all-movies" class="viewAllBtn btn">
                View All
            </a>
        </div>
    </div>
</section>