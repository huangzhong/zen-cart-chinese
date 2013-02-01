#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.8 to v1.3.9
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2010 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_138_to_139.sql 18235 2010-11-23 22:41:05Z drbyte $
#

############ IMPORTANT INSTRUCTIONS ###############
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

# Set store to Down-For-Maintenance mode.  Must reset manually via admin after upgrade is done.
UPDATE configuration set configuration_value = 'true' where configuration_key = 'DOWN_FOR_MAINTENANCE';

# add switch for new split-tax functionality
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', '1', '22', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

# Clear out active customer sessions
TRUNCATE TABLE whos_online;
TRUNCATE TABLE db_cache;
TRUNCATE TABLE sessions;

# garbage collection for old paypal sessions:
DELETE FROM paypal_session WHERE expiry < unix_timestamp();

UPDATE banners set banners_url = 'http://www.zen-cart.com/partners/payment' where banners_url = 'http://www.zen-cart.com/index.php?main_page=infopages&pages_id=30';
DELETE from banners where banners_url like'%sashbox%';

## Country ISO changes:
DELETE FROM countries where countries_iso_code_2 = 'FX' or countries_iso_code_3 = 'FXX';
DELETE FROM countries where countries_iso_code_2 = 'ZR' or countries_iso_code_3 = 'ZAR';
UPDATE countries SET countries_name = 'Serbia', countries_iso_code_2 = 'RS', countries_iso_code_3 = 'SRB' where countries_iso_code_3 = 'YUG';
UPDATE countries SET countries_name = 'Timor-Leste', countries_iso_code_2 = 'TL', countries_iso_code_3 = 'TLS' where countries_iso_code_3 = 'TMP';
UPDATE countries SET countries_name = 'Moldova' where countries_iso_code_3 = 'MDA';
UPDATE countries SET countries_name = 'Macao' where countries_iso_code_3 = 'MAC';
UPDATE countries SET countries_iso_code_3 = 'ROU' where countries_iso_code_3 = 'ROM';

# security data cleanup
update orders set cc_cvv = '' where cc_cvv != '' and orders_status != 1;

# force USPS module into production mode if not already
UPDATE configuration SET configuration_value = 'production' where configuration_key = 'MODULE_SHIPPING_USPS_SERVER';

ALTER TABLE authorizenet CHANGE transaction_id transaction_id bigint(20) default NULL;
ALTER TABLE paypal CHANGE COLUMN notify_version notify_version varchar(6) NOT NULL default '';

ALTER TABLE orders_products ADD INDEX idx_prod_id_orders_id_zen (products_id,orders_id);
ALTER TABLE orders ADD INDEX idx_cust_id_orders_id_zen (customers_id,orders_id);

# fix counter_history race condition
#NEXT_X_ROWS_AS_ONE_COMMAND:5
CREATE TABLE counter_history_clean as 
SELECT * FROM counter_history WHERE 1 GROUP BY startdate;
DROP TABLE counter_history;
RENAME TABLE counter_history_clean 
TO counter_history;

ALTER TABLE counter_history ADD PRIMARY KEY(startdate);

#cleanup damaged media-manager content
delete from media_to_products where media_id not in (
SELECT media_id
FROM media_manager);
delete from media_clips where media_id not in (
SELECT media_id
FROM media_manager);

#Clean up rogue content
DELETE from record_company_info where record_company_id in (
SELECT record_company_id 
FROM record_company where record_company_image like '%.php');
DELETE FROM record_company where record_company_image like '%.php';

 
#############

#### VERSION UPDATE STATEMENTS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.9h', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.8->1.3.9h', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.9h', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.8->1.3.9h', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';

#####  END OF UPGRADE SCRIPT
