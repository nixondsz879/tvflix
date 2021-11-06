<?php
global $genres;

if(!$args['movie']) {
    return;
}

$movie = $args['movie'];

$genre_list = [];

foreach ($movie->genre_ids as $key => $genre_id) {
    if(isset($genres[$genre_id])) {
        $genre_list[] = $genres[$genre_id];
    }
}

$movie_details = get_movie_details($movie->id);

//pr($movie_details);
$hours = "";
if(isset($movie_details->runtime) && $movie_details->runtime) {
    $minutes=$movie_details->runtime;

    $hrs = intdiv($minutes, 60);
    $mins = ($minutes % 60);


    if( $hrs != 0 ) {
        $hours .= $hrs. "hr ";
    }

    if( $mins != 0 ) {
        $hours .= $mins. "min";
    }
}
?>
<div class="movieCard">
    <a
        href="<?php echo site_url(); ?>/movies/<?php echo $movie->id; ?>"
    >
        <?php
        $poster_path = "https://image.tmdb.org/t/p/w500".$movie->poster_path;
        ?>
        <img src="<?php echo $poster_path; ?>" alt="<?php echo $movie->title;; ?>">
        <div class="certification"><?php echo ($movie->adult) ? "A" : "UA"; ?></div>
        <div class="info">
            <h4 class="title"><?php echo $movie->title;; ?></h4>
            <div class="genre"><?php echo implode(", ", $genre_list); ?></div>
            <div class="meta">
                <div class="duration"><?php echo $hours; ?></div>
                <?php if($movie->vote_average) {
                    ?>
                    <div class="rating"><span class="material-icons">grade</span> <?php echo $movie->vote_average; ?></div>
                    <?php
                } ?>
            </div>
        </div>
        <!-- <img src="https://image.tmdb.org/t/p/w500{{ movie.poster_path }}" alt="{{movie.title}}"> -->
    </a>
</div>