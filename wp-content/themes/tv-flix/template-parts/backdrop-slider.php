<div id="backdrop-slider" class="carousel">
    <?php
    $now_playing = get_now_playing();

    if( isset($now_playing->results) && !empty($now_playing->results) ) {
        $i = 1;
        foreach ($now_playing->results as $movie) {
            if($movie->backdrop_path) {
                ?>
                <div class="slide">
                    <img src="https://image.tmdb.org/t/p/original<?php echo $movie->backdrop_path; ?>" alt="<?php echo $movie->title; ?>" />
                </div>
                <?php
                if($i == 6) {
                    break;
                }
                $i++;
            }
        }
    }
    ?>
</div>