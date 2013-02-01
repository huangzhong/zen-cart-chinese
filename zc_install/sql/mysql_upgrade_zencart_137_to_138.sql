#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.7 to v1.3.8
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2007 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_137_to_138.sql 15140 2009-12-31 04:17:24Z drbyte $
#

################### 重要说明 ######################
#
# * Zen Cart 通过 zc_install/index.php 程序来升级数据库
# * 本SQL脚步仅用于从 zc_install 下执行
# * * 不 * 建议通过其它工具执行
# * 例如: 不要用 phpMyAdmin 或 Zen Cart 管理页面的 SQL 脚本工具执行
# * zc_install 程序会检测到可能的问题/错误，并自动处理表前缀
# *
# * 使用 zc_install 程序升级数据库:
# * a. 上传最新的 zc_install 目录到服务器
# * b. 通过浏览器打开 zc_install/index.php
# * c. 在系统检测页面的最下面，点击升级数据库
# *    说明: 不要点击 "安装" 按钮，否则将清空您的数据库。
# * d. 在数据库升级页面，有不同 Zen Cart 版本的选项，
# *    推荐的升级选项已选中。
# * e. 核对选项后，输入 Zen Cart 的管理员用户名和密码，
# *    然后点击升级按钮。
# * f. 如果有错误，将显示，一些警告信息可以跳过。
# * g. 结束后，将转到安装完成页面。
#
#####################################################

#Change Canada's code for Newfoundland from NF to NL, according to 2002 ISO standards change.
UPDATE zones SET zone_code = 'NL' where zone_country_id = 38 and zone_name = 'Newfoundland';


## CONFIGURATION TABLE
UPDATE configuration set configuration_description = '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称' WHERE configuration_key = 'CATEGORIES_PRODUCTS_SORT_ORDER';
UPDATE configuration set set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ' where configuration_key = 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS';
UPDATE configuration set configuration_description = '新进商品列表数量' WHERE configuration_key='MAX_DISPLAY_PRODUCTS_NEW';

UPDATE configuration set configuration_description = '如果您使用GoDaddy或其他主机，并需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: GoDaddy主机，输入: <strong>proxy.shr.secureserver.net:3128</strong> 或 64.202.165.130:3128' WHERE configuration_key='CURL_PROXY_SERVER_DETAILS';
UPDATE configuration set configuration_description = '您的邮件服务器是否要求所有发出的邮件的发送地址为服务器主机上的一个域名？<br /><br />该设置通常用于防止欺骗和垃圾邮件。如果设置为Yes，所有邮件的发送地址为上面设置的发件人邮件地址。' where configuration_key = 'EMAIL_SEND_MUST_BE_STORE';
UPDATE configuration set use_function = 'zen_cfg_password_display' where configuration_key = 'EMAIL_SMTPAUTH_PASSWORD';

UPDATE configuration set configuration_value = 150, configuration_description = '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', set_function = '' WHERE configuration_key = 'PRODUCT_NEW_LIST_DESCRIPTION';
UPDATE configuration set configuration_value = 150, configuration_description = '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', set_function = '' WHERE configuration_key = 'PRODUCT_FEATURED_LIST_DESCRIPTION';
UPDATE configuration set configuration_value = 150, configuration_description = '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', set_function = '' WHERE configuration_key = 'PRODUCT_ALL_LIST_DESCRIPTION';

