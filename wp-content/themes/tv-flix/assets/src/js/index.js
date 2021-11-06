// JS files
import './app.js';

// Styles
import '../sass/theme-styles.scss';

// Images
import '../img/tv-logo.png';

import '../img/footer-bg.png';

import '../img/loader.svg';

import '../img/film-poster-placeholder.png';

function importAll(r) {
  let images = {};
  r.keys().map((item, index) => { images[item.replace('./', '')] = r(item); });
  return images;
}

importAll(require.context('../img/backdrops', false, /\.(png|jpe?g|svg)$/));

importAll(require.context('../img/sample', false, /\.(png|jpe?g|svg)$/));

importAll(require.context('../img/categories', false, /\.(png|jpe?g|svg)$/));