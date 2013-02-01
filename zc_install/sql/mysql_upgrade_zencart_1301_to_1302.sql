#
# * This SQL script upgrades the core Zen Cart database structure from v1.3.0.1 to v1.3.0.2
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2006 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_1301_to_1302.sql 6267 2007-04-27 05:52:46Z drbyte $
#

## CONFIGURATION TABLE
#inserts for those who did an upgrade from 1.2.x to 1.3.0 and thus didn't get the insert:
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('上传前缀', 'UPLOAD_PREFIX', 'upload_', '用于区分上传选项和其他选项的前缀', 0, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('文字前缀', 'TEXT_PREFIX', 'txt_', '用于区分文字选项值和其他选项值的前缀', 0, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('生成的元标签描述文字的长度', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', '设置生成的元标签的描述字段的文字长度，缺省为50 ', '18', '71', '', '', now());
#tidy sort order for consistency between upgrades and fresh installs
UPDATE configuration SET sort_order=115 WHERE configuration_key = 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP';

#table alterations fixed in 1.3.5 but best completed here also for upgraders:
ALTER TABLE query_builder CHANGE COLUMN query_category query_category varchar(40) NOT NULL default '';
ALTER TABLE query_builder CHANGE COLUMN query_name query_name varchar(80) NOT NULL default '';
ALTER TABLE query_builder CHANGE COLUMN query_description query_description TEXT NOT NULL;
ALTER TABLE query_builder CHANGE COLUMN query_string query_string TEXT NOT NULL;
ALTER TABLE query_builder CHANGE COLUMN query_keys_list query_keys_list TEXT NOT NULL;


# add ability to send newsletters to self
REPLACE INTO query_builder ( query_category , query_name , query_description , query_string, query_keys_list) VALUES ('email,newsletters', '管理员', '仅当前管理员的电子邮件', 'select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('省份 - 总是显示下拉菜单？', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', '省份总是显示为下拉菜单吗？', 5, '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());



#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.0.2', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.0.1->1.3.0.2', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.0.2', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.3.0.1->1.3.0.2', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT

