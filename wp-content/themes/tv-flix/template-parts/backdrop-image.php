<?php if(!isset($args["backdrop_path"]) || !$args["backdrop_path"]) {
    return;
} ?>
<div class="searchArea">
    <div class="imgBackdrop">
        <img src="https://image.tmdb.org/t/p/original<?php echo $args["backdrop_path"]; ?>" alt=""  >
    </div>
    <div class="overlay"></div>
</div>