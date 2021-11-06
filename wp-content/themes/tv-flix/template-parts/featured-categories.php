<section class="categories">
    <?php
    global $genres;

    $categories = [
        "Action",
        "Comedy",
        "Drama",
        "Horror",
        "Romance",
    ];

    foreach($genres as $genre_id => $genre) {
        if( in_array($genre, $categories) ) {
            ?>
            <a href="<?php echo site_url().'/genre/'.$genre_id; ?>" class="category <?php echo strtolower($genre); ?>">
                <img src="<?php echo BASE_URI; ?>/assets/build/src/img/categories/<?php echo $genre; ?>.jpg" alt="">
                <h3>
                    <?php echo $genre; ?>
                </h3>
            </a>
            <?php
        }
    }
    ?>
        
</section>