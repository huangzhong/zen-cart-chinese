<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: database_upgrade.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 数据库升级');
  define('UPDATE_DATABASE_NOW','升级数据库');//this comes before TEXT_MAIN
  define('TEXT_MAIN', '<em>警告: </em> 该脚本仅用于升级下面列出的Zen Cart&trade;版本的数据库。' .
                      '<span class="emphasis"><strong>强烈建议 升级数据库前备份您的数据！</strong></span>');
  define('TEXT_MAIN_2','<span class="emphasis">请仔细检查下面的内容</span>. 该内容来自您的configure.php文件中的设置。<br />' .
                      '确认内容正确后，再继续，否则也许会损坏数据库。');

  define('DATABASE_INFORMATION', '数据库信息');
  define('DATABASE_TYPE', '数据库类型');
  define('DATABASE_HOST', '数据库主机');
  define('DATABASE_USERNAME', '数据库用户名');
  define('DATABASE_PASSWORD', '数据库密码');
  define('DATABASE_NAME', '数据库名');
  define('DATABASE_PREFIX', '数据库表前缀');
  define('DATABASE_PRIVILEGES', '数据库权限');

  define('SNIFFER_PREDICTS','<em>升级</em> 检测: ');
  define('CHOOSE_UPGRADES','请确认您的升级步骤');
  define('TITLE_DATABASE_PREFIX_CHANGE','修改数据库表前缀');
  define('ERROR_PREFIX_CHANGE_NEEDED','<span class="errors">数据库中没有找到Zen Cart&trade;表。<br />也许您输入的数据库表前缀不对?</span><br />如果修改表前缀还不解决问题，需要手工比较数据库和configure.php文件的设置，可以通过phpMyAdmin或网站服务器的控制面板进行。');
  define('TEXT_DATABASE_PREFIX_CHANGE','如果要修改数据库表前缀，在下面输入新的前缀。 <span class="emphasis">提示: 请确保数据库中未使用该表前缀</span>, 我们不检查该部分。如果使用已有的表前缀，会损坏您的数据库。');
  define('TEXT_DATABASE_PREFIX_CHANGE_WARNING','<span class="errors"><strong>警告： 在修改表前缀前，一定要备份数据库。如果处理过程中出错，您需要从备份中恢复数据库。如果您没有把握，那么就不要修改数据表。</strong></span>');
  define('DATABASE_OLD_PREFIX','原来的表前缀');
  define('DATABASE_OLD_PREFIX_INSTRUCTION','输入原来的表前缀');
  define('ENTRY_NEW_PREFIX','新的表前缀');
  define('DATABASE_NEW_PREFIX_INSTRUCTION','输入新的表前缀');
  define('ENTRY_ADMIN_ID','管理员用户名(Zen Cart中文版的管理页面)');
  define('ENTRY_ADMIN_PASSWORD','密码');
  define('ADMIN_PASSSWORD_INSTRUCTION','请输入管理员用户名/密码(商店管理页面)，用于修改数据库。<em>(不是MySQL密码)</em>');
  define('TITLE_SECURITY','数据库安全');

  define('UPDATE_DATABASE_WARNING_DO_NOT_INTERRUPT','<span class="emphasis">点击升级后， --> 不要中断操作 <--   请耐心等待升级。</span>');
  define('SKIP_UPDATES','升级完成');


  define('REASON_TABLE_ALREADY_EXISTS','无法建立表%s，已存在');
  define('REASON_TABLE_DOESNT_EXIST','无法删除表%s，不存在');
  define('REASON_TABLE_NOT_FOUND', '无法修改或插入/更新表%s，不存在');
  define('REASON_CONFIG_KEY_ALREADY_EXISTS','无法插入配置值"%s" ，已存在');
  define('REASON_COLUMN_ALREADY_EXISTS','无法加入栏%s，已存在');
  define('REASON_COLUMN_DOESNT_EXIST_TO_DROP','无法删除栏%s，已存在');
  define('REASON_COLUMN_DOESNT_EXIST_TO_CHANGE','无法修改栏%s，不存在');
  define('REASON_PRODUCT_TYPE_LAYOUT_KEY_ALREADY_EXISTS','无法插入prod-type-layout配置值"%s" ，已存在');
  define('REASON_INDEX_DOESNT_EXIST_TO_DROP','无法删除索引%s于表%s，不存在');
  define('REASON_PRIMARY_KEY_DOESNT_EXIST_TO_DROP','无法删除表%s的主键，不存在');
  define('REASON_INDEX_ALREADY_EXISTS','无法加入所有%s于表%s，已存在');
  define('REASON_PRIMARY_KEY_ALREADY_EXISTS','无法加入表%s的主键，主键已存在');
  define('REASON_NO_PRIVILEGES','用户 %s@%s 没有数据库的%s权限');
  define('REASON_CONFIGURATION_GROUP_KEY_ALREADY_EXISTS','无法加入configuration_group_title "%s"，已存在');
  define('REASON_CONFIGURATION_GROUP_ID_ALREADY_EXISTS','无法加入configuration_group_id "%s"，已存在');

