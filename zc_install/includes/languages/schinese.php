<?php
/**
 * Main Chinese language file for installer
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2014 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Thu Apr 24 13:48:29 2014 -0400 Modified in v1.5.4 $
 */
/**
 * defining language components for the page
 */
  define('YES', '是');
  define('NO', '否');
  define('REFRESH_BUTTON', '重新检查');
  define('OKAY', 'Okay');

  // Global entries for the <html> tag
  define('HTML_PARAMS','dir="ltr" lang="zh"');

  // charset for web pages and emails
  define('CHARSET', 'utf-8');

  // META TAG TITLE
  define('META_TAG_TITLE', (defined('TEXT_PAGE_HEADING') ? TEXT_PAGE_HEADING : 'Zen Cart中文版安装'));

  define('INSTALLATION_IN_PROGRESS','正在安装 ...');

  if (isset($_GET['main_page']) && ($_GET['main_page']== 'index' || $_GET['main_page']== 'license')) {
    define('TEXT_ERROR_WARNING', '您好：在继续之前，有几个问题要解决。');
  } else {
    define('TEXT_ERROR_WARNING', '<span class="errors"><strong>警告:&nbsp; 发现问题</strong></span>');
  }

  define('DB_ERROR_NOT_CONNECTED', '安装错误：无法链接数据库');
	define('SHOULD_UPGRADE','请考虑升级！');
  define('MUST_UPGRADE','安装Zen Cart中文版前请升级');

  define('UPLOAD_SETTINGS','最大上传大小取决于下面的最小值:.<br />
<em>upload_max_filesize</em> 位于 php.ini %s <br />
<em>post_max_size</em> 位于 php.ini: %s <br />' . 
//'<em>Zen Cart中文版</em> 上传设置: %s <br />' .
'某些Apache设置影响上传文件及文件大小，具体情况参加Apache文档。');

  define('TEXT_HELP_LINK', '说明...');
  define('TEXT_CLOSE_WINDOW', '[关闭窗口]');
  define('STORE_ADDRESS_DEFAULT_VALUE', '商店名称
  地址
  国家
  电话');

  define('ERROR_TEXT_ADMIN_CONFIGURE', '/admin/includes/configure.php文件不存在');
  define('ERROR_CODE_ADMIN_CONFIGURE', '2');

  define('ERROR_TEXT_STORE_CONFIGURE', '/includes/configure.php文件不存在');
  define('ERROR_CODE_STORE_CONFIGURE', '3');

  define('ERROR_TEXT_PHYSICAL_PATH_ISEMPTY', '物理路径为空');
  define('ERROR_CODE_PHYSICAL_PATH_ISEMPTY', '9');

  define('ERROR_TEXT_PHYSICAL_PATH_INCORRECT', '物理路径不正确');
  define('ERROR_CODE_PHYSICAL_PATH_INCORRECT', '10');

  define('ERROR_TEXT_VIRTUAL_HTTP_ISEMPTY', 'HTTP为空');
  define('ERROR_CODE_VIRTUAL_HTTP_ISEMPTY', '11');

  define('ERROR_TEXT_VIRTUAL_HTTPS_ISEMPTY', 'HTTPS为空');
  define('ERROR_CODE_VIRTUAL_HTTPS_ISEMPTY', '12');

  define('ERROR_TEXT_VIRTUAL_HTTPS_SERVER_ISEMPTY', 'HTTPS服务器为空');
  define('ERROR_CODE_VIRTUAL_HTTPS_SERVER_ISEMPTY', '13');

  define('ERROR_TEXT_DB_USERNAME_ISEMPTY', '数据库用户名为空');
  define('ERROR_CODE_DB_USERNAME_ISEMPTY', '16'); // re-using another one, since message is essentially the same.

  define('ERROR_TEXT_DB_HOST_ISEMPTY', '数据库主机为空');
  define('ERROR_CODE_DB_HOST_ISEMPTY', '24');

  define('ERROR_TEXT_DB_NAME_ISEMPTY', '数据库名为空'); 
  define('ERROR_CODE_DB_NAME_ISEMPTY', '25');

  define('ERROR_TEXT_DB_SQL_NOTEXIST', 'SQL安装文件不存在');
  define('ERROR_CODE_DB_SQL_NOTEXIST', '26');

  define('ERROR_TEXT_DB_NOTSUPPORTED', '数据库不支持');
  define('ERROR_CODE_DB_NOTSUPPORTED', '27');

  define('ERROR_TEXT_DB_CONNECTION_FAILED', '连接到数据库失败');
  define('ERROR_CODE_DB_CONNECTION_FAILED', '28');

  define('ERROR_TEXT_STORE_ZONE_NEEDS_SELECTION', '请设置商店所在地区');
  define('ERROR_CODE_STORE_ZONE_NEEDS_SELECTION', '29');

  define('ERROR_TEXT_DB_NOTEXIST', '数据库不存在');
  define('ERROR_CODE_DB_NOTEXIST', '30');

  define('ERROR_TEXT_STORE_NAME_ISEMPTY', '商店名称为空');
  define('ERROR_CODE_STORE_NAME_ISEMPTY', '31');

  define('ERROR_TEXT_STORE_OWNER_ISEMPTY', '商店管理员为空');
  define('ERROR_CODE_STORE_OWNER_ISEMPTY', '32');

  define('ERROR_TEXT_STORE_OWNER_EMAIL_ISEMPTY', '商店的电子邮件地址为空');
  define('ERROR_CODE_STORE_OWNER_EMAIL_ISEMPTY', '33');

  define('ERROR_TEXT_STORE_OWNER_EMAIL_NOTEMAIL', '商店的电子邮件地址无效');
  define('ERROR_CODE_STORE_OWNER_EMAIL_NOTEMAIL', '34');

define('ERROR_TEXT_STORE_ADDRESS_ISEMPTY', '商店地址为空');
define('ERROR_CODE_STORE_ADDRESS_ISEMPTY', '35');

define('ERROR_TEXT_DEMO_SQL_NOTEXIST', '演示商品的SQL文件不存在');
define('ERROR_CODE_DEMO_SQL_NOTEXIST', '36');

define('ERROR_TEXT_ADMIN_USERNAME_ISEMPTY', '管理员用户名为空');
define('ERROR_CODE_ADMIN_USERNAME_ISEMPTY', '46');

define('ERROR_TEXT_ADMIN_EMAIL_ISEMPTY', '管理员电子邮件为空');
define('ERROR_CODE_ADMIN_EMAIL_ISEMPTY', '47');

define('ERROR_TEXT_ADMIN_EMAIL_NOTEMAIL', '管理员电子邮件无效');
define('ERROR_CODE_ADMIN_EMAIL_NOTEMAIL', '48');

define('ERROR_TEXT_ADMIN_PASS_ISEMPTY', '管理员密码为空');
define('ERROR_CODE_ADMIN_PASS_ISEMPTY', '49');

define('ERROR_TEXT_ADMIN_PASS_NOTEQUAL', '密码不匹配');
define('ERROR_CODE_ADMIN_PASS_NOTEQUAL', '50');

define('ERROR_TEXT_4_1_2', 'PHP版本为 4.1.2');
define('ERROR_CODE_4_1_2', '1');
define('ERROR_TEXT_PHP_OLD_VERSION', 'PHP版本不支持');
define('ERROR_CODE_PHP_OLD_VERSION', '55');
define('ERROR_TEXT_PHP_VERSION', 'PHP版本不支持');
define('ERROR_CODE_PHP_VERSION', '91');

define('ERROR_TEXT_ADMIN_CONFIGURE_WRITE', '管理configure.php文件不可写');
define('ERROR_CODE_ADMIN_CONFIGURE_WRITE', '56');

define('ERROR_TEXT_STORE_CONFIGURE_WRITE', '商店configure.php文件不可写');
define('ERROR_CODE_STORE_CONFIGURE_WRITE', '57');

define('ERROR_TEXT_CACHE_DIR_ISEMPTY', '选择的Session/SQL缓存目录为空');
define('ERROR_CODE_CACHE_DIR_ISEMPTY', '61');

define('ERROR_TEXT_CACHE_DIR_ISDIR', '选择的Session/SQL缓存目录不存在');
define('ERROR_CODE_CACHE_DIR_ISDIR', '62');

define('ERROR_TEXT_CACHE_DIR_ISWRITEABLE', '选择的Session/SQL缓存目录不可写');
define('ERROR_CODE_CACHE_DIR_ISWRITEABLE', '63');

define('ERROR_TEXT_ADMIN_PASS_INSECURE', '密码不安全，需要包含字母和数字，且不少于7位。');
define('ERROR_CODE_ADMIN_PASS_INSECURE', '64');

define('ERROR_TEXT_REGISTER_GLOBALS_ON', 'Register Globals打开');
define('ERROR_CODE_REGISTER_GLOBALS_ON', '69');

define('ERROR_TEXT_SAFE_MODE_ON', '安全模式打开');
define('ERROR_CODE_SAFE_MODE_ON', '70');

define('ERROR_TEXT_CACHE_CUSTOM_NEEDED','使用文件缓冲功能，需要缓存目录');
define('ERROR_CODE_CACHE_CUSTOM_NEEDED', '71');

define('ERROR_TEXT_TABLE_RENAME_CONFIGUREPHP_FAILED','Could not update all your configure.php files with new prefix');
define('ERROR_CODE_TABLE_RENAME_CONFIGUREPHP_FAILED', '72');

define('ERROR_TEXT_TABLE_RENAME_INCOMPLETE','无法改名所有数据表');
define('ERROR_CODE_TABLE_RENAME_INCOMPLETE', '73');

define('ERROR_TEXT_SESSION_SAVE_PATH','PHP "session.save_path" 不可写');
define('ERROR_CODE_SESSION_SAVE_PATH','74');

define('ERROR_TEXT_MAGIC_QUOTES_RUNTIME','PHP "magic_quotes_runtime" 处于打开状态');
define('ERROR_CODE_MAGIC_QUOTES_RUNTIME','75');

define('ERROR_TEXT_DB_VER_UNKNOWN','数据库引擎版本信息未知');
define('ERROR_CODE_DB_VER_UNKNOWN','76');

define('ERROR_TEXT_UPLOADS_DISABLED','不允许文件上传');
define('ERROR_CODE_UPLOADS_DISABLED','77');

define('ERROR_TEXT_ADMIN_PWD_REQUIRED','升级需要管理员密码');
define('ERROR_CODE_ADMIN_PWD_REQUIRED','78');

define('ERROR_TEXT_PHP_SESSION_SUPPORT','需要支持PHP Session');
define('ERROR_CODE_PHP_SESSION_SUPPORT','80');

define('ERROR_TEXT_PHP_AS_CGI','建议只在Windows服务器下以cgi方式运行PHP');
define('ERROR_CODE_PHP_AS_CGI','81');

define('ERROR_TEXT_DISABLE_FUNCTIONS','您的服务器关闭了所需的PHP功能');
define('ERROR_CODE_DISABLE_FUNCTIONS','82');

define('ERROR_TEXT_OPENSSL_WARN','OpenSSL是服务器提供SSL(https://)支持的一种方式。<br /><br />如果显示不可用，可能的原因有：<br />(a) 您的主机不支持SSL<br />(b) 您的服务器没有安装OpenSSL，但可能有其它的SSL服务。<br />(c) 您的服务器也许不知道您的SSL证书，所以无法提供支持<br />(d) PHP没有设置OpenSSL。<br /><br />任何情况，如果您需要SSL支持，请联系主机提供商。');
define('ERROR_CODE_OPENSSL_WARN','79');

define('ERROR_TEXT_DB_PREFIX_NODOTS','数据库表前缀只能含字母、数字或下划线');
define('ERROR_CODE_DB_PREFIX_NODOTS','83');

define('ERROR_TEXT_PHP_SESSION_AUTOSTART','需要关闭PHP Session.autostart');
define('ERROR_CODE_PHP_SESSION_AUTOSTART','84');
define('ERROR_TEXT_PHP_SESSION_TRANS_SID','需要关闭PHP Session.use_trans_sid');
define('ERROR_CODE_PHP_SESSION_TRANS_SID','86');
define('ERROR_TEXT_DB_PRIVS','数据库用户没有权限');
define('ERROR_CODE_DB_PRIVS','87');
define('ERROR_TEXT_COULD_NOT_WRITE_CONFIGURE_FILES','写入/includes/configure.php文件时出错');
define('ERROR_CODE_COULD_NOT_WRITE_CONFIGURE_FILES','88');
define('ERROR_TEXT_GD_SUPPORT','GD支持详情');
define('ERROR_CODE_GD_SUPPORT','89');

define('ERROR_TEXT_DB_MYSQL5','未在MySQL 5.7 以上版本测试');
define('ERROR_CODE_DB_MYSQL5','90');

define('ERROR_TEXT_OPEN_BASEDIR','上传文件或备份可能有问题');
define('ERROR_CODE_OPEN_BASEDIR','92');
define('ERROR_TEXT_CURL_SUPPORT','没有检测到cURL支持');
define('ERROR_CODE_CURL_SUPPORT','93');
define('ERROR_TEXT_CURL_NOT_COMPILED', 'PHP中没有编译CURL - 请联系主机商。');
define('ERROR_TEXT_CURL_PROBLEM_GENERAL', 'CURL有问题: ');
define('ERROR_TEXT_CURL_SSL_PROBLEM', 'CURL需要SSL支持，请联系主机商。');
define('ERROR_CODE_CURL_SSL_PROBLEM','95');

define('ERROR_TEXT_MAGIC_QUOTES_SYBASE','PHP的 "magic_quotes_sybase" 已打开');
define('ERROR_CODE_MAGIC_QUOTES_SYBASE','94');

$error_code ='';
if (isset($_GET['error_code'])) {
  $error_code = $_GET['error_code'];
  }

switch ($error_code) {
  case ('1'):
    define('POPUP_ERROR_HEADING', '检测到 PHP 版本 4.1.2');
    define('POPUP_ERROR_TEXT', '不再支持 PHP 版本 4，最低要求 PHP 5.2.10。');
    
  break;
  case ('2'):
    define('POPUP_ERROR_HEADING', '文件/admin/includes/configure.php不存在');
    define('POPUP_ERROR_TEXT', '文件/admin/includes/configure.php不存在. 您可以建一个空文件，或者将文件/admin/includes/dist-configure.php改名为configure.php。建立该文件后，安装时将其设为可读写， 例如CHMOD 666 或 CHMOD 777。');
    
  break;
  case ('3'):
    define('POPUP_ERROR_HEADING', '文件/includes/configure.php不存在');
    define('POPUP_ERROR_TEXT', '文件/includes/configure.php不存在。您可以建一个空文件，或者将文件/includes/dist-configure.php改名为configure.php。建立该文件后，将其设为可读写，例如 CHMOD 666 或 CHMOD 777。');
    
  break;
  case ('4'):
    define('POPUP_ERROR_HEADING', '物理路径');
    define('POPUP_ERROR_TEXT', '物理路径是Zen Cart文件所在目录的路径。例如，在一些Linux系统下，HTML文件存放在/var/www/html。如果您将Zen Cart文件放在目录\'store\'中，那么物理路径就是/var/www/html/store。安装程序通常能正确检查到该目录。');
    
  break;
  case ('5'):
    define('POPUP_ERROR_HEADING', 'HTTP路径');
    define('POPUP_ERROR_TEXT', '这是您在浏览器中查看您的Zen Cart商店所输入的地址。如果该商店是您域名的\'根\'，那么就是 \'http://www.yourdomain.com\'。如果您将文件放在\'store\'目录下，那么该路径就是\'http://www.yourdomain.com/store\'。');
    
  break;
  case ('6'):
    define('POPUP_ERROR_HEADING', 'HTTPS服务器');
    define('POPUP_ERROR_TEXT', '这是您的安全/SSL服务器的网址。该地址与您的服务器上的SSL/安全模式的设置有关。英文说明见<a href="http://www.zen-cart.com/content.php?56" target="_blank">FAQ Entry</a>。');
  break;
  case ('7'):
    define('POPUP_ERROR_HEADING', 'HTTPS路径');
    define('POPUP_ERROR_TEXT', '这是您在浏览器里输入的在安全/SSL模式下访问您的Zen Cart页面的地址。英文说明见<a href="http://www.zen-cart.com/content.php?56" target="_blank">FAQ Entry</a>。');
  break;
  case ('8'):
    define('POPUP_ERROR_HEADING', 'OpenSSL');
    define('POPUP_ERROR_TEXT', '该设置决定是否在您的Zen Cart网站采用SSL/安全 (HTTPS:)模式。<br /><br />任何含有个人信息，例如：登录、结帐、帐号详情的页面，都可以用SSL/安全模式来保护。该模式也可以在管理页面下打开。<br /><br />您必须要有SSL服务器(以HTTPS代替HTTP). <br /><br />如果您不确定是否有SSL服务器，请将该选项设为[否]，询问您的主机供应商。提示：和其它所有设置一样，这个设置以后可以通过修改configure.php文件来实现。');
    
  break;
  case ('9'):
    define('POPUP_ERROR_HEADING', '物理路径为空');
    define('POPUP_ERROR_TEXT', '物理路径为空，请正确填写');
    
  break;
  case ('10'):
    define('POPUP_ERROR_HEADING', '物理路径不正确');
    define('POPUP_ERROR_TEXT', '填写的物理路径不正确，请检查。');
    
  break;
  case ('11'):
    define('POPUP_ERROR_HEADING', 'HTTP为空');
    define('POPUP_ERROR_TEXT', '虚拟HTTP路径为空，请正确填写');
    
  break;
  case ('12'):
    define('POPUP_ERROR_HEADING', 'HTTPS为空');
    define('POPUP_ERROR_TEXT', 'SSL模式已开启，但是虚拟HTTPS路径为空。请正确填写HTTPS路径或关闭SSL模式。');
    
  break;
  case ('13'):
    define('POPUP_ERROR_HEADING', 'HTTPS服务器为空');
    define('POPUP_ERROR_TEXT', 'SSL模式已开启，但是虚拟HTTPS路径为空。请正确填写HTTPS路径或关闭SSL模式。');
    
  break;
  case ('14'):
    define('POPUP_ERROR_HEADING', '数据库编码');
    define('POPUP_ERROR_TEXT', 'Zen Cart中文版必须使用UTF-8编码。');
    
  break;
  case ('15'):
    define('POPUP_ERROR_HEADING', '数据库主机');
    define('POPUP_ERROR_TEXT', '数据库主机名，通常设置为 \'localhost\'，或者请咨询主机商。<br /><br />多数主机用 "localhost"<br />Yahoo 主机使用 "mysql"<br />部分主机可在主机的控制面板中查看。');
    
  break;
  case ('16'):
    define('POPUP_ERROR_HEADING', '数据库用户名');
    define('POPUP_ERROR_TEXT', '存取数据库都要求用户名和密码，请联系主机商获得。');
    
  break;
  case ('17'):
    define('POPUP_ERROR_HEADING', '数据库密码');
    define('POPUP_ERROR_TEXT', '存取数据库都要求用户名和密码，请联系主机商获得。<br /><br />密码要注意大小写。');
    
  break;
  case ('18'):
    define('POPUP_ERROR_HEADING', '数据库名');
    define('POPUP_ERROR_TEXT', 'Zen Cart使用的数据库名。如果您不知道填什么内容，请联系主机商。<br /><br />有时数据库名要加上主机的账户前缀，然后加上您输入的数据库名。例如: myaccount_zencartdb');
    
  break;
  case ('19'):
    define('POPUP_ERROR_HEADING', '数据库表前缀');
    define('POPUP_ERROR_TEXT', 'Zen Cart可以给数据表加上前缀。这在只有一个数据库的情况下很有用，就可以和其它软件共用同一数据库。<br /><strong>通常不必修改这个设置。<br />可用字母、数字和下划线</strong>');
    
  break;
  case ('20'):
    define('POPUP_ERROR_HEADING', '建立数据库');
    define('POPUP_ERROR_TEXT', '该设置决定安装程序是否要为Zen Cart新建数据库。在这里\'create\'不是添加Zen Cart需要的数据表，数据表会自动创建。许多主机没有\'create\'权限，而是通过其它方法新建数据库，例如通过控制面板或者phpMyAdmin.');
    
  break;
//  case ('21'):
//    define('POPUP_ERROR_HEADING', '数据库连接');
//    define('POPUP_ERROR_TEXT', '永久性链接用于减轻数据库负载，在设置本选项前请咨询主机商。如果主机未设置，打开 "persistent connections" 有时会造成主机的数据库出错。<br /><br />记住，在使用本选项前，请联系主机商。');
//
//  break;
//  case ('22'):
//    define('POPUP_ERROR_HEADING', '数据库Sessions');
//    define('POPUP_ERROR_TEXT', '选择将session信息存在文件还是数据库中。基于文件的sessions速度快些，但使用SSL链接的商店，<strong>建议使用</strong>基于数据库的sessions，这更安全。');
//
//  break;
  case ('23'):
    define('POPUP_ERROR_HEADING', 'OpenSSL');
    define('POPUP_ERROR_TEXT', '如果设置为 "true"，Zen Cart中文版在某些页面将使用SSL模式，需要输入正确的HTTPS服务器名和路径。您的主机商会提供这些信息给您。<br />如果您还没有SSL，通常需要另外购买。费用含固定IP地址的月费，以及SSL认证的年费。');
    
  break;
  case ('24'):
    define('POPUP_ERROR_HEADING', '数据库主机名为空');
    define('POPUP_ERROR_TEXT', '数据库主机名为空，请输入有效的数据库主机名。<br />通常可设置为 \'localhost\'。或者请咨询主机商。');
  break;
  
  case ('25'):
    define('POPUP_ERROR_HEADING', '数据库名为空');
    define('POPUP_ERROR_TEXT', '数据库名为空。请输入Zen Cart要使用的数据库名称。<br />如果您不知道填什么，请联系主机商');
    
  break;
  case ('26'):
    define('POPUP_ERROR_HEADING', 'SQL安装文件不存在');
    define('POPUP_ERROR_TEXT', '安装程序无法找到所需的SQL安装脚本。该文件应该位于\'zc_install/sql\'目录，文件名为\'mysql_zencart.sql\'。');
    
  break;
  case ('27'):
    define('POPUP_ERROR_HEADING', '数据库不支持');
    define('POPUP_ERROR_TEXT', 'The database type you have selected does not appear to be supported by the PHP version you have installed. You may need to check with your hosting provider to check that the database type you have selected is supported. If this is your own server, then please ensure that support for the database type has been compiled into PHP, and that the necessary extensions/modules/dll files are being loaded (esp check php.ini for extension=mysql.so, etc).');
    
  break;
  case ('28'):
    define('POPUP_ERROR_HEADING', '连接到数据库失败');
    define('POPUP_ERROR_TEXT', '无法链接到数据库。有几种可能。<br /><br />
数据库主机名可能给错了，或是用户名或密码不正确。<br /><br />
也可能是数据库名不对，(<strong>是否存在?</strong> <strong>您建立了该数据库吗?</strong> -- 提示: Zen Cart不会创建数据库<br /><br />请核对所有输入项目。');
    
  break;
  case ('29'):
    define('POPUP_ERROR_HEADING', '请选择商店地区');
    define('POPUP_ERROR_TEXT', '请从商店地区列表中选择一个地区，将用于计算税收和运费。以后可以到 管理页面->商店设置->基本设置 中修改');

  break;
  case ('30'):
    define('POPUP_ERROR_HEADING', '数据库不存在');
    define('POPUP_ERROR_TEXT', 'The database name you have specified does not appear to exist.<br />(<strong>Did you create it?</strong> -- NOTE: Zen Cart&reg; does not create a database for you.).<br /><br />Please check your database details, then verify this entry and make corrections where necessary.<br /><br />You may need to use your webhosting control panel to create the database. While creating it, make note of the username and password, as well as the database-name used, as you will need this information to fill in the details on this installer screen.');
    
  break;
  case ('31'):
    define('POPUP_ERROR_HEADING', '商店名为空');
    define('POPUP_ERROR_TEXT', '请填写您的商店名称。');
    
  break;
  case ('32'):
    define('POPUP_ERROR_HEADING', '商店店主为空');
    define('POPUP_ERROR_TEXT', '请填写店主的名字，名字将显示在\'联系我们\'页面、\'欢迎\'邮件以及商店的其它地方。');
    
  break;
  case ('33'):
    define('POPUP_ERROR_HEADING', '商店的电子邮件地址为空');
    define('POPUP_ERROR_TEXT', '请填写商店的主要电子邮件地址，这是用于发送商店邮件时的联系地址，不会显示在商店中。');
    
  break;
  case ('34'):
    define('POPUP_ERROR_HEADING', '商店的电子邮件地址无效');
    define('POPUP_ERROR_TEXT', '请输入有效的电子邮件地址');
    
  break;
  case ('35'):
    define('POPUP_ERROR_HEADING', '商店地址为空');
    define('POPUP_ERROR_TEXT', 'Please supply the street address of your store.  This will be displayed on the Contact-Us page (this can be disabled if required), and on invoice/packing-slip materials. It will also be displayed if a customer elects to purchase by check/money-order, upon checkout.');
    
  break;
  case ('36'):
    define('POPUP_ERROR_HEADING', '演示商品SQL文件不存在');
    define('POPUP_ERROR_TEXT', 'We were unable to locate the SQL file containing the Zen Cart demo products to load them into your store.  Please check that the /zc_install/demo/xxxxxxx_demo.sql file exists. (xxxxxxx = your database-type).');
    
  break;
  case ('37'):
    define('POPUP_ERROR_HEADING', '商店名称');
    define('POPUP_ERROR_TEXT', '商店的名称。将用于电子邮件及浏览器标题。');
    
  break;
  case ('38'):
    define('POPUP_ERROR_HEADING', '商店店主');
    define('POPUP_ERROR_TEXT', '店主名字会显示在系统发出的邮件中。');
    
  break;
  case ('39'):
    define('POPUP_ERROR_HEADING', '商店店主的电子邮件');
    define('POPUP_ERROR_TEXT', '用于联系商店的主要电子邮件。系统将用该地址发送邮件，也用在联系我们页面。');
    
  break;
  case ('40'):
    define('POPUP_ERROR_HEADING', '商店所在国家或地区');
    define('POPUP_ERROR_TEXT', '商店所在的国家或地区。请正确设置，以保证税率和运费的正确计算。同时，该值也用于决定发票的格式等。');
    
  break;
  case ('41'):
    define('POPUP_ERROR_HEADING', '商店所在地区');
    define('POPUP_ERROR_TEXT', '商店所在的地理位置。例如：中国的省份');
    
  break;
  case ('42'):
    define('POPUP_ERROR_HEADING', '商店地址');
    define('POPUP_ERROR_TEXT', '您的商店地址，显示在发票和订单确认信上');
    
  break;
  case ('43'):
    define('POPUP_ERROR_HEADING', '商店缺省语言');
    define('POPUP_ERROR_TEXT', '商店使用的缺省语言。Zen_Cart支持多语言，但需要语言包的支持。缺省情况下Zen Cart中文版仅带中文和英文语言包，其他语言包可以到www.zen-cart.cn上下载。');
    
  break;
  case ('44'):
    define('POPUP_ERROR_HEADING', '商店缺省货币');
    define('POPUP_ERROR_TEXT', '选择商店的缺省货币。如果您的货币没有列出，安装完成后可以在管理页面下添加。');
    
  break;
  case ('45'):
    define('POPUP_ERROR_HEADING', '安装演示商品');
    define('POPUP_ERROR_TEXT', '选择是否安装演示商品，用于演示Zen Cart的各种功能特点。');
    
  break;
  case ('46'):
    define('POPUP_ERROR_HEADING', '管理员用户名为空');
    define('POPUP_ERROR_TEXT', 'To log into the Admin area after install is complete, you need to supply an Admin username here.');
    
  break;
  case ('47'):
    define('POPUP_ERROR_HEADING', '管理员电子邮件为空');
    define('POPUP_ERROR_TEXT', 'The Admin email address is required in order to send password-resets in case you forget the password.');
    
  break;
  case ('48'):
    define('POPUP_ERROR_HEADING', '管理员电子邮件无效');
    define('POPUP_ERROR_TEXT', 'Please supply a valid email address.');
    
  break;
  case ('49'):
    define('POPUP_ERROR_HEADING', '管理员密码为空');
    define('POPUP_ERROR_TEXT', 'For security, the Administrator\'s password cannot be blank.');
    
  break;
  case ('50'):
    define('POPUP_ERROR_HEADING', '密码不匹配');
    define('POPUP_ERROR_TEXT', 'Please re-enter the administrator password and confirmation password.');
    
  break;
  case ('51'):
    define('POPUP_ERROR_HEADING', '管理员用户名');
    define('POPUP_ERROR_TEXT', 'To log into the Admin area after install is complete, you need to supply an Admin username here.');
    
  break;
  case ('52'):
    define('POPUP_ERROR_HEADING', '管理员电子邮件地址');
    define('POPUP_ERROR_TEXT', 'The Admin email address is required in order to send password-resets in case you forget the password.');
    
  break;
  case ('53'):
    define('POPUP_ERROR_HEADING', '管理员密码');
    define('POPUP_ERROR_TEXT', '管理员密码必须包含字母和数字，且不少于7位。');
    
  break;
  case ('54'):
    define('POPUP_ERROR_HEADING', '管理员密码确认');
    define('POPUP_ERROR_TEXT', 'Naturally, you need to supply matching passwords before the password can be saved for future use.');
    
  break;
  case ('55'):
    define('POPUP_ERROR_HEADING', 'PHP版本不支持');
    define('POPUP_ERROR_TEXT', '您服务器的PHP版本不支持Zen Cart中文版。<br /><br />最低要求为PHP 5.2.14。<br />建议使用 PHP 5.3.3 及以上版本<br /><br /><br />如果使用旧版的PHP，可能无法访问Zen Cart的管理页面、存在安全隐患等。请升级PHP版本。');
  break;
  case ('56'):
    define('POPUP_ERROR_HEADING', '管理部分的文件configure.php不可写');
    define('POPUP_ERROR_TEXT', '文件 admin/includes/configure.php 不可写。<br /><br />如果是Unix或Linux系统，请CHMOD文件为777 或 666 直到 Zen Cart中文版安装结束。通常可以通过FTP修改(右键点击或修改文件属性等)。<br /><br />在Windows桌面系统下，只要将文件设置为可读写。<br /><br />在Windows服务器下，特别是用IIS，需要右键点击文件，再点安全标签，然后确认 "Internet Guest Account" 或 IUSR_xxxxxxx 用户有读写权限。<br /><br /><strong>安装完成后，</strong>请设置文件为只读(CHMOD 644 或 444, 如果是Windows，去掉"可写"选项，或"选中"只读方框)。');
    
  break;
  case ('57'):
    define('POPUP_ERROR_HEADING', '商店部分的文件configure.php不可写');
    define('POPUP_ERROR_TEXT', '文件 includes/configure.php 不可写。如果是Unix或Linux系统，请CHMOD文件为777 或 666 直到Zen Cart中文版安装结束。通常可以通过FTP修改(右键点击或修改文件属性等)。<br /><br />在Windows桌面系统下，只要将文件设置为可读写。<br /><br />在Windows服务器下，特别是用IIS，需要右键点击文件，再点安全标签，然后确认 "Internet Guest Account" 或 IUSR_xxxxxxx 用户有读写权限。<br /><br /><strong>安装完成后，</strong>请设置文件为只读(CHMOD 644 或 444, 如果是Windows，去掉"可写"选项，或"选中"只读方框)。');
    
  break;
  case ('58'):
    define('POPUP_ERROR_HEADING', '数据库表前缀');
    define('POPUP_ERROR_TEXT', 'Zen Cart allows you to add a prefix to the table names it uses to store its information. This is especially useful if your host only allows you one database, and you want to install other scripts on your system that use that database. <strong>Normally you should just leave the setting blank.</strong>');
    
  break;
  case ('59'):
    define('POPUP_ERROR_HEADING', 'SQL缓存目录');
    define('POPUP_ERROR_TEXT', 'SQL queries can be cached either in the database, in a file on your server\'s hard disk, or not at all. If you choose to cache SQL queries to a file on your server\'s hard disk, then you must provide the directory where this information can be saved. <br /><br />The standard Zen Cart installation includes a \'cache\' folder.  You need to mark this folder read-write for your webserver (ie: apache) to access it.<br /><br />Please ensure that the directory you select exists and is writeable by the web server (CHMOD 777 or at least 666 recommended).');
    
  break;
  case ('60'):
    define('POPUP_ERROR_HEADING', 'SQL缓存方式');
    define('POPUP_ERROR_TEXT', '一些SQL的查询可以使用缓存，意味着如果使用缓存，速度会快很多。您可以决定使用哪种SQL查询的缓存方式。<br /><br /><strong>无</strong>. 不使用SQL查询缓存。如果您的商品/分类很少，该方式实际上速度最快。<br /><br /><strong>数据库</strong>. SQL查询缓存在数据库表中。听起来很奇怪，但对于商品/分类数量中等的网站来说，可以加快速度。<br /><br /><strong>文件</strong>. SQL查询缓存于服务器的硬盘上。要使用该方式，请确保网页服务器可以写入缓存目录。该方式最适合包含大量的商品/分类的网站。');
    
  break;
  case ('61'):
    define('POPUP_ERROR_HEADING', 'Session/SQL缓存目录为空');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.');
    
  break;
  case ('62'):
    define('POPUP_ERROR_HEADING', 'Session/SQL缓存目录不存在');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.');
    
  break;
  case ('63'):
    define('POPUP_ERROR_HEADING', 'Session/SQL缓存目录不可写');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.  CHMOD 666 or 777 is advisable under Linux/Unix.  Read/Write is suitable under Windows servers (in IIS, must set this for the Internet Guest Account).');
  break;

  case ('64'):
    define('POPUP_ERROR_HEADING', '管理员密码');
    define('POPUP_ERROR_TEXT', '管理员密码必须包含字母和数字，且不少于7位。<br /><br />说明: 密码有效期 90 天。');

  break;
//  case ('65'):
//    define('POPUP_ERROR_HEADING', 'phpBB数据库表前缀');
//    define('POPUP_ERROR_TEXT', 'Please supply the table-prefix for your phpBB tables in the database where they are located. This is usually \'phpBB_\'');
//
//  break;
//  case ('66'):
//    define('POPUP_ERROR_HEADING', 'phpBB数据库名');
//    define('POPUP_ERROR_TEXT', 'Please supply the database name where your phpBB tables are located.');
//  break;
//  case ('67'):
//    define('POPUP_ERROR_HEADING', 'phpBB目录');
//    define('POPUP_ERROR_TEXT', '请输入保存phpBB脚本文件的详细路径。这样，用户点击商店上phpBB的链接时，Zen Cart知道转向哪里。<br /><br />输入的路径是相对于服务器的"根"。所以，如果您的phpBB安装在<strong>/home/users/username/public_html/phpbb </strong>，那么您就输入<strong>/home/users/username/public_html/phpbb/ </strong>。 如果在某个子目录下，您需要列出子目录的路径。<br /><br />我们会查找该目录下的"<em>config.php</em>" 文件。');
//  break;
//  case ('68'):
//    define('POPUP_ERROR_HEADING', 'phpBB目录');
//    define('POPUP_ERROR_TEXT', 'No phpBB configure file could be found in the directory you specified. You must already have installed phpBB if you wish to use this automatic configuration. Otherwise you will have to skip automatic phpBB configuration and set it up manually later.<br /><br />The path entered here is relative to the "root" of your server. So, if your phpBB installation is in <strong>/home/users/username/public_html/phpbb </strong>, then you need to enter <strong>/home/users/username/public_html/phpbb/ </strong>here. If it is under another set of subfolders, you need to list those folders in the path.<br /><br />We will look to find your "<em>config.php</em>" file in that folder.');
//  break;
  case ('69'):
    define('POPUP_ERROR_HEADING', 'Register Globals');
    define('POPUP_ERROR_TEXT', 'Zen Cart&reg; can work with the "Register Globals" setting on or off.  However, having it "off" leaves your system somewhat more secure.<br /><br />If you wish to disable it, and your hosting company won\'t turn it off for you, you might try adding this to an .htaccess file in the root of your shop (you may have to create the file if you don\'t already have one):<br /><br /><code>php_value session.use_trans_sid off<BR />php_value register_globals off<br />#php_value register_globals off<BR />&lt;Files ".ht*"&gt;<BR />deny from all<BR />&lt;/Files&gt;</code><br /><br />or talk to your hosting company for assistance.');
  break;
  case ('70'):
    define('POPUP_ERROR_HEADING', '安全模式打开');
    define('POPUP_ERROR_TEXT', 'Zen Cart, being a full-service e-Commerce application, does not work well on servers running in Safe Mode.<br /><br />To run an e-Commerce system requires many advanced services often restricted on lower-cost "shared" hosting services. To run your online store in optimum fashion will require setting up a webhosting service that does not place you or your webspace in "Safe Mode".  You need your hosting company to set "SAFE_MODE=OFF" in your php.ini file.');
  break;
  case ('71'):
    define('POPUP_ERROR_HEADING', '使用基于文件的缓存方式，需要一个缓存目录');
    define('POPUP_ERROR_TEXT', 'If you wish to use the "file-based SQL cache support" in Zen Cart&reg;, you\'ll need to set the proper permissions on the cache folder in your webspace.<br /><br />Optionally, you can choose "Database Caching" or "No Caching" if you prefer not to use the cache folder. In this case, you MAY need to disable "store sessions" as well, as the session tracker uses the file cache as well.<br /><br />To set up the cache folder properly, use your FTP program or shell access to your server to CHMOD the folder to 666 or 777 read-write permissions level.<br /><br />Most specifically, the userID of your webserver (ie: \'apache\' or \'www-user\' or maybe \'IUSR_something\' under Windows) must have all \'read-write-delete\' etc privileges to the cache folder.');
  break;
  case ('72'):
    define('POPUP_ERROR_HEADING', '错误: Could not update all your configure.php files with new prefix');
    define('POPUP_ERROR_TEXT', 'While attempting to update your configure.php files after renaming tables, we encountered an error.  You will need to manually edit your /includes/configure.php and /admin/includes/configure.php files and ensure that the "define" for "DB_PREFIX" is set properly for your Zen Cart tables in your database.');
  break;
  case ('73'):
    define('POPUP_ERROR_HEADING', '错误: 无法修改所有数据表的表前缀');
    define('POPUP_ERROR_TEXT', 'While attempting to rename your database tables with the new table prefix, we encountered an error.  You will need to manually review your database tablenames for accuracy. Worst-case, you may need to recover from your backup.');
  break;
  case ('74'):
    define('POPUP_ERROR_HEADING', '提示: PHP "session.save_path" 不可写');
    define('POPUP_ERROR_TEXT', '<strong>提示：</strong>没有写入PHP session.save_path 设定路径的权限。<br /><br />这表明你不能用该路径存储临时文件。请使用下面显示的"建议的缓存路径"。<br /><br /><br />如果路径未知，也可能是服务器上php.ini文件中未设置，这没有问题。只是一个警告。如果一定要设置，请联系您的主机商。');
  break;
  case ('75'):
    define('POPUP_ERROR_HEADING', '提示: PHP "magic_quotes_runtime" 打开');
    define('POPUP_ERROR_TEXT', 'It is required to have "magic_quotes_runtime" disabled. When enabled, it can cause unexpected 1064 SQL errors, and other code-execution problems.<br /><br />If you cannot disable it for the whole server, it may be possible to disable via .htaccess or your own php.ini file in your private webspace.  Talk to your hosting company for assistance.');
  break;
  case ('76'):
    define('POPUP_ERROR_HEADING', '数据库引擎版本信息未知');
    define('POPUP_ERROR_TEXT', 'The version number of your database engine could not be obtained.<br /><br />This is NOT NECESSARILY a serious issue. In fact, it can be quite common on a production server, as at the stage of this inspection, we may not yet know the required security credentials in order to log in to your server, since those are obtained later in the installation process.<br /><br />It is generally safe to proceed even if this information is listed as Unknown.');
  break;
  case ('77'):
    define('POPUP_ERROR_HEADING', '文件上传被禁止');
    define('POPUP_ERROR_TEXT', '文件上传关闭。要打开，请确认 <em><strong>file_uploads = on</strong></em> 出现在服务器的php.ini文件中.');
  break;
  case ('78'):
    define('POPUP_ERROR_HEADING', '升级需要管理员密码');
    define('POPUP_ERROR_TEXT', '需要商店管理员用户名和密码，以修改数据库。<br /><br />请输入您的Zen Cart网站管理员用户名及密码。');
  break;
  case ('79'):
    define('POPUP_ERROR_TEXT','OpenSSL是服务器提供SSL(https://)支持的一种方式。<br /><br />如果显示不可用，可能的原因有：<br />(a) 您的主机不支持SSL<br />(b) 您的服务器没有安装OpenSSL，但可能有其它的SSL服务。<br />(c) 您的服务器也许不知道您的SSL证书，所以无法提供支持<br />(d) PHP没有设置OpenSSL。<br /><br />任何情况，如果您需要SSL支持，请联系主机提供商。');
    define('POPUP_ERROR_HEADING','OpenSSL信息');
  break;
  case ('80'):
    define('POPUP_ERROR_HEADING', 'PHP Session支持是必须的');
    define('POPUP_ERROR_TEXT', '您需要打开网站对PHP Session的支持。您可以安装该模块: php4-session <br /><br /><br />PHP Session Support is required in order to support user-login and payment/checkout procedures. Please talk to your host to reconfigure PHP to enable session support. ');
  break;
  case ('81'):
    define('POPUP_ERROR_HEADING', '不建议以cgi方式允许PHP，除非服务器是Windows');
    define('POPUP_ERROR_TEXT', 'Running PHP as CGI can be problematic on some Linux/Unix servers.<br /><br />Windows servers, however, "always" run PHP as a cgi module, in which case this warning can be ignored.');
  break;
  case ('82'):
    define('POPUP_ERROR_HEADING', ERROR_TEXT_DISABLE_FUNCTIONS);
    define('POPUP_ERROR_TEXT', 'Your PHP configuration has one or more of the following functions marked as "disabled" in your server\'s PHP.INI file:<br /><ul><li>set_time_limit</li><li>exec</li></ul>Your server may suffer from decreased performance due to the use of these security measures which are usually implemented on highly-used public servers... which are not always ideal for running an e-Commerce system.<br /><br />It is recommended that you speak with your hosting provider to determine whether they have another server where you may run your site with these restrictions removed.');
  break;
  case ('83'):
    define('POPUP_ERROR_HEADING','数据库表前缀含非法字符');
    define('POPUP_ERROR_TEXT','。<br /><br />请选择一个不同的表前缀。<strong>建议留空</strong>或直接用"zen_"。');
  break;
  case ('84'):
    define('POPUP_ERROR_HEADING','应该关闭 PHP Session.autostart');
    define('POPUP_ERROR_TEXT','The session.auto_start setting in your server\'s PHP.INI file is set to ON. <br /><br />This could potentially cause you some problems with session handling, as Zen Cart&reg; is designed to start sessions when it\'s ready to activate session features. Having sessions start automatically can be a problem in some server configurations.<br /><br />If you wish to attempt disabling this yourself, you could try putting the following into a .htaccess file located in the root of your shop (same folder as index.php):<br /><br /><code>php_value session.auto_start 0</code><br /><br /> (You may have to create the file if you don\'t already have one.)');
  break;
  case ('85'):
    define('POPUP_ERROR_HEADING','一些数据库升级指令未执行');
    define('POPUP_ERROR_TEXT','During the database-upgrade process, some SQL statements could not be executed because they would have created duplicate entries in the database, or the prerequisites (such as column must exist to change or drop) were not met.<br /><br />THE MOST COMMON CAUSE of these failures/exceptions is that you have installed a contribution/add-on that has made alterations to the core database structure. The upgrader is trying to be friendly and not create a problem for you. <br /><br />YOUR STORE MAY WORK JUST FINE without investigating these errors, however, we recommend that you check them out to be sure. <br /><br />If you wish to investigate, you may look at your "upgrade_exceptions" table in the database for details on which statements failed to execute and why.');
  break;
  case ('86'):
    define('POPUP_ERROR_HEADING','应该关闭 PHP Session.use_trans_sid');
    define('POPUP_ERROR_TEXT','The session.use_trans_sid setting in your server\'s PHP.INI file is set to ON. <br /><br />That is BAD, and your hosting company should turn it off. <br><br>This could potentially cause you some problems with session handling and possibly even security concerns.<br /><br />If your hosting company staff are not capable of turning this off to protect everyone on the server, you can try to work around this by setting an .htaccess parameter such as this:<code>php_value session.use_trans_sid off</code>, or you could disable it in your PHP.INI if you have access to it.<br /><br />For more information on the security risks it imposes, see: <a href="http://shh.thathost.com/secadv/2003-05-11-php.txt">http://shh.thathost.com/secadv/2003-05-11-php.txt</a>.<br /><br />(You may have to create the .htaccess file if you don\'t already have one.)');
  break;
  case ('87'):
    define('POPUP_ERROR_HEADING','数据库用户没有权限');
    define('POPUP_ERROR_TEXT','Zen Cart operations require the following database-level privileges:<ul><li>ALL PRIVILEGES<br /><em>or</em></li><li>SELECT</li><li>INSERT</li><li>UPDATE</li><li>DELETE</li><li>CREATE</li><li>ALTER</li><li>INDEX</li><li>DROP</li></ul>Day-to-day activities do not normally require the "CREATE" and "DROP" privileges, but these ARE required for Installation, Upgrade, and SQLPatch activities.');
  break;
  case ('88'):
    define('POPUP_ERROR_HEADING','写入文件/includes/configure.php时出错');
    define('POPUP_ERROR_TEXT','While attempting to save your settings, Zen Cart&reg; Installer was unable to verify successful writing of your configure.php file settings. Please check to be sure that your webserver has full write permissions to the configure.php files shown below.<br /><br />- /includes/configure.php<br />- /admin/includes/configure.php<br /><br />You may want to also check that there is sufficient disk space (or disk quota available to you) in order to write updates to these files. <br /><br />If the files are 0-bytes in size when you encounter this error, then disk space or "available" disk space is likely the cause.<br /><br />Ideal permissions in Unix/Linux hosting is CHMOD 777 until installation is complete. Then they can be set back to 644 or 444 for security after installation is done.<br /><br />If you are running on a Windows host, you may also find it necessary to right-click on each of these files, choose "Properties", then the "Security" tab. Then click on "Add" and select "Everyone", and grant "Everyone" full read/write access until installation is complete. Then reset to read-only after installation.');
  break;
  case ('89'):
    define('POPUP_ERROR_HEADING','GD 支持详情');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; uses GD support in PHP, if available, to do image management activities.  It is preferred to have at least GD version 2.0 available.<br /><br />If GD support is not compiled into your PHP install, you may want to ask your hosting company to do this for you.');
  break;
  case ('90'):
    define('POPUP_ERROR_HEADING','未在MySQL 5.7 以上版本测试');
    define('POPUP_ERROR_TEXT','Zen Cart 中文版1.5 使用 MySQL 5');
  break;
  case ('91'):
    define('POPUP_ERROR_HEADING','PHP版本警告');
    define('POPUP_ERROR_TEXT','Zen Cart 中文版 v1.5.4 使用 PHP 5.3.17 到 5.6.x(可以使用 PHP 5.2.10 或更新版本，但使用旧版 PHP 较不安全)。<br /><br />Zen Cart中文版中使用的某些 PHP 功能，在旧版的 PHP 中不存在。<br /><br />建议升级PHP版本。');
  break;
  case ('92'):
    define('POPUP_ERROR_HEADING','open_basedir限制可能导致问题');
    define('POPUP_ERROR_TEXT','Your PHP is configured in such a way that prevents you from running scripts outside a specified "basedir" folder. Yet, your website files appear to be kept in a folder outside of the allowed "basedir" area.<br /><br />Among other things, you could have problems uploading files or doing backups.<br /><br />You should talk to your web host to change or remove this restriction.');
  break;
  case ('93'):
    define('POPUP_ERROR_HEADING','不支持cURL');
    define('POPUP_ERROR_TEXT','Some payment and shipping modules require cURL in order to talk to an external server to request real-time quotes or payment authorizations. <br /><br />If you intend to use the PayPal Express Checkout or PayPal Payments Pro modules, or Authorize.net AIM, you *need* CURL support.<br /><br />It appears that your server may not have cURL support configured or activated for your account. If you need a 3rd-party tool that uses cURL, you will need to talk to your web host to have them install cURL support on your server.<br /><br />More information on CURL can be found at the <a href="http://curl.haxx.se" target="_blank">CURL website</a>');
  break;
  case ('94'):
    define('POPUP_ERROR_HEADING', '提示: PHP的 "magic_quotes_sybase" 已打开');
    define('POPUP_ERROR_TEXT', 'It is best to have "magic_quotes_sybase" disabled. When enabled, it can cause unexpected 1064 SQL errors, and other code-execution problems.<br /><br />If you cannot disable it for the whole server, it may be possible to disable via .htaccess or your own php.ini file in your private webspace.  Talk to your hosting company for assistance.');
  break;
  case ('95'):
    define('POPUP_ERROR_HEADING','CURL需要SSL支持，请通知主机商。');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; uses CURL and SSL to communicate with some payment and shipping service providers.<br />The installer has just tested your CURL SSL support and found that it failed.<br /><br />You will not be able to use PayPal or Authorize.net or FirstData/Linkpoint payment modules, and possibly other third-party contributed payment/shipping modules until you enable SSL support in CURL and PHP.<br /><br />More information on CURL can be found at the <a href="http://curl.haxx.se" target="_blank">CURL website</a>');
  break;

}

define('TEXT_VERSION_CHECK_NEW_VER', '有新版本 v');
define('TEXT_VERSION_CHECK_NEW_PATCH', '有新补丁: v');
define('TEXT_VERSION_CHECK_PATCH', '补丁');
define('TEXT_VERSION_CHECK_DOWNLOAD', '下载地址');
define('TEXT_VERSION_CHECK_CURRENT', '您的 Zen Cart&reg; 是最新版。');
define('TEXT_ERROR_NEW_VERSION_AVAILABLE', '<a href="http://www.zen-cart.cn">Zen Cart&reg; 有新版本，请到</a><a href="http://www.zen-cart.cn" style="text-decoration:underline" target="_blank">www.zen-cart.cn</a>下载');
define('LABEL_ZC_VERSION_CHECK', 'Zen Cart 版本:');
