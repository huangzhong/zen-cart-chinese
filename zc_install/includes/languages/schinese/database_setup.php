<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: database_setup.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('SAVE_DATABASE_SETTINGS', '保存数据库设置');//this comes before TEXT_MAIN
  define('TEXT_MAIN', "下面我们需要知道您的数据库设置情况。请在相应栏目仔细输入配置内容，点击 <em>保存数据库设置</em> 以继续。'");
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 数据库设置');
  define('DATABASE_INFORMATION', '数据库信息');
  define('DATABASE_OPTIONAL_INFORMATION', '数据库 - 可选设置');
  define('DATABASE_OPTIONAL_INSTRUCTION', '建议不要改动这些设置，除非您确实需要。');
  define('DATABASE_TYPE', '数据库类型');
  define('DATABASE_TYPE_INSTRUCTION', '选择使用的数据库类型。');
  define('DATABASE_CHARSET', '数据库字符集');
  define('DATABASE_CHARSET_INSTRUCTION', '选择数据库字符集。');
  define('DATABASE_HOST', '数据库主机');
  define('DATABASE_HOST_INSTRUCTION', '数据库的主机是什么？数据库主机的格式可以是主机名字，例如 \'db1.myserver.com\', 或者是IP地址，例如 \'192.168.0.1\'.');
  define('DATABASE_USERNAME', '数据库用户名');
  define('DATABASE_USERNAME_INSTRUCTION', '用于连接数据库的用户名是什么？例如 \'root\'.');
  define('DATABASE_PASSWORD', '数据库密码');
  define('DATABASE_PASSWORD_INSTRUCTION', '用于连接数据库的密码是什么？');
  define('DATABASE_NAME', '数据库名');
  define('DATABASE_NAME_INSTRUCTION', '您的数据库名是什么？例如\'zencart\'或\'myaccount_zencart\'。');
  define('DATABASE_PREFIX', '商店标识符 (数据表前缀)');
  define('DATABASE_PREFIX_INSTRUCTION', '您希望使用的数据库表前缀是什么？例如：zen_  如果不要表前缀，就留空。<br />通过使用表前缀，使多个商店共用同一个数据库。');
  define('DATABASE_CREATE', '建立数据库？');
  define('DATABASE_CREATE_INSTRUCTION', '您希望Zen Cart中文版创建该数据库吗？');
  define('DATABASE_CONNECTION', '永久链接');
  define('DATABASE_CONNECTION_INSTRUCTION', '您希望数据库使用永久链接吗？如果不知道的话，选 \'否\'。');
  define('DATABASE_SESSION', '数据库Sessions');
  define('DATABASE_SESSION_INSTRUCTION', '您希望在数据库中保存sessions吗？如果您不知道的话，选 \'是\'。');
  define('CACHE_TYPE', 'SQL 缓存方式');
  define('CACHE_TYPE_INSTRUCTION', '选择使用SQL缓存的方式。');
  define('SQL_CACHE', 'Session/SQL缓存目录');
  define('SQL_CACHE_INSTRUCTION', '基于文件的缓存目录。');
  define('ONLY_UPDATE_CONFIG_FILES','仅升级配置文件');


  define('REASON_TABLE_ALREADY_EXISTS','无法建立表%s，已存在');
  define('REASON_TABLE_DOESNT_EXIST','无法删除表%s，不存在。');
  define('REASON_CONFIG_KEY_ALREADY_EXISTS','无法插入配置值 "%s" ，已存在');
  define('REASON_COLUMN_ALREADY_EXISTS','无法加入栏%s，已存在');
  define('REASON_COLUMN_DOESNT_EXIST_TO_DROP','无法删除栏%s，不存在');
  define('REASON_COLUMN_DOESNT_EXIST_TO_CHANGE','无法修改栏%s，不存在');
  define('REASON_PRODUCT_TYPE_LAYOUT_KEY_ALREADY_EXISTS','无法插入prod-type-layout配置值 "%s" ，已存在');
  define('REASON_INDEX_DOESNT_EXIST_TO_DROP','无法删除所有%s于表%s，不存在');
  define('REASON_PRIMARY_KEY_DOESNT_EXIST_TO_DROP','无法删除表%s的主键，不存在');
  define('REASON_INDEX_ALREADY_EXISTS','无法加入索引%s于表%s，已存在');
  define('REASON_PRIMARY_KEY_ALREADY_EXISTS','无法加入主键于表%s，主键已存在');
  define('REASON_NO_PRIVILEGES','用户 %s@%s 没有数据库的%s权限。');

