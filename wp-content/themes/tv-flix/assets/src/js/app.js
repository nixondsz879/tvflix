(function($){
	/**** Backdrop slick slider ****/
	if( $("#backdrop-slider").length ) {
		$("#backdrop-slider").slick({
			"slidesToShow": 1, 
		    "slidesToScroll": 1,
		    "autoplay": true,
		    "arrows": false,
		    "fade": true,
		    "speed": 1000,
		    "autoplaySpeed": 5000
		});
	}
	
	/**** Trailer popup on movide details page ****/
	if( $(".popup-youtube").length ) {
		$('.popup-youtube').magnificPopup({
		  type: 'iframe'
		});
	}

	/**** Loadmore pagination on movie listing page ****/
	if( $("#loadmore").length ) {
		var waypoint = new Waypoint({
		  	element: $("#loadmore"),
		  	handler: function(direction) {
		  		if(direction == "down") {
		  			loadMoreMovies(false);
		  		}
		  	},
		  	offset: function() {
		        return this.context.innerHeight() - this.adapter.outerHeight() + (jQuery(window).height() / 3);
		    }
		});
	}

	/**** Sticky header scroll ****/
	$( window ).scroll(function() {
	  if($(this).scrollTop() > 60) {
	  	$("#stickyHeader").addClass("sticky");
	  } else {
	  	$("#stickyHeader").removeClass("sticky");

	  	if( $(window).width() > 1024 ) {
	  		$("#stickyHeader .material-icons.open-menu").removeClass("inactive");
			$("#stickyHeader .material-icons.close-menu").addClass("inactive");
			$("#stickyHeader .header__menu ul").removeClass("active");
	  	}
	  }
	});

	/**** Movie listing sorters ****/
	$(document).on("click", ".actions ul li input", function(){
		$(".actions ul li").removeClass("active");
		$(this).parent().addClass("active");

		$(".movieItem").addClass("partial");
		loadMoreMovies(true);
	});

	/**** Live search on type ****/
	$(document).on("keyup", 'input[name="s"]', function(e){
		liveSearch($(this));
		e.stopPropagation();
	});

	/**** Live search on focus ****/
	$(document).on("focus", 'input[name="s"]', function(e){
		liveSearch($(this));
		e.stopPropagation();
	});

	/**** Close Live search on blur ****/
	$(document).on("change, blur", 'input[name="s"]', function(){
		$(".results").removeClass("active loading");
	});

	/**** View all cast & crew on moview details page ****/
	$(document).on("click", '.btn-fullCast', function(){
		$(".btn-fullCast").slideUp();

		setTimeout(function(){
			$(".fullCast").slideDown();
		}, 500);
		
	});

	/**** Menu toggle for sticky header & mobile ****/
	$(document).on("click", '.menuToggle', function(){
		
		$(this).find(".material-icons").toggleClass("inactive");
		$("#stickyHeader .header__menu ul").toggleClass("active");
		
	});

	/**** Live search function ****/
	function liveSearch(term) {
		if(term.val()) {
			term.parent().find(".results").html("");
			term.parent().find(".results").addClass("active loading");

			$.ajax({
	            url: adminajax.ajax_url,
	            type: 'POST',
	            data: "action=search_movies&s=" + term.val(),
	            dataType: 'json',
	            success: function (data) {
	            	term.parent().find(".results").removeClass("loading");
	            	term.parent().find(".results").html(data.movie_list);
	            }
	        });
		}
	}
	
	/**** Load more movies ****/
	function loadMoreMovies(filter_applied) {
		$("#loadmore").addClass("active");

		var sort = "";
		var order = "";
		if($('input[name="sort"]:checked').val()) {
			sort = $('input[name="sort"]:checked').val()
			order = $('input[name="sort"]:checked').attr("data-default");

			if($('input[name="sort"]:checked').attr("data-default") == "desc") {
				$('input[name="sort"]:checked').attr("data-default", "asc");
			} else {
				$('input[name="sort"]:checked').attr("data-default", "desc");
			}
		}

		var page = $("#loadmore").attr("data-page");

		var applied = "no";
		if(filter_applied) {
			applied = "yes";
		}

		$.ajax({
            url: adminajax.ajax_url,
            type: 'POST',
            data: "action=loadMoreMovies&page=" + page +"&sort=" + sort +"&order=" + order +"&filter_applied=" + applied,
            dataType: 'json',
            success: function (data) {
            	if(!filter_applied) {
            		$(".moviesListView .movieList").append(data.movie_list);
            		$("#loadmore").attr("data-page", parseInt(page) + 1);
            	} else {
            		$(".moviesListView .movieList").html(data.movie_list);
            	}
            	
            	$("#loadmore").removeClass("active");
            	$(".movieItem").removeClass("slowLoad partial");
                Waypoint.refreshAll();
            }
        });
	}

	//gsap.to(".header__logo", {duration: 1, opacity: 0.3});

})(jQuery);