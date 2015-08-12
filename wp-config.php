<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'x2fair_portfolio');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+#`U+p-qSq3hlquisDQ<M$D4cY-ti+]4^`?v-9!dW+T1F{0%K*h&%[-)?>sQ QQD');
define('SECURE_AUTH_KEY',  '^m$UbUYH?/9b4(!-YUn>Jw2l5q4g+iNiTZI/mnj7*m!kt8P/+@d5oLR}|Nj5)WmY');
define('LOGGED_IN_KEY',    '|Q*M-WQu]U>gISRqX_C]r!m-~Eb[omXI<`}Fg8L8?e-]eTQYz9L;NqbZ|3D%Gb?v');
define('NONCE_KEY',        '$s/QtB}!FhQPD$(iP16RaLu3`iX;aBb,AUf+_E[I&htkTg,;Pb$[Gmw2S_56r-lf');
define('AUTH_SALT',        '|SjI<r8zZ$;CTm*OwH2VC1EB-H-#2Q-N|bIkd-9L-jVBx4]z9nXSm]?KyhcU<Ik_');
define('SECURE_AUTH_SALT', 'I0?xv}6yi:_)NLd_L;[s1-jc9l5Yl-Gn>$Rn`T!gnizlY!pL Z1kD+-X`6?1h8B,');
define('LOGGED_IN_SALT',   '{?.&Y{1{,N X%I+Sp05;>WN)h<bxQm:mE4LNO&_G/,R&{y<wk:IGG_*cNhYCkf>[');
define('NONCE_SALT',       'P+jswX@bgV;01J! mQI)0D8YSLrwYPVcR9/L+gkkdf7p^*vyV9*cAw]@lh}P%LrO');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
