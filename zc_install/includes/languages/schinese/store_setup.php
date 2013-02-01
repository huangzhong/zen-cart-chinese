<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: store_setup.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('SAVE_STORE_SETTINGS', '保存商店设置');//this comes before TEXT_MAIN
  define('TEXT_MAIN', "下面的Zen Cart中文版安装工具，将帮助您设定商店的基本设置。您以后也可以在管理页面下修改所有这些设置。仔细输入每个栏目，然后点击 <em>".SAVE_STORE_SETTINGS.'</em> 以继续。');
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 商店设置');
  define('STORE_INFORMATION', '商店信息');
  define('STORE_NAME', '商店名称');
  define('STORE_NAME_INSTRUCTION', '您的Zen Cart商店的名称?');
  define('STORE_OWNER', '店主');
  define('STORE_OWNER_INSTRUCTION', '谁是Zen Cart商店的店主?');
  define('STORE_OWNER_EMAIL', '店主的电子邮件');
  define('STORE_OWNER_EMAIL_INSTRUCTION', '您的Zen Cart商店店主的电子邮件地址是?');
  define('STORE_COUNTRY', '商店所在国家或地区');
  define('STORE_COUNTRY_INSTRUCTION', '您的Zen Cart商店所在的国家或地区?');
  define('STORE_ZONE', '商店所在地区');
  define('STORE_ZONE_INSTRUCTION', '您的Zen Cart商店所在地区?');
  define('STORE_ADDRESS', '商店地址');
  define('STORE_ADDRESS_INSTRUCTION', '您的Zen Cart商店的地址? 该地址将用于打印文件及在线商店的显示。');
  define('STORE_DEFAULT_LANGUAGE', '缺省语言');
  define('STORE_DEFAULT_LANGUAGE_INSTRUCTION', '选择缺省语言?');
  define('STORE_DEFAULT_CURRENCY', '缺省货币');
  define('STORE_DEFAULT_CURRENCY_INSTRUCTION', '选择缺省货币?');
  define('DEMO_INFORMATION', '演示信息');
  define('DEMO_INSTALL', '商店演示');
  define('DEMO_INSTALL_INSTRUCTION', '您想安装Zen Cart中文版的演示商品及分类吗?');
