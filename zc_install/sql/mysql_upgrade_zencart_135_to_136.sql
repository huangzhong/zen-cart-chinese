#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.5 to v1.3.6
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2006 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_135_to_136.sql 4795 2006-10-20 17:46:58Z ajeh $
#

## CONFIGURATION TABLE
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义Page-Not-Found的状态', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', '打开定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('货币兑换比率', 'CURRENCY_UPLIFT_RATIO', '1.05', '自动更新汇率时，需要使用的"额外"比率是多少？<br />例如: 从汇率服务器更新银行汇率后，您要在银行汇率基础上增加多少比例来设置给客户的汇率？<br /><br /><strong>缺省: 1.05 </strong><br />将公布的银行汇率乘以1.05作为商店的汇率。', 1, 55, NULL, now(), NULL, NULL);

UPDATE configuration SET sort_order = '19' where configuration_key = 'SHOW_COUNTS_ADMIN';
UPDATE configuration SET configuration_description = '设置发送邮件的方式。<br /><strong>PHP</strong>为缺省方式，采用内置的PHP处理方式。<br />采用Windows和MacOS的服务器要修改该设置为<strong>SMTP</strong>。<br /><br /><strong>SMTPAUTH</strong>仅在服务器要求SMTP验证时使用，同时要设置SMTPAUTH的相应参数。<br /><br /><strong>sendmail</strong>用于linux/unix主机，使用主机上的sendmail程序<br /><strong>"sendmail-f"</strong>仅当服务器要求 -f 参数发送邮件，这个安全措施可以防止欺骗，但如果邮件服务器未设置使用该选项，会出错。<br /><br /><strong>Qmail</strong>用于linux/unix主机的Qmail邮件功能 /var/qmail/bin/sendmail', set_function = 'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),' where configuration_key = 'EMAIL_TRANSPORT';
UPDATE configuration SET configuration_group_id = '6' where configuration_key = 'ENTRY_EMAIL_ADDRESS_CHECK';
UPDATE configuration SET configuration_title = '显示添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)', configuration_description = '要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong>关闭多个商品数量方框状态使用选项2' WHERE configuration_key= 'PRODUCT_LIST_PRICE_BUY_NOW';
UPDATE configuration SET configuration_title = '分类导航条的位置' WHERE configuration_key= 'PRODUCT_INFO_CATEGORIES';
UPDATE configuration SET set_function='zen_cfg_pull_down_htmleditors(' WHERE configuration_key='HTML_EDITOR_PREFERENCE';

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('含子分类的分类图像宽度', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', '含子分类的分类图像宽度', '4', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('含子分类的分类图像高度', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', '含子分类的分类图像高度', '4', '16', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示新进商品', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', '在空购物车页面显示新进商品<br />0= 否或设置显示顺序', '9', '30', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示推荐商品', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', '在空购物车页面显示推荐商品<br />0= 否或设置显示顺序', '9', '31', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示特价商品', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', '在空购物车页面显示特价商品<br />0= 否或设置显示顺序', '9', '32', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示预售商品', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', '在空购物车页面显示预售商品<br />0= 否或设置显示顺序', '9', '33', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('导航显示子分类', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', '经由总分类导航时显示子分类<br /><br />0= 否<br />1= 是', '8', '60', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('屏蔽预售商品', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', '要在边框和中框的新进商品列表中屏蔽预售商品吗?<br />0= 否<br />1= 是', '21', '30', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('元标签 - 标题含商品型号', 'META_TAG_INCLUDE_MODEL', '1', '在Meta标签标题中包含商品型号吗?<br /><br />0= 否 1= 是', '18', '69', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

#
# Updating table get_terms_to_filter
ALTER TABLE get_terms_to_filter ADD get_term_table varchar(64) NOT NULL;
ALTER TABLE get_terms_to_filter ADD get_term_name_field varchar(64) NOT NULL;
UPDATE get_terms_to_filter SET get_term_table = 'TABLE_MANUFACTURERS', get_term_name_field = 'manufacturers_name' where get_term_name = 'manufacturers_id';
UPDATE get_terms_to_filter SET get_term_table = 'TABLE_MUSIC_GENRE', get_term_name_field = 'music_genre_name' where get_term_name = 'music_genre_id';
UPDATE get_terms_to_filter SET get_term_table = 'TABLE_RECORD_COMPANY', get_term_name_field = 'record_company_name' where get_term_name = 'record_company_id';

# Updating coupon-related tables
ALTER TABLE coupons ADD coupon_zone_restriction INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE coupons CHANGE coupon_minimum_order coupon_minimum_order DECIMAL( 15, 4 ) NOT NULL DEFAULT '0.0000';
ALTER TABLE coupons CHANGE coupon_amount coupon_amount DECIMAL( 15, 4 ) NOT NULL DEFAULT '0.0000';
ALTER TABLE coupon_gv_customer CHANGE amount amount DECIMAL( 15, 4 ) NOT NULL DEFAULT '0.0000';
ALTER TABLE coupon_gv_queue CHANGE amount amount DECIMAL( 15, 4 ) NOT NULL DEFAULT '0.0000';

# Removing auto-increment from these tables
ALTER TABLE meta_tags_categories_description CHANGE COLUMN categories_id  categories_id int(11) NOT NULL;
ALTER TABLE meta_tags_products_description CHANGE COLUMN products_id  products_id int(11) NOT NULL;


################################################################


#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.6', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.5->1.3.6', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.6', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.5->1.3.6', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT
