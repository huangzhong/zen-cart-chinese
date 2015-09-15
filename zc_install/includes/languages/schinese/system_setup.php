<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2014 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: system_setup.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('SAVE_SYSTEM_SETTINGS', '保存系统设置'); //this comes before TEXT_MAIN
  define('TEXT_MAIN', "现在设置Zen Cart中文版的运行环境。 请仔细检查设置，如有必要，按您的目录结构做修改。然后点击 <em>".SAVE_SYSTEM_SETTINGS.'</em> 以继续。');
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 系统设置');
  define('SERVER_SETTINGS', '服务器/网站的设置');
  define('PHYSICAL_PATH', 'Zen Cart中文版的物理路径');
  define('PHYSICAL_PATH_INSTRUCTION', 'Zen Cart中文版目录的物理路径.<br />后面不要跟除号。');
  define('VIRTUAL_HTTP_PATH', 'Zen Cart中文版商店的网址');
  define('VIRTUAL_HTTP_PATH_INSTRUCTION', 'Zen Cart中文版商店的网址。<br />后面不要跟除号。');
  define('VIRTUAL_HTTPS_PATH', 'HTTPS服务器的网址');
  define('VIRTUAL_HTTPS_PATH_INSTRUCTION', '安全Zen Cart中文版目录的网址。<br />后面不要跟除号。');
  define('VIRTUAL_HTTPS_SERVER', 'HTTPS域');
  define('VIRTUAL_HTTPS_SERVER_INSTRUCTION', '安全Zen Cart中文版目录的服务器。<br />后面不要跟除号。');
  define('TEXT_SSL_INTRO', '<strong>您有SSL证书吗? 如果有，请在下面输入详细资料。</strong>如果是全新安装，下面给出的值只是 *预设值*。请联系您的主机商获取相关资料。');
  define('TEXT_SSL_WARNING', '如果您的SSL证书已经可以使用，请在下面选择SSL设置。<br /><strong>如果您的网站没有SSL，不要在这里打开SSL。</strong>如果您打开了SSL，但是SSL地址不正确，将无法登录管理页面或商店。您以后可以通过修改设置文件configure.php来打开SSL。');
  define('SSL_OPTIONS', 'SSL详情');
  define('ENABLE_SSL', '打开SSL');
  define('ENABLE_SSL_INSTRUCTION', '您希望在客户页面使用SSL吗？<br />将该项设置为 [否] ，除非您确认SSL正常工作。');
  define('ENABLE_SSL_ADMIN', 'Enable SSL in Admin Area');
  define('ENABLE_SSL_ADMIN_INSTRUCTION', '您希望管理页面使用SSL吗？<br />
将该项设置为 [否] ，除非您确认SSL正常工作。');
  define('REDISCOVER', '重新检测主机缺省值');

