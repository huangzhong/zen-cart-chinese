#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.6 to v1.3.7
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2006 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_136_to_137.sql 5618 2007-01-19 00:15:46Z ajeh $
#

############ IMPORTANT INSTRUCTIONS ###############
#
# * Zen Cart uses the zc_install/index.php program to do database upgrades
# * This SQL script is intended to be used by running zc_install
# * It is *not* recommended to simply run these statements manually via any other means
# * ie: not via phpMyAdmin or via the Install SQL Patch tool in Zen Cart admin
# * The zc_install program catches possible problems and also handles table-prefixes automatically
# *
# * To use the zc_install program to do your database upgrade:
# * a. Upload the NEWEST zc_install folder to your server
# * b. Surf to zc_install/index.php via your browser
# * c. On the System Inspection page, scroll to the bottom and click on Database Upgrade
# *    NOTE: do NOT click on the "Install" button, because that will erase your database.
# * d. On the Database Upgrade screen, you'll be presented with a list of checkboxes for
# *    various Zen Cart versions, with the recommended upgrades already pre-selected.
# * e. Verify the checkboxes, then scroll down and enter your Zen Cart Admin username
# *    and password, and then click on the Upgrade button.
# * f. If any errors occur, you will be notified.  Some warnings can be ignored.
# * g. When done, you'll be taken to the Finished page.
#
#####################################################


## CONFIGURATION TABLE
UPDATE configuration set configuration_description = '导航条状态?<br />0= 关<br />1= 开<br />2= 仅不显示在首页' WHERE configuration_key = 'DEFINE_BREADCRUMB_STATUS';
UPDATE configuration set configuration_description = '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称' WHERE configuration_key = 'CATEGORIES_PRODUCTS_SORT_ORDER';
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分开登录页面', 'USE_SPLIT_LOGIN_MODE', 'False', '登录页面有两种显示模式: 分页模式 或 同页模式<br />分页模式，点击按钮后进入注册页面。同页模式，注册页面显示在登录之下。<br />缺省: False', '19', '121', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());

## PP EC
ALTER TABLE customers ADD customers_paypal_payerid VARCHAR(20) NOT NULL default '' AFTER customers_referral;
ALTER TABLE customers ADD customers_paypal_ec TINYINT(1) UNSIGNED DEFAULT 0 NOT NULL AFTER customers_paypal_payerid;
ALTER TABLE paypal CHANGE txn_type txn_type varchar(32) NOT NULL default '';
ALTER TABLE paypal CHANGE payment_type payment_type varchar(40) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE txn_type txn_type varchar(32) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE payment_type payment_type varchar(40) NOT NULL default '';
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡状态 - SOLO', 'CC_ENABLED_SOLO', '0', '接受SOLO 0= 否 1= 是', '17', '8', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡状态 - Switch', 'CC_ENABLED_SWITCH', '0', '接受SWITCH 0= 否 1= 是', '17', '9', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡状态 - Maestro', 'CC_ENABLED_MAESTRO', '0', '接受MAESTRO 0= 否 1= 是', '17', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

#this one was missed in the 1.3.6 fresh-installs (was okay for upgrades):
# it will likely trigger a warning because upgrades to 1.3.6 will already have this.
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义Page-Not-Found的状态', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', '打开定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');


#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.7', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.6->1.3.7', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.7', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.6->1.3.7', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT
