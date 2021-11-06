<form role="search" method="get" class="search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
    <div class="formGroup d-flex">
        <div class="searchBar">
            <input type="search" name="s" id="sarchTerm" placeholder="Search your favourite movie or series" autocomplete="off">
            <button type="submit" class="submit" (click)="submitForm()">
                <span class="material-icons">search</span>
            </button>
            <div class="results">
                <!-- <ul>
                    <li>
                        <a href="<?php echo site_url(); ?>" class=" d-flex align-center">
                            <img src="<?php echo BASE_URI; ?>/assets/build/src/img/sample/sample-1.jpg" alt="TV Flix" /> <span>Title</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo site_url(); ?>" class=" d-flex align-center">
                            <img src="<?php echo BASE_URI; ?>/assets/build/src/img/sample/sample-2.jpg" alt="TV Flix" /> <span>Title</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo site_url(); ?>" class=" d-flex align-center">
                            <img src="<?php echo BASE_URI; ?>/assets/build/src/img/sample/sample-3.jpg" alt="TV Flix" /> <span>Title</span>
                        </a>
                    </li>
                </ul> -->
            </div>
        </div>
    </div>
</form>
