<?php
/*** Constant for Library URI ***/
define("LIB_URI", get_stylesheet_directory_uri().'/assets/build/library'); 

/*** Constant for Animations URI ***/
define("ANIM_URI", get_stylesheet_directory_uri().'/assets/build/animations'); 

/*** Constant for directory URI ***/
define("BASE_URI", get_stylesheet_directory_uri());

/*** Constant for directory PATH ***/
define("BASE_PATH", get_stylesheet_directory());

/*** Constant for TMDP API ***/
define("TMDB_API", "5e3a4e3d7a4c2e5e2c82e5019b413e57");

/*** Constant for TMDP URL ***/
define("TMDB_URL", "https://api.themoviedb.org/3/");

/*** Test Functions ***/
function pr($arr) {
    echo "<pre>";
    print_r($arr);
    echo "</pre>";
}

function test() {

    if(get_transient( "test" )) {
        echo 123;
    } else {
        echo 456;
        set_transient( 'test', 'test123', MINUTE_IN_SECONDS );
    }
    
    exit;
}
//add_action("init", "test");
/*** Test Functions End ***/

/*** Theme Setup ***/
function theme_setup() {
    global $genres;

    add_theme_support('html5', array('comment-list', 'comment-form', 'search-form', 'gallery', 'caption', 'script', 'style'));
    add_theme_support('post-thumbnails'); 
    add_theme_support('title-tag');
    add_theme_support('custom-logo');
    add_post_type_support('page', 'excerpt');

    $get_genres = get_genres();

    foreach ($get_genres->genres as $genre) {
        $genres[$genre->id] = $genre->name;
    }

    register_nav_menus(
        array(
            'menu-1' => esc_html__( 'Primary', '' ),
        )
    );
}

add_action('after_setup_theme', 'theme_setup');
/*** Theme Setup End ***/

/*** Custom pages for Movie Detail & Genre Page ***/
add_action( 'init',  function() {
    add_rewrite_rule( 'movies/([a-z0-9-]+)[/]?$', 'index.php?movies=$matches[1]', 'top' );
    add_rewrite_rule( 'genre/([a-z0-9-]+)[/]?$', 'index.php?genre=$matches[1]', 'top' );
} );

add_filter( 'query_vars', function( $query_vars ) {
    $query_vars[] = 'movies';
    $query_vars[] = 'genre';
    return $query_vars;
} );

add_action( 'template_include', function( $template ) {
    if ( get_query_var( 'movies' ) == false || get_query_var( 'movies' ) == '' ) {
        return $template;
    }
 
    return get_template_directory() . '/page-movies.php';
} );

add_action( 'template_include', function( $template ) {
    if ( get_query_var( 'genre' ) == false || get_query_var( 'genre' ) == '' ) {
        return $template;
    }
 
    return get_template_directory() . '/page-genre.php';
} );
/*** Custom pages for Movie Detail & Genre Page End ***/

/*** Load Scripts & Styles ***/
function theme_enqueue_scripts() {
    
    wp_enqueue_style('material-icons', 'https://fonts.googleapis.com/icon?family=Material+Icons', '', '1.0.0');

    wp_enqueue_style('magnific-popup-css', LIB_URI . '/css/magnific-popup.css', '', '1.0.0');
    wp_enqueue_style('slick-style', LIB_URI . '/css/slick.css', '', '1.0.0');

    wp_enqueue_style('theme-style', BASE_URI . '/assets/build/css/index.css', '', filemtime(BASE_PATH . '/assets/build/css/index.css'));

    wp_enqueue_script('magnific-popu-js', LIB_URI . '/js/jquery.magnific-popup.min.js', array('jquery'), '1.0.0', true);
    wp_enqueue_script('slick-js', LIB_URI . '/js/slick.min.js', array('jquery'), '1.0.0', true);

    wp_enqueue_script('waypoints-js', LIB_URI . '/js/jquery.waypoints.min.js', array('jquery'), '1.0.0', true);

    wp_enqueue_script('gsap-js', LIB_URI . '/js/gsap.min.js', array('jquery'), '1.0.0', true);

    wp_enqueue_script('app-script', BASE_URI . '/assets/build/js/index.js', array('jquery'), filemtime(BASE_PATH . '/assets/build/js/index.js'), true);

    wp_enqueue_script('gsap-script', ANIM_URI . '/js/gsap_animations.js', array('jquery'), filemtime(BASE_PATH . '/assets/build/animations/js/gsap_animations.js'), true);

    wp_localize_script( 'app-script', 'adminajax', array(
        'ajax_url' => admin_url( 'admin-ajax.php' ),
        'site_url' => site_url(),
    ));
        
}

add_action('wp_enqueue_scripts', 'theme_enqueue_scripts');
/*** Load Scripts & Styles End ***/

/*** Dynamic SASS Variables ***/
function dynamicCssVariables() {
    $file = BASE_PATH."/assets/src/sass/_dynamic_variables.scss";
    $code = '$base_uri: "'.BASE_URI.'/assets/build/src/img/";';
    
    file_put_contents($file, $code);
}
add_action('wp_head', 'dynamicCssVariables');
/*** Dynamic SASS Variables End ***/

