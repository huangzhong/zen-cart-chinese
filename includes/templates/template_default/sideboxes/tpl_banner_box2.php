<?php
/**
 * Side Box Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_banner_box2.php 2982 2006-02-07 07:56:41Z birdbrain $
 */
    $content = '';
// if no active banner in the specified banner group then the box will not show
  if ($banner = zen_banner_exists('dynamic', $banner_box_group)) {
    $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
    $content .= '<img src="https://www.paypal.com/en_US/Marketing/i/banner/bnr_accept_120x30_y.gif" border="0" alt="PayPal icon">';
    $content .= '</div>';
  }

?>