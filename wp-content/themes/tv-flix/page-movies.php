<?php
get_header();

$movie_id = get_query_var("movies");

$movie = get_movie_details($movie_id);


$genre_list = [];
if(($movie->genres) && !empty($movie->genres)) {
	foreach ($movie->genres as $key => $genre) {
	    $genre_list[] = $genre->name;
	}
}

$minutes=$movie->runtime;

$hrs = intdiv($minutes, 60);
$mins = ($minutes % 60);

$hours = "";
if( $hrs != 0 ) {
    $hours .= $hrs. "hr ";
}

if( $mins != 0 ) {
    $hours .= $mins. "min";
}

$yt = "";
if(isset($movie->videos->results[0])) {
	$yt = $movie->videos->results[0]->id;
}

//"Starring", "Director", "Screenplay", "Story"
$credits_summary = [];

if($movie->credits->cast) {
	$i=1;
	foreach ($movie->credits->cast as $key => $cast) {
		$credits_summary["Starring"][$cast->id] = '<a href="https://www.themoviedb.org/person/'.$cast->id.'-'.strtolower( str_replace(" ", "-", $cast->name) ).'">'.$cast->name.'</a>';
			
		if( $i == 5 ) {
			break;
		}

		$i++;
	}
}

if($movie->credits->crew) {
	foreach ($movie->credits->crew as $key => $crew) {
		if(isset($crew->job) && $crew->job == "Director") {
			$credits_summary["Director"][$crew->id] = '<a href="https://www.themoviedb.org/person/'.$crew->id.'-'.strtolower( str_replace(" ", "-", $crew->name) ).'">'.$crew->name.'</a>';
		}

		if(isset($crew->job) && $crew->job == "Screenplay") {
			$credits_summary["Screenplay"][$crew->id] = '<a href="https://www.themoviedb.org/person/'.$crew->id.'-'.strtolower( str_replace(" ", "-", $crew->name) ).'">'.$crew->name.'</a>';
		}

		if(isset($crew->job) && $crew->job == "Story") {
			$credits_summary["Story"][$crew->id] = '<a href="https://www.themoviedb.org/person/'.$crew->id.'-'.strtolower( str_replace(" ", "-", $crew->name) ).'">'.$crew->name.'</a>';
		}
	}
}
?>
	<main id="primary" class="site-main">

		<section class="movieDetails">
		    <?php get_template_part("template-parts/backdrop-image", null, ["backdrop_path" => $movie->backdrop_path]); ?>
		    <div class="container">
		        <div class="imgContainer">
		        	<?php if($movie->poster_path) {
		        		?>
		        		<img src="https://image.tmdb.org/t/p/w500<?php echo $movie->poster_path; ?>" alt="<?php echo $movie->title; ?>">
		        		<?php
		        	} ?>
		        </div>
		        <div class="infoContainer">
		            <h1 class="title">
		                <?php echo $movie->title; ?> <span class="year">(<?php echo date("Y", strtotime($movie->release_date)); ?>)</span>
		            </h1>
		            <div class="meta">
		                <ul>
		                    <li>
		                        <div class="rating"><?php echo ($movie->adult) ? "A" : "UA"; ?></div>
		                    </li>
		                    <li>
		                        <div class="date"><?php echo $movie->release_date; ?></div>
		                    </li>
		                    <li class="genres">
		                        <div class="genre"><?php echo implode(", ", $genre_list); ?></div>
		                    </li>
		                    <li>
		                        <div class="runtime"><?php echo $hours; ?></div>
		                    </li>
		                </ul>
		            </div>
		            <div class="watchTrailer">
		            	<a href="http://www.youtube.com/watch?v=<?php echo $yt; ?>" class="popup-youtube"><span class="material-icons">live_tv</span> <span>Play Trailer</span></a>
		            </div>
		            <div class="overview">
		            	<h3>Overview</h3>
		                <?php echo $movie->overview; ?>
		            </div>
		            <div class="credits">
		            	<?php
		            	foreach ($credits_summary as $job => $values) {
		            		?>
		            		<div class="director">
			                    <h3><?php echo $job; ?></h3>
			                    <div class="role"><?php echo implode(", ", $values); ?></div>
			                </div>
		            		<?php
		            	}
		            	?>
		            </div>
		        </div>
		    </div>
		</section>
		<section class="castCrew">
		    <div class="container">
	            <h2 class="title">
	                Cast & Crew
	            </h2>
		        <div class="castContainer">
		            <?php
		            $i=1;
		            foreach ($movie->credits->cast as $key => $cast) {
						?>
						<div class="cast_block">
							<a href="https://www.themoviedb.org/person/<?php echo $crew->id; ?>-<?php echo strtolower( str_replace(" ", "-", $crew->name) ); ?>" class="img">
								<div class="img_block">
									<?php
									$profile_path = BASE_URI."/assets/build/src/img/film-poster-placeholder.png";

									if(isset($cast->profile_path) && $cast->profile_path) {
										$profile_path = 'https://www.themoviedb.org/t/p/w138_and_h175_face/'.$cast->profile_path;
									}
									?>
									<img src="<?php echo $profile_path; ?>" alt="<?php echo $cast->name; ?>">
								</div>
								<div class="info">
									<h4 class="name">
										<?php echo ($cast->name); ?>
									</h4>
									<div class="character">
										<?php echo ($cast->character); ?>
									</div>
								</div>
							</a>
						</div>
						<?php
						if($i == 6) {
							break;
						}
						$i++;
					}
		            ?>
		        </div>
		        <button class="viewAllBtn btn btn-fullCast">
	                View Full Cast & Crew
	            </button>
		        <div class="castContainer fullCast" style="display: none;">
		            <?php

		            $i=1;
		            foreach ($movie->credits->cast as $key => $cast) {
		            	if($i <= 6) {
							continue;
						}

						?>
						<div class="cast_block">
							<a href="https://www.themoviedb.org/person/<?php echo $crew->id; ?>-<?php echo strtolower( str_replace(" ", "-", $crew->name) ); ?>" class="img">
								<div class="img_block">
									<?php
									$profile_path = BASE_URI."/assets/build/src/img/film-poster-placeholder.png";

									if(isset($cast->profile_path) && $cast->profile_path) {
										$profile_path = 'https://www.themoviedb.org/t/p/w138_and_h175_face/'.$cast->profile_path;
									}
									?>
									<img src="<?php echo $profile_path; ?>" alt="<?php echo $cast->name; ?>">
								</div>
								<div class="info">
									<?php if(isset($cast->name)) {
										?>
										<h4 class="name">
											<?php echo ($cast->name); ?>
										</h4>
										<?php
									} ?>
										
									<?php if(isset($cast->character)) {
										?>
										<div class="character">
											<?php echo ($cast->character); ?>
										</div>
										<?php
									} ?>
								</div>
							</a>
						</div>
						<?php
						$i++;
					}

		            foreach ($movie->credits->crew as $key => $crew) {
						?>
						<div class="cast_block">
							<a href="https://www.themoviedb.org/person/<?php echo $crew->id; ?>-<?php echo strtolower( str_replace(" ", "-", $crew->name) ); ?>" class="img">
								<div class="img_block">
									<?php
									$profile_path = BASE_URI."/assets/build/src/img/film-poster-placeholder.png";

									if(isset($crew->profile_path) && $crew->profile_path) {
										$profile_path = 'https://www.themoviedb.org/t/p/w138_and_h175_face/'.$crew->profile_path;
									}
									?>
									<img src="<?php echo $profile_path; ?>" alt="<?php echo $crew->name; ?>">
								</div>
								<div class="info">
									<?php if(isset($crew->name)) {
										?>
										<h4 class="name">
											<?php echo ($crew->name); ?>
										</h4>
										<?php
									} ?>
										
									<?php if(isset($crew->job)) {
										?>
										<div class="character">
											<?php echo ($crew->job); ?>
										</div>
										<?php
									} ?>
								</div>
							</a>
						</div>
						<?php
					}
		            ?>
		        </div>
		    </div>
		</section>

	</main><!-- #main -->

<?php
get_footer();
