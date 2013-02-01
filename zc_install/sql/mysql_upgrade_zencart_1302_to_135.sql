#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.0.2 to v1.3.5
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2006 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_1302_to_135.sql 6020 2007-03-17 16:32:42Z drbyte $
#

## CONFIGURATION TABLE
UPDATE configuration SET configuration_description = '设置客户缺省电子邮件格式<br />0= 文本<br />1= HTML<br />' WHERE configuration_key = 'ACCOUNT_EMAIL_PREFERENCE';
UPDATE configuration SET configuration_description = '在购物车上显示更新购物车按钮，位于:<br /><br />1= 每个数量框后面<br />2= 所有商品下面<br />3= 同时显示在每个数量框后面和所有商品下面' where configuration_key = 'SHOW_SHOPPING_CART_UPDATE';
UPDATE configuration SET configuration_title = '显示商品添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)', configuration_description = '要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong> 关闭多个商品数量方框状态使用选项2' WHERE configuration_key= 'PRODUCT_LIST_PRICE_BUY_NOW';
UPDATE configuration SET configuration_description = '结帐时是否提示客户商品通知<br />0= 不提示<br />1= 提示 (除非已选择全局通知)<br /><br />说明: 边框要另外关闭' WHERE configuration_key = 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS';
UPDATE configuration set configuration_value='false' where configuration_key ='STORE_DB_TRANSACTIONS';
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品列表中显示字母过滤选择', 'PRODUCT_LIST_ALPHA_SORTER', 'false', '在商品列表中显示字母过滤的选择吗?', '8', '50', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示商品列表子分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'false', '在商品列表中显示子分类图像吗?', '8', '52', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示商品列表总分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'false', '在商品列表中显示总分类图像吗?', '8', '53', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

# need to change
# 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES
DELETE from configuration where configuration_key = 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP' and configuration_group_id = 18;

UPDATE product_type_layout SET configuration_description = '在商品页面显示唱片公司 0= 否 1= 是' WHERE configuration_key = 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY';

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('cURL代理服务器状态', 'CURL_PROXY_REQUIRED', 'False', '您的cURL是否使用代理服务器?', '1', '50', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('cURL代理服务器地址', 'CURL_PROXY_SERVER_DETAILS', '', '如果您使用GoDaddy或其他主机，并需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: GoDaddy主机，输入: 64.202.165.130:3128', 1, 51, NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类导航条的名称和图像', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', '商品的分类图像和名称的显示状态<br />0= 总是显示分类名称和图像<br />1= 仅显示分类名称<br />2= 不为空时，显示分类名称和图像', 18, 20, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'总是显示分类名称和图像\'), array(\'id\'=>\'1\', \'text\'=>\'仅显示分类名称\'), array(\'id\'=>\'2\', \'text\'=>\'不为空时，显示分类名称和图像\')),');


#Other
#UPDATE banners SET banners_url='http://www.zen-cart.com/index.php?main_page=infopages&pages_id=30' where banners_url='http://www.zen-cart.com/modules/freecontent/index.php?id=29';
UPDATE query_builder SET query_string = 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC' WHERE query_name = '以往客户(超过三个月) (订阅者)';


################################################################

#table alterations
ALTER TABLE query_builder CHANGE COLUMN query_category query_category varchar(40) NOT NULL default '';
ALTER TABLE query_builder CHANGE COLUMN query_name query_name varchar(80) NOT NULL default '';
ALTER TABLE query_builder CHANGE COLUMN query_description query_description TEXT NOT NULL;
ALTER TABLE query_builder CHANGE COLUMN query_string query_string TEXT NOT NULL;
ALTER TABLE query_builder CHANGE COLUMN query_keys_list query_keys_list TEXT NOT NULL;


#Index Optimizations
ALTER TABLE layout_boxes ADD INDEX idx_layout_box_sort_order_zen (layout_box_sort_order);
ALTER TABLE media_clips ADD INDEX idx_clip_type_zen (clip_type);
ALTER TABLE media_manager ADD INDEX idx_media_name_zen (media_name);
ALTER TABLE media_types ADD INDEX idx_type_name_zen (type_name);
ALTER TABLE products ADD INDEX idx_products_date_available_zen (products_date_available);
ALTER TABLE products ADD INDEX idx_products_ordered_zen (products_ordered);
ALTER TABLE products ADD INDEX idx_products_model_zen (products_model);
ALTER TABLE products ADD INDEX idx_products_price_sorter_zen (products_price_sorter);
ALTER TABLE products ADD INDEX idx_master_categories_id_zen (master_categories_id);
ALTER TABLE products ADD INDEX idx_products_sort_order_zen (products_sort_order);
ALTER TABLE products ADD INDEX idx_manufacturers_id_zen (manufacturers_id);
ALTER TABLE products_attributes ADD INDEX idx_opt_sort_order_zen (products_options_sort_order);
ALTER TABLE products_options ADD INDEX idx_products_options_sort_order_zen (products_options_sort_order);
ALTER TABLE products_options ADD INDEX idx_products_options_name_zen (products_options_name);
ALTER TABLE products_options_values ADD INDEX idx_products_options_values_name_zen (products_options_values_name);
ALTER TABLE products_options_values ADD INDEX idx_products_options_values_sort_order_zen (products_options_values_sort_order);
ALTER TABLE products_options_values_to_products_options ADD INDEX idx_products_options_id_zen (products_options_id);
ALTER TABLE products_options_values_to_products_options ADD INDEX idx_products_options_values_id_zen (products_options_values_id);
ALTER TABLE product_music_extra ADD INDEX idx_artists_id_zen (artists_id);
ALTER TABLE product_music_extra ADD INDEX idx_record_company_id_zen (record_company_id);

ALTER TABLE admin ADD INDEX idx_admin_email_zen (admin_email);
ALTER TABLE banners ADD INDEX idx_expires_date_zen (expires_date);
ALTER TABLE banners ADD INDEX idx_date_scheduled_zen (date_scheduled);
ALTER TABLE featured ADD INDEX idx_expires_date_zen (expires_date);
ALTER TABLE specials ADD INDEX idx_expires_date_zen (expires_date);
ALTER TABLE orders ADD INDEX idx_date_purchased_zen (date_purchased);

ALTER TABLE countries ADD INDEX idx_address_format_id_zen (address_format_id);
ALTER TABLE countries ADD INDEX idx_iso_2_zen (countries_iso_code_2);
ALTER TABLE countries ADD INDEX idx_iso_3_zen (countries_iso_code_3);
ALTER TABLE zones ADD INDEX idx_zone_country_id_zen (zone_country_id);
ALTER TABLE zones ADD INDEX idx_zone_code_zen (zone_code);
ALTER TABLE zones_to_geo_zones ADD INDEX idx_zones_zen (geo_zone_id, zone_country_id, zone_id);

ALTER TABLE product_type_layout ADD INDEX idx_type_id_sort_order_zen (product_type_id, sort_order) ;

ALTER TABLE reviews ADD INDEX idx_status_zen (status);
ALTER TABLE reviews ADD INDEX idx_date_added_zen (date_added);

ALTER TABLE salemaker_sales ADD INDEX idx_sale_date_start_zen (sale_date_start);
ALTER TABLE salemaker_sales ADD INDEX idx_sale_date_end_zen (sale_date_end);

#
ALTER TABLE authorizenet ADD PRIMARY KEY (id );
ALTER TABLE authorizenet DROP INDEX idx_auth_net_id;


#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.5', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.0.2->1.3.5', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.5', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.0.2->1.3.5', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT

