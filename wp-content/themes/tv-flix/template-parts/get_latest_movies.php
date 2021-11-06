<?php
$sort = (isset($args["sort"])) ? $args["sort"] : "";
$order = (isset($args["order"])) ? $args["order"] : "";
$genre = (isset($args["genre"])) ? $args["genre"] : "";
$latest_movies = get_latest_movies( $args["page"], $sort, $order, $genre );

if( isset($latest_movies->results) && !empty($latest_movies->results) ) {
	$i=1;
	$movie_list = "";
	ob_start();
	foreach ($latest_movies->results as $movie) {
		if($movie->poster_path) {
			?>
    		<div class="movieItem movieItem-<?php echo $i; ?> <?php echo (isset($args["slowLoad"]) && $args["slowLoad"]) ? "slowLoad" : ""; ?>">
	            <?php get_template_part( 'template-parts/movie', null, ["movie" => $movie] ); ?>
	        </div>
    		<?php
		}
		$i++;
	}
	$movie_list = ob_get_clean();

	echo $movie_list;
}