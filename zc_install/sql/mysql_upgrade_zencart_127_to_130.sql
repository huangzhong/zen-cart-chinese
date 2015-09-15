#
# * This SQL script upgrades the core Zen Cart database structure from v1.2.7 to v1.3.0
# *
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2006 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version $Id: mysql_upgrade_zencart_127_to_130.sql 18849 2011-06-04 17:22:11Z drbyte $
#

## CONFIGURATION TABLE

#new keys
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('导航条状态', 'DEFINE_BREADCRUMB_STATUS', '1', '是否显示导航条链接<br />0= 关闭<br />1= 打开', 19, 4, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('传真号码', 'ACCOUNT_FAX_NUMBER', 'true', '创建帐号时显示传真号码字段', '5', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('顾客欢迎词 - 显示在首页', 'SHOW_CUSTOMER_GREETING', '1', '在首页上显示顾客欢迎词<br />0= 否<br />1= 是', 19, 40, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('跳过单个商品的分类', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', '跳过单个商品的分类<br />如果设置为True，客户点击单个商品的分类时，Zen Cart将直接显示商品页面。<br />缺省: True', '19', '120', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分块下载', 'DOWNLOAD_IN_CHUNKS', 'false', '如果关闭重定向下载，而您的PHP内存限制的设置低于8 MB，您可能需要打开该选项，使文件分块发送到浏览器。<br /><br />重定向下载打开时没有作用。', '13', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('CSS按钮', 'IMAGE_USE_CSS_BUTTONS', 'No', 'CSS按钮<br />使用CSS按钮替代图像(GIF/JPG)<br />按钮格式在stylesheet文件中定义。', '19', '147', 'zen_cfg_select_option(array(\'No\', \'Yes\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('语言选择', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', '商店缺省的语言选择为商店的设置，还是用户浏览器中的设置？<br /><br />Default: 商店的缺省设置', '1', '11', 'zen_cfg_select_option(array(\'Default\', \'Browser\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('网站地图 - 是否包含我的帐号链接', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', '网站地图上是否显示到我的帐号的链接<br />说明: 搜索引擎会尝试索引该页面，通常不会转向安全页面，因为索引登录页面并无好处。<br /><br />缺省: false', 18, 73, 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function) VALUES ('Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'No', 'Does your mailserver require that all outgoing emails have their "from" address match a known domain that exists on your webserver?<br /><br />This is often set in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the "from" address on all outgoing mail.', 12, 11, NULL, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义优惠券', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', '显示优惠券说明文字吗?<br />0= 否<br />1= 是', '25', '66', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');


#EZ-Pages settings
INSERT INTO configuration_group VALUES (30, '简易页面设置', '简易页面设置', 30, '1');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面显示状态 - 页眉', 'EZPAGES_STATUS_HEADER', '1', '在全局范围打开/关闭页眉显示简易页面<br />0 = 关闭<br />1 = 打开<br />2= 打开 仅限管理员IP，位于网站维护菜单<br />说明: 警告仅对管理员可见', 30, 10, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面显示状态 - 页脚', 'EZPAGES_STATUS_FOOTER', '1', '在全局范围打开/关闭页脚显示简易页面<br />0 = 关闭<br />1 = 打开<br />2= 打开 仅限管理员IP，位于网站维护菜单<br />说明: 警告仅对管理员可见', 30, 11, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面显示状态 - 边框', 'EZPAGES_STATUS_SIDEBOX', '1', '在全局范围打开/关闭边框显示简易页面<br />0 = 关闭<br />1 = 打开<br />2= 打开 仅限管理员IP，位于网站维护菜单<br />说明: 警告仅对管理员可见', 30, 12, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面页眉分隔符', 'EZPAGES_SEPARATOR_HEADER', '&nbsp;::&nbsp;', '简易页面页眉分隔符<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面页脚分隔符', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;::&nbsp;', '简易页面页脚分隔符<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面导航按钮', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', '是否在简易页面上显示导航按钮<br />0=否 (无按钮)<br />1="继续"<br />2="上一页/继续/下一页"<br /><br />缺省设置: 2.', 30, 30, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面目录状态', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', 30, 35, now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示页面的页面', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', '简易页面中不显示商店的页眉的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 1,5,2<br />或留空。', 30, 40, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示页脚的页面', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', '简易页面中不显示商店的页脚的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,7<br />或留空。', 30, 41, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示左栏目的页面', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的左栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 21<br />或留空。', 30, 42, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示右栏目的页面', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的右栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,82,13<br />或留空。', 30, 43, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('简易页面的显示数量', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', '简易页面的显示数量<br />20 = 缺省', 3, 71, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('管理页面显示的PayPal IPN的数量', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', '管理页面显示PayPal IPN的数量<br />缺省为20', 3, 66, now());

#category icons on product _info pages for Previous/Next navigation
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分类图标图像宽度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_WIDTH', '57', '商品信息页面的分类图标的象素宽度', '4', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分类图标图像高度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', '商品信息页面的分类图标的象素高度', '4', '14', now());
#currency conversion in text email
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('在文本格式邮件中转换货币符号', 'CURRENCIES_TRANSLATIONS', '&euro;,€', '文本格式邮件中使用什么货币符号转换？<br />缺省 = &amp;euro;,€', 12, 120, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
#product_listing ascending/descending characters
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品列表升序标记', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', '用什么符合标记升序？<br />缺省 = +', 8, 40, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品列表降序标记', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', '用什么符合标记降序？<br />缺省 = -', 8, 41, NULL, now(), NULL, 'zen_cfg_textarea_small(');

#updates
UPDATE configuration SET configuration_description = 'Zen Cart能够检测不存在的页面并自动调转到索引页面。调试时可关闭该选项。<br /><br /><strong>缺省=On</strong><br />On = 如有不存在的页面，调整到\'index\'<br />Off = 不检测不存在的页面<br />Page Not Found = 显示页面不存在的提示页面', set_function = 'zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),' where configuration_key = 'MISSING_PAGE_CHECK';
UPDATE configuration SET configuration_description = '创建帐号时显示生日字段<br />说明: 生日字段的最小值设置为空时，该字段为可选项<br />生日字段的最小值>0时为必选项' where configuration_key = 'ACCOUNT_DOB';
UPDATE configuration SET configuration_description = '是否在购物车上显示总计<br />0= 否<br />1= 是: 件数 重量 金额<br />2= 是: 件数 重量 金额，重量为零时不显示<br />3= 是: 件数 金额' WHERE configuration_key = 'SHOW_TOTALS_IN_CART';
UPDATE configuration SET configuration_description = '显示购物车<br />0= 总是<br />1= 满的时候<br />2= 满的时候，但查看购物车时不显示' WHERE configuration_key = 'SHOW_SHOPPING_CART_BOX_STATUS';
UPDATE configuration SET configuration_description ='允许访客推荐商品给朋友。<br />如果设置为[false]，推荐给朋友功能需要登录后使用。' where configuration_key = 'ALLOW_GUEST_TO_TELL_A_FRIEND';
UPDATE configuration SET configuration_description = '<br />0= 否<br />1= 在购物车上显示按钮<br />2= 在购物车页面显示列表' WHERE configuration_key ='SHOW_SHIPPING_ESTIMATOR_BUTTON';
UPDATE configuration SET set_function = 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '  WHERE configuration_key ='SHOW_SHIPPING_ESTIMATOR_BUTTON';
UPDATE configuration SET configuration_description = '在购物车上显示，复选框或删除按钮<br /><br />1= 只显示删除按钮<br />2= 只显示复选框<br />3= 同时显示删除按钮和复选框' WHERE configuration_key = 'SHOW_SHOPPING_CART_DELETE';
UPDATE configuration SET configuration_description = '新进商品列表的定义<br />0= 所有商品<br />1= 当前月份<br />7= 7 天<br />14= 14 天<br />30= 30 天<br />60= 60 天<br />90= 90 天<br />120= 120 天' WHERE configuration_key = 'SHOW_NEW_PRODUCTS_LIMIT';
UPDATE configuration SET set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ' WHERE configuration_key = 'SHOW_NEW_PRODUCTS_LIMIT';
UPDATE configuration SET configuration_description = '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格+, 商品名称' WHERE configuration_key = 'CATEGORIES_PRODUCTS_SORT_ORDER';
UPDATE configuration SET set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ' WHERE configuration_key = 'CATEGORIES_PRODUCTS_SORT_ORDER';
UPDATE configuration set set_function='zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ' where configuration_key in ('SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS','SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS','SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS','SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS');

#Define Page Status
UPDATE configuration SET configuration_description = '是否使用首页文字的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_MAIN_PAGE_STATUS';
UPDATE configuration SET configuration_description = '是否使用联系我们的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_CONTACT_US_STATUS';
UPDATE configuration SET configuration_description = '是否使用隐私声明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_PRIVACY_STATUS';
UPDATE configuration SET configuration_description = '是否使用发货付款须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_SHIPPINGINFO_STATUS';
UPDATE configuration SET configuration_description = '是否使用顾客须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_CONDITIONS_STATUS';
UPDATE configuration SET configuration_description = '是否使用成功结帐页的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_CHECKOUT_SUCCESS_STATUS';
UPDATE configuration SET configuration_description = '是否使用优惠券说明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_DISCOUNT_COUPON_STATUS';
UPDATE configuration SET configuration_description = '是否使用网站地图的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_SITE_MAP_STATUS';
UPDATE configuration SET configuration_description = '是否使用页面二的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_PAGE_2_STATUS';
UPDATE configuration SET configuration_description = '是否使用页面三的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_PAGE_3_STATUS';
UPDATE configuration SET configuration_description = '是否使用页面四的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', set_function = 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),' where configuration_key = 'DEFINE_PAGE_4_STATUS';

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('blue_strip', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'ezpages.php', 1, 1, -1, 2, 1);

UPDATE product_type_layout set set_function='zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', configuration_description='What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping' where configuration_key in ('DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING');


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '1', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '2', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '3', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '4', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '5', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

#Attribute Defaults for Product Types
#insert product type layout settings
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品属性仅用于显示<br />仅用于显示<br />0= 否 1= 是', '1', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性免费 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '1', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '1', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '1', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '1', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', '1', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', '商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '1', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '1', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', '音乐属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '2', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性免费 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', '音乐属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '2', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性缺省 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', '音乐属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '2', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性有优惠 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', '音乐属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '2', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '音乐属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '2', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性是必选的 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', '音乐属性是必选的<br />属性是必须的<br />0= 否 1= 是', '2', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', '音乐属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '2', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('音乐属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '音乐属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '2', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', '普通文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '3', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', '普通文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '3', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', '普通文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '3', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', '普通文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '3', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '普通文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '3', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', '普通文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', '3', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', '普通文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '3', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('普通文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '普通文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '3', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '4', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '4', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '4', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '4', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '4', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', '4', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', '商品文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '4', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '4', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', '免运费商品属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '5', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性免费 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', '免运费商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '5', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', '免运费商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '5', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', '免运费商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '5', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '免运费商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '5', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', '免运费商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', '5', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', '免运费商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '5', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('免运费商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '免运费商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '5', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
### eof: attribute default database updates and changes

## Banners Update
UPDATE banners SET banners_url='http://www.sashbox.net/zencart/' where banners_url='http://www.sashbox.net';
DELETE from banners where banners_url='http://www.chainreactionweb.com';

## Change counter_history
ALTER TABLE counter_history CHANGE month startdate CHAR( 8 ) NULL DEFAULT NULL;
ALTER TABLE counter_history ADD session_counter INT( 12 ) DEFAULT NULL;

## input vs textarea attributes
ALTER TABLE products_options ADD products_options_rows SMALLINT( 2 ) DEFAULT '1' NOT NULL after products_options_images_style;
ALTER TABLE customers_basket_attributes CHANGE products_options_value_text products_options_value_text BLOB NULL DEFAULT NULL;
ALTER TABLE orders_products_attributes CHANGE products_options_values products_options_values BLOB NOT NULL;
#hold customer and processed
ALTER TABLE orders CHANGE ip_address ip_address VARCHAR( 96 ) NOT NULL;


## Add EZ-Pages module:
CREATE TABLE ezpages (
  pages_id int(11) NOT NULL auto_increment,
  alt_url varchar(255) NOT NULL default '',
  alt_url_external varchar(255) NOT NULL default '',
  status_header int(1) NOT NULL default '1',
  status_sidebox int(1) NOT NULL default '1',
  status_footer int(1) NOT NULL default '1',
  status_toc int(1) NOT NULL default '1',
  header_sort_order int(3) NOT NULL default '0',
  sidebox_sort_order int(3) NOT NULL default '0',
  footer_sort_order int(3) NOT NULL default '0',
  toc_sort_order int(3) NOT NULL default '0',
  page_open_new_window int(1) NOT NULL default '0',
  page_is_ssl int(1) NOT NULL default '0',
  toc_chapter int(11) NOT NULL default '0',
  PRIMARY KEY  (pages_id),
  KEY idx_ezp_status_header_zen (status_header),
  KEY idx_ezp_status_sidebox_zen (status_sidebox),
  KEY idx_ezp_status_footer_zen (status_footer),
  KEY idx_ezp_status_toc_zen (status_toc)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS ezpages_content (
  pages_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '1',
  pages_title varchar(64) NOT NULL default '',
  pages_html_text text NOT NULL,
  KEY idx_ezpages_content (pages_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


################################################################
#
# Table structure for table meta_tags_categories_description
#
CREATE TABLE meta_tags_categories_description (
  categories_id int(11) NOT NULL auto_increment,
  language_id int(11) NOT NULL default '1',
  metatags_title VARCHAR(255) NOT NULL default '',
  metatags_keywords TEXT,
  metatags_description TEXT,
  PRIMARY KEY  (categories_id,language_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;
################################################################

#Index Optimizations
ALTER TABLE categories DROP INDEX idx_categories_parent_id_zen;
ALTER TABLE coupon_gv_customer DROP INDEX idx_customer_id_zen;
ALTER TABLE orders_products DROP INDEX idx_orders_id_zen;
ALTER TABLE paypal DROP INDEX idx_paypal_paypal_ipn_id_zen;
ALTER TABLE products_options_values DROP INDEX idx_prod_opt_val_id_zen;
ALTER TABLE orders_products DROP INDEX orders_id_prod_id_zen;
ALTER TABLE orders_products ADD INDEX idx_orders_id_prod_id_zen ( orders_id , products_id );
ALTER TABLE template_select ADD INDEX idx_tpl_lang_zen (template_language) ;
ALTER TABLE orders_total ADD INDEX idx_ot_class_zen (class);
ALTER TABLE coupons ADD INDEX idx_coupon_code_zen (coupon_code);
ALTER TABLE coupons ADD INDEX idx_coupon_type_zen (coupon_type);


#############

#### VERSION UPDATE COMMANDS
## THE FOLLOWING 2 SECTIONS SHOULD BE THE "LAST" ITEMS IN THE FILE, so that if the upgrade fails prematurely, the version info is not updated.
##The following updates the version HISTORY to store the prior version's info (Essentially "moves" the prior version info from the "project_version" to "project_version_history" table
#NEXT_X_ROWS_AS_ONE_COMMAND:3
INSERT INTO project_version_history (project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_date_applied, project_version_comment)
SELECT project_version_key, project_version_major, project_version_minor, project_version_patch1 as project_version_patch, project_version_date_applied, project_version_comment
FROM project_version;

## Now set to new version
UPDATE project_version SET project_version_major='1', project_version_minor='3.0', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.2.7->1.3.0', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Main';
UPDATE project_version SET project_version_major='1', project_version_minor='3.0', project_version_patch1='', project_version_patch1_source='', project_version_patch2='', project_version_patch2_source='', project_version_comment='Version Update 1.2.7->1.3.0', project_version_date_applied=now() WHERE project_version_key = 'Zen-Cart Database';


#####  END OF UPGRADE SCRIPT

