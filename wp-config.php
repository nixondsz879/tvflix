<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'tv_flix' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost:3307' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '8}$A1.MUFI|I>T#VbBuGz4vsfV!]~uJ%]9R&I;]zZE(kS_a,RHkRvp,;$~lXy^*s' );
define( 'SECURE_AUTH_KEY',  ';Ap2~WL9NIr^^H]YzMm{:o~v%@/(mb5MqA#jFb*kfy0rB{IN*{ADT-K_Fa$CVJ!j' );
define( 'LOGGED_IN_KEY',    'D6,Scv-PLT{l1^MZ4EWd9ne(<JG1jb6;N0|l=MC-Vyghw8sk^~/ML1i?Q8*#xfl{' );
define( 'NONCE_KEY',        ',2U0s$8bTlq/ku.e?cD*ZxZZeI(3Of%k$[k-,,RRj$GKcN~m3Q~!v5XnLk`W,jO^' );
define( 'AUTH_SALT',        'YGaT<?].3/XddV#[cuJ&+c?{aZBbqoN6Sw;{_U>(w/{;aVlPNt|k-vnw?jCNc{6&' );
define( 'SECURE_AUTH_SALT', '.A:3q(l_9`,QF<X3P()Z7[/4N,td4:v;-*zC)b>hO(TYoqL7y^~`h2uNm.Pa^i#8' );
define( 'LOGGED_IN_SALT',   'F-Lxzut>K6xh1(lrP=/8@AWsa6C/h8raJ|Q1{;/Pkml44@HNm&D~>+#.%!:IOH:w' );
define( 'NONCE_SALT',       'TJ#TBhckB6F}!K?;evcUF5s h~@Ln|a5Z qwwT%Xw7/##:[>l-;)Pz*oj&/S@UmN' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