/*** TMDP Endpoints ***/
function get_latest_movies($page=1, $sort, $order, $genre) {

    if(!$sort) {
        $sort="popularity";
    }

    if(!$order) {
        $order="desc";
    }

    $data = [
        "api_key" => TMDB_API,
        "page" => $page,
        "sort_by" => $sort.".".$order,
        "primary_release_date.gte" => "2010-01-01",
        "primary_release_date.lte" => date("Y-m-d"),
        "language" => "en-US",
    ];

    if($genre) {
        $data["with_genres"]=$genre;
    }

    $response = CallAPI('GET', TMDB_URL. "discover/movie/", $data);

    return $response;
}

function get_movie_details($movie_id) {
    $data = [
        "api_key" => TMDB_API,
        "language" => "en-US",
        "append_to_response" => "videos,credits",
    ];

    $response = CallAPI('GET', TMDB_URL. "movie/".$movie_id, $data);

    return $response;
}

function get_now_playing() {

    if( $get_now_playing = get_transient("get_now_playing") ) {
        return $get_now_playing;
    } else {
        $data = [
            "api_key" => TMDB_API,
            "page" => 1,
            "language" => "en-US",
        ];

        $response = CallAPI('GET', TMDB_URL. "movie/now_playing/", $data);

        set_transient( 'get_now_playing', $response, DAY_IN_SECONDS );

        return $response;
    }
        
}

function get_genres() {
    if( $get_genres = get_transient( 'get_genres' ) ) {
        return $get_genres;
    } else {
        $data = [
            "api_key" => TMDB_API,
            "language" => "en-US",
        ];

        $response = CallAPI('GET', TMDB_URL. "genre/movie/list", $data);

        set_transient( 'get_genres', $response, DAY_IN_SECONDS );

        return $response;
    }
}

function get_search() {
    if(isset($_REQUEST["s"])) {
        $data = [
            "api_key" => TMDB_API,
            "query" => $_REQUEST["s"],
        ];

        $response = CallAPI('GET', TMDB_URL. "search/movie/", $data);

        return $response;
    } else {
        wp_redirect( home_url("/") );
        exit;
    }
}

function get_trending() {
    if( $get_trending = get_transient("get_trending") ) {
        return $get_trending;
    } else {
        $data = [
            "api_key" => TMDB_API,
        ];

        $response = CallAPI('GET', TMDB_URL. "trending/movie/week", $data);

        set_transient( 'get_trending', $response, DAY_IN_SECONDS );

        return $response;
    }
}
/*** TMDP Endpoints End ***/

/*** API Call function ***/
function CallAPI($method, $url, $data = false)
{
    $curl = curl_init();

    switch ($method)
    {
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);

            if ($data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_PUT, 1);
            break;
        default:
            if ($data)
                $url = sprintf("%s?%s", $url, http_build_query($data));
    }

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_CUSTOMREQUEST => $method,
        CURLOPT_SSL_VERIFYPEER => false, 
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_VERBOSE => false,
    ));

    // Optional Authentication:

    $response = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);
    $result = json_decode($response);

    if($err){
        return "CURL ERROR: ".$err;
    } else {
        return $result;
    }
}
/*** API Call function End ***/

/*** Load more pagination function ***/
function loadMoreMovies() {
    ob_start();
    if( $_POST["filter_applied"] == "yes" ) {
        for ($i=1; $i <= $_POST["page"]; $i++) { 
            get_template_part( 'template-parts/get_latest_movies', null, [ "page" => $i, "sort" => $_POST["sort"], "order" => $_POST["order"], "slowLoad" => true ] );
        }
    } else {
        get_template_part( 'template-parts/get_latest_movies', null, [ "page" => $_POST["page"], "sort" => $_POST["sort"], "order" => $_POST["order"], "slowLoad" => true ] );
    }
        
    $movie_list = ob_get_clean();

    echo json_encode(array('movie_list' => $movie_list));
    exit;
}

add_action( 'wp_ajax_loadMoreMovies', 'loadMoreMovies' );
add_action( 'wp_ajax_nopriv_loadMoreMovies', 'loadMoreMovies' );
/*** Load more pagination function end ***/

/*** Live Search Function ***/
function search_movies() {
    $latest_movies = get_search();
    ob_start();
    $movie_list = "";
    ?>
    <ul>
    <?php
    if( isset($latest_movies->results) && !empty($latest_movies->results) ) {
        $i=1;
        foreach ($latest_movies->results as $movie) {
            if($movie->poster_path) {
                ?>
                <li>
                    <a href="<?php echo site_url(); ?>/movies/<?php echo $movie->id; ?>" class=" d-flex align-center">
                        <?php
                        $poster_path = "https://image.tmdb.org/t/p/w200".$movie->poster_path;
                        ?>
                        <img src="<?php echo $poster_path; ?>" alt="<?php echo $movie->title;; ?>"> <span><?php echo $movie->title;; ?></span>
                    </a>
                </li>
                <?php
            }

            if($i==5) {
                break;
            }
            $i++;
        }
    } else {
        ?>
        <li>
            <div class=" d-flex align-center no-result">
                <span>No movies found</span>
            </div>
        </li>
        <?php
    }
    ?>
    </ul>
    <?php
    $movie_list = ob_get_clean();
    echo json_encode(array('movie_list' => $movie_list));
    exit;
}

add_action( 'wp_ajax_search_movies', 'search_movies' );
add_action( 'wp_ajax_nopriv_search_movies', 'search_movies' );
/*** Live Search Function End ***/