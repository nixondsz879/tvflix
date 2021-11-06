/******/ (function() { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/js/app.js":
/*!***********************!*\
  !*** ./src/js/app.js ***!
  \***********************/
/***/ (function() {

(function ($) {
  /**** Backdrop slick slider ****/
  if ($("#backdrop-slider").length) {
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


  if ($(".popup-youtube").length) {
    $('.popup-youtube').magnificPopup({
      type: 'iframe'
    });
  }
  /**** Loadmore pagination on movie listing page ****/


  if ($("#loadmore").length) {
    var waypoint = new Waypoint({
      element: $("#loadmore"),
      handler: function handler(direction) {
        if (direction == "down") {
          loadMoreMovies(false);
        }
      },
      offset: function offset() {
        return this.context.innerHeight() - this.adapter.outerHeight() + jQuery(window).height() / 3;
      }
    });
  }
  /**** Sticky header scroll ****/


  $(window).scroll(function () {
    if ($(this).scrollTop() > 60) {
      $("#stickyHeader").addClass("sticky");
    } else {
      $("#stickyHeader").removeClass("sticky");

      if ($(window).width() > 1024) {
        $("#stickyHeader .material-icons.open-menu").removeClass("inactive");
        $("#stickyHeader .material-icons.close-menu").addClass("inactive");
        $("#stickyHeader .header__menu ul").removeClass("active");
      }
    }
  });
  /**** Movie listing sorters ****/

  $(document).on("click", ".actions ul li input", function () {
    $(".actions ul li").removeClass("active");
    $(this).parent().addClass("active");
    $(".movieItem").addClass("partial");
    loadMoreMovies(true);
  });
  /**** Live search on type ****/

  $(document).on("keyup", 'input[name="s"]', function (e) {
    liveSearch($(this));
    e.stopPropagation();
  });
  /**** Live search on focus ****/

  $(document).on("focus", 'input[name="s"]', function (e) {
    liveSearch($(this));
    e.stopPropagation();
  });
  /**** Close Live search on blur ****/

  $(document).on("change, blur", 'input[name="s"]', function () {
    $(".results").removeClass("active loading");
  });
  /**** View all cast & crew on moview details page ****/

  $(document).on("click", '.btn-fullCast', function () {
    $(".btn-fullCast").slideUp();
    setTimeout(function () {
      $(".fullCast").slideDown();
    }, 500);
  });
  /**** Menu toggle for sticky header & mobile ****/

  $(document).on("click", '.menuToggle', function () {
    $(this).find(".material-icons").toggleClass("inactive");
    $("#stickyHeader .header__menu ul").toggleClass("active");
  });
  /**** Live search function ****/

  function liveSearch(term) {
    if (term.val()) {
      term.parent().find(".results").html("");
      term.parent().find(".results").addClass("active loading");
      $.ajax({
        url: adminajax.ajax_url,
        type: 'POST',
        data: "action=search_movies&s=" + term.val(),
        dataType: 'json',
        success: function success(data) {
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

    if ($('input[name="sort"]:checked').val()) {
      sort = $('input[name="sort"]:checked').val();
      order = $('input[name="sort"]:checked').attr("data-default");

      if ($('input[name="sort"]:checked').attr("data-default") == "desc") {
        $('input[name="sort"]:checked').attr("data-default", "asc");
      } else {
        $('input[name="sort"]:checked').attr("data-default", "desc");
      }
    }

    var page = $("#loadmore").attr("data-page");
    var applied = "no";

    if (filter_applied) {
      applied = "yes";
    }

    $.ajax({
      url: adminajax.ajax_url,
      type: 'POST',
      data: "action=loadMoreMovies&page=" + page + "&sort=" + sort + "&order=" + order + "&filter_applied=" + applied,
      dataType: 'json',
      success: function success(data) {
        if (!filter_applied) {
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
  } //gsap.to(".header__logo", {duration: 1, opacity: 0.3});

})(jQuery);

/***/ }),

/***/ "./src/img/backdrops/backdrop-1.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-1.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-1.jpg");

/***/ }),

/***/ "./src/img/backdrops/backdrop-2.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-2.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-2.jpg");

/***/ }),

/***/ "./src/img/backdrops/backdrop-3.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-3.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-3.jpg");

/***/ }),

/***/ "./src/img/backdrops/backdrop-4.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-4.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-4.jpg");

/***/ }),

/***/ "./src/img/backdrops/backdrop-5.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-5.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-5.jpg");

/***/ }),

/***/ "./src/img/backdrops/backdrop-6.jpg":
/*!******************************************!*\
  !*** ./src/img/backdrops/backdrop-6.jpg ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/backdrops/backdrop-6.jpg");

/***/ }),

/***/ "./src/img/categories/Action.jpg":
/*!***************************************!*\
  !*** ./src/img/categories/Action.jpg ***!
  \***************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/categories/Action.jpg");

/***/ }),

/***/ "./src/img/categories/Comedy.jpg":
/*!***************************************!*\
  !*** ./src/img/categories/Comedy.jpg ***!
  \***************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/categories/Comedy.jpg");

/***/ }),

/***/ "./src/img/categories/Drama.jpg":
/*!**************************************!*\
  !*** ./src/img/categories/Drama.jpg ***!
  \**************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/categories/Drama.jpg");

/***/ }),

/***/ "./src/img/categories/Horror.jpg":
/*!***************************************!*\
  !*** ./src/img/categories/Horror.jpg ***!
  \***************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/categories/Horror.jpg");

/***/ }),

/***/ "./src/img/categories/Romance.jpg":
/*!****************************************!*\
  !*** ./src/img/categories/Romance.jpg ***!
  \****************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/categories/Romance.jpg");

/***/ }),

/***/ "./src/img/film-poster-placeholder.png":
/*!*********************************************!*\
  !*** ./src/img/film-poster-placeholder.png ***!
  \*********************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/film-poster-placeholder.png");

/***/ }),

/***/ "./src/img/footer-bg.png":
/*!*******************************!*\
  !*** ./src/img/footer-bg.png ***!
  \*******************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/footer-bg.png");

/***/ }),

/***/ "./src/img/loader.svg":
/*!****************************!*\
  !*** ./src/img/loader.svg ***!
  \****************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/loader.svg");

/***/ }),

/***/ "./src/img/sample/sample-1.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-1.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-1.jpg");

/***/ }),

/***/ "./src/img/sample/sample-10.jpg":
/*!**************************************!*\
  !*** ./src/img/sample/sample-10.jpg ***!
  \**************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-10.jpg");

/***/ }),

/***/ "./src/img/sample/sample-2.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-2.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-2.jpg");

/***/ }),

/***/ "./src/img/sample/sample-3.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-3.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-3.jpg");

/***/ }),

/***/ "./src/img/sample/sample-4.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-4.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-4.jpg");

/***/ }),

/***/ "./src/img/sample/sample-5.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-5.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-5.jpg");

/***/ }),

/***/ "./src/img/sample/sample-6.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-6.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-6.jpg");

/***/ }),

/***/ "./src/img/sample/sample-7.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-7.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-7.jpg");

/***/ }),

/***/ "./src/img/sample/sample-8.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-8.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-8.jpg");

/***/ }),

/***/ "./src/img/sample/sample-9.jpg":
/*!*************************************!*\
  !*** ./src/img/sample/sample-9.jpg ***!
  \*************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/sample/sample-9.jpg");

/***/ }),

/***/ "./src/img/tv-logo.png":
/*!*****************************!*\
  !*** ./src/img/tv-logo.png ***!
  \*****************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("../../src/img/tv-logo.png");

/***/ }),

/***/ "./src/sass/theme-styles.scss":
/*!************************************!*\
  !*** ./src/sass/theme-styles.scss ***!
  \************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./src/img/backdrops sync \\.(png|jpe?g|svg)$":
/*!*****************************************************************!*\
  !*** ./src/img/backdrops/ sync nonrecursive \.(png|jpe?g|svg)$ ***!
  \*****************************************************************/
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

var map = {
	"./backdrop-1.jpg": "./src/img/backdrops/backdrop-1.jpg",
	"./backdrop-2.jpg": "./src/img/backdrops/backdrop-2.jpg",
	"./backdrop-3.jpg": "./src/img/backdrops/backdrop-3.jpg",
	"./backdrop-4.jpg": "./src/img/backdrops/backdrop-4.jpg",
	"./backdrop-5.jpg": "./src/img/backdrops/backdrop-5.jpg",
	"./backdrop-6.jpg": "./src/img/backdrops/backdrop-6.jpg"
};


function webpackContext(req) {
	var id = webpackContextResolve(req);
	return __webpack_require__(id);
}
function webpackContextResolve(req) {
	if(!__webpack_require__.o(map, req)) {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	}
	return map[req];
}
webpackContext.keys = function webpackContextKeys() {
	return Object.keys(map);
};
webpackContext.resolve = webpackContextResolve;
module.exports = webpackContext;
webpackContext.id = "./src/img/backdrops sync \\.(png|jpe?g|svg)$";

/***/ }),

/***/ "./src/img/categories sync \\.(png|jpe?g|svg)$":
/*!******************************************************************!*\
  !*** ./src/img/categories/ sync nonrecursive \.(png|jpe?g|svg)$ ***!
  \******************************************************************/
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

var map = {
	"./Action.jpg": "./src/img/categories/Action.jpg",
	"./Comedy.jpg": "./src/img/categories/Comedy.jpg",
	"./Drama.jpg": "./src/img/categories/Drama.jpg",
	"./Horror.jpg": "./src/img/categories/Horror.jpg",
	"./Romance.jpg": "./src/img/categories/Romance.jpg"
};


function webpackContext(req) {
	var id = webpackContextResolve(req);
	return __webpack_require__(id);
}
function webpackContextResolve(req) {
	if(!__webpack_require__.o(map, req)) {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	}
	return map[req];
}
webpackContext.keys = function webpackContextKeys() {
	return Object.keys(map);
};
webpackContext.resolve = webpackContextResolve;
module.exports = webpackContext;
webpackContext.id = "./src/img/categories sync \\.(png|jpe?g|svg)$";

/***/ }),

/***/ "./src/img/sample sync \\.(png|jpe?g|svg)$":
/*!**************************************************************!*\
  !*** ./src/img/sample/ sync nonrecursive \.(png|jpe?g|svg)$ ***!
  \**************************************************************/
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {

var map = {
	"./sample-1.jpg": "./src/img/sample/sample-1.jpg",
	"./sample-10.jpg": "./src/img/sample/sample-10.jpg",
	"./sample-2.jpg": "./src/img/sample/sample-2.jpg",
	"./sample-3.jpg": "./src/img/sample/sample-3.jpg",
	"./sample-4.jpg": "./src/img/sample/sample-4.jpg",
	"./sample-5.jpg": "./src/img/sample/sample-5.jpg",
	"./sample-6.jpg": "./src/img/sample/sample-6.jpg",
	"./sample-7.jpg": "./src/img/sample/sample-7.jpg",
	"./sample-8.jpg": "./src/img/sample/sample-8.jpg",
	"./sample-9.jpg": "./src/img/sample/sample-9.jpg"
};


function webpackContext(req) {
	var id = webpackContextResolve(req);
	return __webpack_require__(id);
}
function webpackContextResolve(req) {
	if(!__webpack_require__.o(map, req)) {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	}
	return map[req];
}
webpackContext.keys = function webpackContextKeys() {
	return Object.keys(map);
};
webpackContext.resolve = webpackContextResolve;
module.exports = webpackContext;
webpackContext.id = "./src/img/sample sync \\.(png|jpe?g|svg)$";

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	!function() {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = function(module) {
/******/ 			var getter = module && module.__esModule ?
/******/ 				function() { return module['default']; } :
/******/ 				function() { return module; };
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	!function() {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = function(exports, definition) {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	!function() {
/******/ 		__webpack_require__.o = function(obj, prop) { return Object.prototype.hasOwnProperty.call(obj, prop); }
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	!function() {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = function(exports) {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	}();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be in strict mode.
!function() {
"use strict";
/*!*************************!*\
  !*** ./src/js/index.js ***!
  \*************************/
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _app_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./app.js */ "./src/js/app.js");
/* harmony import */ var _app_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_app_js__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _sass_theme_styles_scss__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../sass/theme-styles.scss */ "./src/sass/theme-styles.scss");
/* harmony import */ var _img_tv_logo_png__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../img/tv-logo.png */ "./src/img/tv-logo.png");
/* harmony import */ var _img_footer_bg_png__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../img/footer-bg.png */ "./src/img/footer-bg.png");
/* harmony import */ var _img_loader_svg__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../img/loader.svg */ "./src/img/loader.svg");
/* harmony import */ var _img_film_poster_placeholder_png__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../img/film-poster-placeholder.png */ "./src/img/film-poster-placeholder.png");
// JS files
 // Styles

 // Images






function importAll(r) {
  var images = {};
  r.keys().map(function (item, index) {
    images[item.replace('./', '')] = r(item);
  });
  return images;
}

importAll(__webpack_require__("./src/img/backdrops sync \\.(png|jpe?g|svg)$"));
importAll(__webpack_require__("./src/img/sample sync \\.(png|jpe?g|svg)$"));
importAll(__webpack_require__("./src/img/categories sync \\.(png|jpe?g|svg)$"));
}();
/******/ })()
;
//# sourceMappingURL=index.js.map