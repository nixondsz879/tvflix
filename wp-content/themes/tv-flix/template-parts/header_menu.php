<?php
global $genres, $post;
$categories = [
    "Action",
    "Comedy",
    "Drama",
    "Horror",
    "Romance",
];

if (has_nav_menu('menu-1')) {
    $locations = get_nav_menu_locations();
    $menu = get_term( $locations['menu-1'], 'nav_menu' );
    $menu_items = wp_get_nav_menu_items($menu->term_id);
    ?>
    <ul class="d-flex align-center">
        <?php
        $i=1;
        foreach ($menu_items as $key => $menu) {
            $active = "";
            if($menu->object_id == $post->ID) {
                $active = "active";
            }
            ?>
            <li> 
                <a class="inline-nav<?php echo $i; ?> <?php echo $active; ?>" href="<?php echo $menu->url; ?>"><?php echo $menu->title; ?></a> 
            </li>
            <?php
            $i++;
        }

        $current_genre = get_query_var("genre");

        foreach($genres as $genre_id => $genre) {
            if( in_array($genre, $categories) ) {
                $active = "";
                if($current_genre == $genre_id) {
                    $active = "active";
                }
                ?>
                <li> 
                    <a class="inline-nav<?php echo $i; ?> <?php echo $active; ?>" href="<?php echo site_url().'/genre/'.$genre_id; ?>"><?php echo $genre; ?></a> 
                </li>
                <?php
                $i++;
            }
        }
        ?>
    </ul>
    <?php
}
?> 