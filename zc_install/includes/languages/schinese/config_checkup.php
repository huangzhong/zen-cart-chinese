<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: config_checkup.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_MAIN', '<h2>请修复配置文件</h2><p>您的configure.php文件不正确。</p>');
  define('TEXT_EXPLANATION2', '<p>在您输入资料后，系统将资料写入服务器的configure.php文件中。您看到本页面说明写入不成功，请手工修改配置文件。</p>');
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 检查配置');
  define('TEXT_CONFIG_FILES', '配置 - configure.php文件');
  define('TEXT_CONFIG_INSTRUCTIONS', '可用剪贴功能复制一下内容。点击方框，复制到剪贴板，用文本编辑器打开相应的configure.php文件，粘贴到文件，保存，上传文件。<br /><br />结束后，点击下面的"重新检查文件"按钮核对。');

  define('TEXT_CATALOG_CONFIGFILE', '/includes/configure.php');
  define('TEXT_ADMIN_CONFIGFILE', '/admin/includes/configure.php');

  define('CONTINUE_BUTTON', '跳过并继续');
  define('RECHECK', '重新检查文件');
