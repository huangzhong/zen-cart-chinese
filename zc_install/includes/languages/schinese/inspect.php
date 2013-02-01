<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: inspect.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 系统检测');
  define('INSTALL_BUTTON', ' 安装 '); // this comes before TEXT_MAIN
  define('UPGRADE_BUTTON', '升级配置文件'); // this comes before TEXT_MAIN
  define('DB_UPGRADE_BUTTON', '数据库升级'); // this comes before TEXT_MAIN
//Button meanings: (to be made into help-text for future version):
// "Install" = make new configure.php files, regardless of existing contents.  Load new database by dropping old tables.
// "Upgrade" = read old configure.php files, and write new ones using new structure. Upgrade database, instead of wiping and new install
// "Database Upgrade" = don't write the configure.php files -- simply jump to the database-upgrade page. Only displayed if detected database version is new enough to not require configure.php file updates.

  define('TITLE_DOCUMENTATION', '文档');
  define('TEXT_DOCUMENTATION', '<h3>您读了安装说明吗?</h3><a href="%s" target="_blank">安装说明</a>最好要看看。<br />其中有列出需要设置权限的目录/文件以及其它安装要求，还有安装完成以后的操作。');

  define('TEXT_MAIN', '请花些时间检查您的服务器是否支持安装Zen Cart中文版所需要的功能。&nbsp;请在继续安装前消除错误或警告信息，&nbsp;然后点击<em>'.INSTALL_BUTTON.'&nbsp;</em>继续。');
  define('SYSTEM_INSPECTION_RESULTS', '系统检测结果');
  define('OTHER_INFORMATION', '其它系统信息 (仅供参考)');
  define('OTHER_INFORMATION_DESCRIPTION', '以下信息并不说明系统有任何问题或配置错误，仅用于显示目的。');

  define('NOT_EXIST','没找到');
  define('WRITABLE','可写');
  define('UNWRITABLE',"<span class='errors'>不可写</span>");
  define('UNKNOWN','未知');
  define('ON','ON');
  define('OFF','OFF');
  define('OK','OK');

  define('UPGRADE_DETECTION','可以升级');
  define('LABEL_PREVIOUS_INSTALL_FOUND','发现旧版Zen Cart');
  define('LABEL_PREVIOUS_VERSION_NUMBER','数据库版本为 Zen Cart v%s');
  define('LABEL_PREVIOUS_VERSION_NUMBER_UNKNOWN','<em>无法检测您的数据库版本, 通常是因为表前缀不对, 或是其它的数据库设置不对。 <br /><br />注意: 只有您确认configure.php文件的设置是正确的，才可以使用 [升级] 选项。</em>');
  define('LABEL_UPGRADE_VS_INSTALL', '安装还是升级?');
  define('LABEL_INSTALL', '开始安装?  (将删除已有数据，不是升级模式!!!)');

  define('IMAGE_STOP_BEFORE_UPGRADING', '<div class="center"><img src="includes/templates/template_default/images/stop.gif" border="0" alt="警告: 请正确选择下面的选项" /></div>');

  define('LABEL_ACTION_SELECTION_INSTRUCTIONS','<p class="errors extralarge"><span class="center">说明:</span><br />如果要升级，请选择"<span style="text-decoration: underline;">数据库升级</span>"以保存数据。</p><p class="extralarge">如果您选择"安装"，将删除数据库中已有的内容。</p>');

  define('DISPLAY_PHP_INFO','PHP信息链接: ');
  define('VIEW_PHP_INFO_LINK_TEXT','查看服务器的PHPINFO');
  define('LABEL_WEBSERVER','服务器');
  define('LABEL_MYSQL_AVAILABLE','MySQL支持');
  define('LABEL_MYSQL_VER','MySQL版本');
  define('LABEL_DB_PRIVS','数据库权限');
  define('LABEL_POSTGRES_AVAILABLE','PostgreSQL支持');
  define('LABEL_PHP_VER','PHP版本');
  define('LABEL_PHP_OS','PHP O/S');
  define('LABEL_REGISTER_GLOBALS','Register Globals');
  define('LABEL_SET_TIME_LIMIT','PHP页面最大执行时间');
  define('LABEL_DISABLED_FUNCTIONS','关闭PHP功能');
  define('LABEL_SAFE_MODE','PHP Safe Mode');
  define('LABEL_CURRENT_CACHE_PATH','当前SQL缓存目录');
  define('LABEL_SUGGESTED_CACHE_PATH','建议SQL缓存目录');
  define('LABEL_HTTP_HOST','HTTP主机');
  define('LABEL_PATH_TRANLSATED','转换路径');
  define('LABEL_REALPATH', '真实路径');
  define('LABEL_PHP_API_MODE','PHP API模式');
  define('LABEL_PHP_MODULES','PHP 活动模块');
  define('LABEL_PHP_EXT_SESSIONS','PHP Sessions 支持');
  define('LABEL_PHP_SESSION_AUTOSTART','PHP Session.AutoStart');
  define('LABEL_PHP_EXT_SAVE_PATH','PHP Session.Save_Path');
  define('LABEL_PHP_EXT_CURL','PHP cURL 支持');
  define('LABEL_CURL_NONSSL','CURL 非SSL功能');
  define('LABEL_CURL_SSL','CURL SSL功能');
  define('LABEL_CURL_NONSSL_PROXY','CURL 通过代理的非SSL功能');
  define('LABEL_CURL_SSL_PROXY','CURL 通过代理的SSL功能');
  define('LABEL_PHP_MAG_QT_RUN','PHP magic_quotes_runtime 设置');
  define('LABEL_PHP_MAG_QT_SYBASE','PHP magic_quotes_sybase 设置');
  define('LABEL_PHP_EXT_GD','PHP GD 支持');
  define('LABEL_GD_VER','GD Version');
  define('LABEL_PHP_EXT_OPENSSL','PHP OpenSSL 支持');
  define('LABEL_PHP_UPLOAD_STATUS','PHP 上传支持');
  define('LABEL_PHP_EXT_PFPRO','PHP Payflow Pro 支持');
  define('LABEL_PHP_EXT_ZLIB','PHP ZLIB 压缩支持');
  define('LABEL_PHP_SESSION_TRANS_SID','PHP session.use_trans_sid');
  define('LABEL_DISK_FREE_SPACE','服务器空闲磁盘空间');
  define('LABEL_XML_SUPPORT','PHP XML 支持');
  define('LABEL_HTACCESS_SUPPORT','Apache .htaccess 支持');
  define('LABEL_COULD_NOT_TEST_HTACCESS','无法测试 - 不支持 CURL');
  define('LABEL_OPEN_BASEDIR','PHP open_basedir 限制');
  define('LABEL_UPLOAD_TMP_DIR','PHP 上传临时目录');
  define('LABEL_SENDMAIL_FROM','PHP sendmail 发件人');
  define('LABEL_SENDMAIL_PATH','PHP sendmail 路径');
  define('LABEL_SMTP_MAIL','PHP SMTP 目标');
  define('LABEL_GZIP', 'PHP 输出缓存 (gzip)');
  define('LABEL_INCLUDE_PATH','PHP include_path');

  define('LABEL_CRITICAL','重要项目');
  define('LABEL_RECOMMENDED','建议项目');
  define('LABEL_OPTIONAL','可选项目');

  define('LABEL_EXPLAIN','&nbsp;说明');
  define('LABEL_FOLDER_PERMISSIONS','文件和目录权限');
  define('LABEL_WRITABLE_FILE_INFO', '为了让安装程序保存您在以下提供的安装信息，下面显示的configure.php文件必须"可写"。');
  define('LABEL_WRITABLE_FOLDER_INFO','要能正常使用Zen Cart中文版管理页面，
需要将几个文件/目录设置为 "可写".  下面是需要设置为 "可写" 的目录清单，
以及建议的 CHMOD 设置。在继续安装前，请做修改。
在浏览器中刷新本页面以重新检测设置。<br /><br />某些主机不允许您设置 CHMOD 777, 要用666。先试最高的值，不行的话，再逐步降低该值。');