#UPDATE TO NEW RANDOMIZATION ON SIDEBOXES TO ALLOW MORE THAN ONE
UPDATE configuration set configuration_value = '1', configuration_title = '边框中随机商品评论数量', configuration_description = '在边框中显示的随机商品评论的数量<br /><br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?' WHERE configuration_key='MAX_RANDOM_SELECT_REVIEWS';
UPDATE configuration set configuration_value = '1', configuration_title = '边框中随机新进商品数量', configuration_description = '在边框中显示的随机新进商品的数量<br /><br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?' WHERE configuration_key='MAX_RANDOM_SELECT_NEW';
UPDATE configuration set configuration_value = '1', configuration_title = '边框中随机特价商品数量', configuration_description = '在边框中显示的随机特价商品的数量<br /><br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?' WHERE configuration_key='MAX_RANDOM_SELECT_SPECIALS';
UPDATE configuration set configuration_value = '1', configuration_title = '边框中随机推荐商品数量', configuration_description = '在边框中显示的随机推荐商品的数量<br /><br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?' WHERE configuration_key='MAX_RANDOM_SELECT_FEATURED_PRODUCTS';

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('登录时提醒合并购物车', 'SHOW_SHOPPING_CART_COMBINED', '1', '客户登录时，如果以前购物车中有商品，将于现有购物车中的商品合并。<br /><br />要提醒客户吗?<br /><br />0= OFF, 不提醒<br />1= Yes 提醒并转到购物车页面<br />2= Yes 提醒，但不转到购物车页面', '9', '35', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('在发票管理中显示订单说明', 'ORDER_COMMENTS_INVOICE', '1', '在发票管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '25', now(), NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('在装箱单管理中显示订单说明', 'ORDER_COMMENTS_PACKING_SLIP', '1', '在装箱单管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '26', now(), NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');

#已注册但从未购物的客户
INSERT INTO query_builder (query_category, query_name, query_description, query_string, query_keys_list) VALUES ('email,newsletters', '从未购物的客户', '发给已注册但从未购物的客户', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

#admin
ALTER TABLE admin_activity_log CHANGE page_parameters page_parameters text;


#Allow for viewing
ALTER TABLE orders_products_attributes CHANGE products_options_values products_options_values text NOT NULL;

## PP EC table structure fixes ... needed longer fields in several cases for storing archive data and keep structures in sync
ALTER TABLE paypal CHANGE txn_type txn_type varchar(40) NOT NULL default '';
ALTER TABLE paypal CHANGE reason_code reason_code varchar(40) default NULL;
ALTER TABLE paypal CHANGE payment_type payment_type varchar(40) NOT NULL default '';
ALTER TABLE paypal CHANGE payment_status payment_status varchar(32) NOT NULL default '';
ALTER TABLE paypal CHANGE pending_reason pending_reason varchar(32) default NULL;
ALTER TABLE paypal CHANGE invoice invoice varchar(128) default NULL;
ALTER TABLE paypal CHANGE payer_business_name payer_business_name varchar(128) default NULL;
ALTER TABLE paypal CHANGE address_name address_name varchar(64) default NULL;
ALTER TABLE paypal CHANGE address_street address_street varchar(254) default NULL;
ALTER TABLE paypal CHANGE address_city address_city varchar(120) default NULL;
ALTER TABLE paypal CHANGE address_state address_state varchar(120) default NULL;
ALTER TABLE paypal CHANGE payer_email payer_email varchar(128) NOT NULL default '';
ALTER TABLE paypal CHANGE business business varchar(128) NOT NULL default '';
ALTER TABLE paypal CHANGE receiver_email receiver_email varchar(128) NOT NULL default '';
ALTER TABLE paypal CHANGE txn_id txn_id varchar(20) NOT NULL default '';
ALTER TABLE paypal CHANGE parent_txn_id parent_txn_id varchar(20) default NULL;
ALTER TABLE paypal ADD COLUMN module_name varchar(40) NOT NULL default '' after txn_type;
ALTER TABLE paypal ADD COLUMN module_mode varchar(40) NOT NULL default '' after module_name;

ALTER TABLE paypal_testing CHANGE txn_type txn_type varchar(40) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE reason_code reason_code varchar(40) default NULL;
ALTER TABLE paypal_testing CHANGE payment_type payment_type varchar(40) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE payment_status payment_status varchar(32) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE pending_reason pending_reason varchar(32) default NULL;
ALTER TABLE paypal_testing CHANGE invoice invoice varchar(128) default NULL;
ALTER TABLE paypal_testing CHANGE payer_business_name payer_business_name varchar(128) default NULL;
ALTER TABLE paypal_testing CHANGE address_name address_name varchar(64) default NULL;
ALTER TABLE paypal_testing CHANGE address_street address_street varchar(254) default NULL;
ALTER TABLE paypal_testing CHANGE address_city address_city varchar(120) default NULL;
ALTER TABLE paypal_testing CHANGE address_state address_state varchar(120) default NULL;
ALTER TABLE paypal_testing CHANGE payer_email payer_email varchar(128) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE business business varchar(128) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE receiver_email receiver_email varchar(128) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE txn_id txn_id varchar(20) NOT NULL default '';
ALTER TABLE paypal_testing CHANGE parent_txn_id parent_txn_id varchar(20) default NULL;
ALTER TABLE paypal_testing ADD COLUMN module_name varchar(40) NOT NULL default '' after txn_type;
ALTER TABLE paypal_testing ADD COLUMN module_mode varchar(40) NOT NULL default '' after module_name;

ALTER TABLE paypal_session CHANGE saved_session saved_session mediumblob NOT NULL;

# Change TEXT field to varchar(50) since TEXT was a waste of space
ALTER TABLE authorizenet CHANGE authorization_type authorization_type varchar(50) NOT NULL default '';

# change cache tracking size
TRUNCATE TABLE db_cache;
ALTER TABLE db_cache CHANGE cache_data cache_data mediumblob;
TRUNCATE TABLE sessions;
ALTER TABLE sessions CHANGE value value mediumblob NOT NULL;

#support longer ezpages content
ALTER TABLE ezpages CHANGE pages_html_text pages_html_text mediumtext;

#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.8', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.7->1.3.8', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.8', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.7->1.3.8', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';



### LEFT FOR END IN CASE ERRORS ARE ENCOUNTERED:
#rename zen_order_id field to order_id to minimize confusion for folks who decide to manually edit their databases
ALTER TABLE paypal CHANGE COLUMN zen_order_id order_id int(11) NOT NULL default '0';
ALTER TABLE paypal_testing CHANGE COLUMN zen_order_id order_id int(11) NOT NULL default '0';
ALTER TABLE linkpoint_api CHANGE COLUMN zen_order_id order_id int(11) NOT NULL default '0';



#####  END OF UPGRADE SCRIPT
