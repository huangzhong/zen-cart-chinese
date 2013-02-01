<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: admin_setup.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 管理员帐号设置');
  define('SAVE_ADMIN_SETTINGS', '保存管理设置');//this comes before TEXT_MAIN
  define('TEXT_MAIN', "为了管理Zen Cart商店的设置，您需要一个管理员帐号。请选择管理员名字、密码，以及电子邮件地址，该地址用于重置密码时发送邮件。输入信息并仔细检查后，选择 <em>".SAVE_ADMIN_SETTINGS.'</em> 。');
  define('ADMIN_INFORMATION', '管理员信息');
  define('ADMIN_USERNAME', '管理员用户名');
  define('ADMIN_USERNAME_INSTRUCTION', '输入Zen Cart中文版管理员帐号的用户名。');
  define('ADMIN_PASS', '管理员临时密码');
  define('ADMIN_PASS_INSTRUCTION', '输入网店管理员的<strong>临时</strong>密码，登录时需要修改。<br />密码<strong>必须包含数字和字母，至少7位。</strong>');
  define('ADMIN_PASS_CONFIRM', '确认管理员临时密码');
  define('ADMIN_PASS_CONFIRM_INSTRUCTION', '确认Zen Cart中文版管理员的临时密码。');
  define('ADMIN_EMAIL', '管理员电子邮件');
  define('ADMIN_EMAIL_INSTRUCTION', '输入Zen Cart中文版管理员帐号的电子邮件地址。');
  define('UPGRADE_DETECTION','升级检测');
  define('UPGRADE_INSTRUCTION_TITLE','登录管理页面时检测Zen Cart的升级版本');
  define('UPGRADE_INSTRUCTION_TEXT','该设置将实时检测Zen Cart的服务器，判断是否有新版本。如果有新版本，管理页面将显示升级信息，但不会自动升级。<br />您可以在管理页面下修改该设置，管理页面->商店设置->基本设置->显示是否有新版本');
