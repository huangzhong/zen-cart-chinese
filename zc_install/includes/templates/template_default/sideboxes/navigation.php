<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: navigation.php 17018 2010-07-27 07:25:41Z drbyte $
 */

?>
<ul>
  <li id="welcome">欢迎</li>
  <li id="licenseaccept">软件许可</li>
  <li id="inspection">系统检测</li>
  <li id="database">数据库安装</li>
<?php if ((isset($is_upgradable) && $is_upgradable) || (isset($is_upgrade) && $is_upgrade)) { ?>
  <li id="databaseupg">数据库升级</li>
<?php } ?>
  <li id="system">系统安装</li>
<?php if (isset($flag_check_config_keys) && $flag_check_config_keys) { ?>
  <li id="cfgcheck">检查配置文件</li>
<?php } ?>
  <li id="store">商店设置</li>
  <li id="admin">管理设置</li>
  <li id="finish">完成</li>
</ul>