<?php
get_header();
?>

	<main id="primary" class="site-main">

		<section class="moviesListView">
		    <div class="searchArea">
		        <?php get_template_part( 'template-parts/backdrop-slider' ); ?>
		        <div class="overlay"></div>
		    </div>
		    <div class="container">
		    	<h1 class="page-title">
		    		Movies showing for "<?php echo $_GET["s"]; ?>"
		    	</h1>
		        <div class="actions">
		            <span>Sort By: </span>
		            <ul>
		                <li class="rating">
		                    <span class="material-icons">star_border</span><label for="rating"> Rating</label><input type="radio" name="sort" id="rating" value="rating" data-default="desc" (click)="sortMovie('rating')" />
		                </li>
		                <li class="date">
		                	<span class="material-icons">event</span> <label for="date">Date</label><input type="radio" name="sort" id="date" value="date" data-default="desc" (click)="sortMovie('date')" />
		                </li>
		                <li class="title">
		                	<span class="material-icons">sort_by_alpha</span> <label for="title">Title</label><input type="radio" name="sort" id="title" data-default="desc" value="title" (click)="sortMovie('title')" />
		                </li>
		            </ul>
		        </div>
		        <?php
		        $latest_movies = get_search();
		        if( isset($latest_movies->results) && !empty($latest_movies->results) ) {
		        	?>
		        	<div class="movieList">
		        		<?php
		        		$movie_list = "";
						ob_start();
				    	foreach ($latest_movies->results as $movie) {
				    		if($movie->poster_path) {
				    			?>
					    		<div class="movieItem movieItem-<?php echo $i; ?>">
						            <?php get_template_part( 'template-parts/movie', null, ["movie" => $movie] ); ?>
						        </div>
					    		<?php
				    		}
				    	}
				    	$movie_list = ob_get_clean();

						echo $movie_list;
				    	?>
			            <div class="clearFix"></div>
			        </div>
			        <?php
			    }
		        ?>
		    </div>
		</section>

	</main><!-- #main -->

<?php
get_footer();
