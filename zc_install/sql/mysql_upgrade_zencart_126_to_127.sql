# This SQL script upgrades the core Zen Cart database structure from v1.2.6 to v1.2.7
#
# $Id: mysql_upgrade_zencart_126_to_127.sql 4243 2006-08-24 10:55:28Z drbyte $
#


## CONFIGURATION TABLE
UPDATE configuration SET configuration_description = '显示购物车<br />0= 总是<br />1= 有商品的时候<br />2= 有商品的时候，但查看购物车时不显示' where configuration_key = 'SHOW_SHOPPING_CART_BOX_STATUS';
UPDATE configuration SET configuration_description = '自动显示是否有Zen Cart新版本。打开该选项有时会降低管理页面打开时间。(显示于登录后的主索引页面和服务器信息页面)' where configuration_key = 'SHOW_VERSION_UPDATE_IN_HEADER';



#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='2.7', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.2.6->1.2.7', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='2.7', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.2.6->1.2.7', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT