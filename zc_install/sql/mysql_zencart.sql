#
# * Main Zen Cart SQL Load for MySQL databases
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2014 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version GIT: $Id: Author: Jack Modified in v1.5.4 $
#

############ IMPORTANT INSTRUCTIONS ###############
#
# * Zen Cart 通过 zc_install/index.php 程序来执行安装
# * 本SQL脚步仅用于从 zc_install 下执行
# * * 不 * 建议通过其它工具执行
# * 例如: 不要用 phpMyAdmin 或其它 SQL 脚本工具
# * zc_install 程序会检测到可能的问题/错误
# * 并基于选择的安装模式，自动处理表前缀
#
#####################################################


# --------------------------------------------------------
#
# Table structure for table upgrade_exceptions
# (Placed at top so any exceptions during installation can be trapped as well)
#

DROP TABLE IF EXISTS upgrade_exceptions;
CREATE TABLE upgrade_exceptions (
  upgrade_exception_id smallint(5) NOT NULL auto_increment,
  sql_file varchar(50) default NULL,
  reason varchar(200) default NULL,
  errordate datetime default '0001-01-01 00:00:00',
  sqlstatement text,
  PRIMARY KEY  (upgrade_exception_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------
#
# Table structure for table address_book
#

DROP TABLE IF EXISTS address_book;
CREATE TABLE address_book (
  address_book_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  entry_gender char(1) NOT NULL default '',
  entry_company varchar(64) default NULL,
  entry_firstname varchar(32) NOT NULL default '',
  entry_lastname varchar(32) NOT NULL default '',
  entry_street_address varchar(64) NOT NULL default '',
  entry_suburb varchar(32) default NULL,
  entry_postcode varchar(10) NOT NULL default '',
  entry_city varchar(32) NOT NULL default '',
  entry_state varchar(32) default NULL,
  entry_country_id int(11) NOT NULL default '0',
  entry_zone_id int(11) NOT NULL default '0',
  PRIMARY KEY  (address_book_id),
  KEY idx_address_book_customers_id_zen (customers_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'address_format'
#

DROP TABLE IF EXISTS address_format;
CREATE TABLE address_format (
  address_format_id int(11) NOT NULL auto_increment,
  address_format varchar(128) NOT NULL default '',
  address_summary varchar(48) NOT NULL default '',
  PRIMARY KEY  (address_format_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin'
#

DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
  admin_id int(11) NOT NULL auto_increment,
  admin_name varchar(32) NOT NULL default '',
  admin_email varchar(96) NOT NULL default '',
  admin_profile int(11) NOT NULL default '0',
  admin_pass varchar(255) NOT NULL default '',
  prev_pass1 varchar(255) NOT NULL default '',
  prev_pass2 varchar(255) NOT NULL default '',
  prev_pass3 varchar(255) NOT NULL default '',
  pwd_last_change_date datetime NOT NULL default '0000-00-00 00:00:00',
  reset_token varchar(255) NOT NULL default '',
  last_modified datetime NOT NULL default '0000-00-00 00:00:00',
  last_login_date datetime NOT NULL default '0000-00-00 00:00:00',
  last_login_ip varchar(45) NOT NULL default '',
  failed_logins smallint(4) unsigned NOT NULL default '0',
  lockout_expires int(11) NOT NULL default '0',
  last_failed_attempt datetime NOT NULL default '0000-00-00 00:00:00',
  last_failed_ip varchar(45) NOT NULL default '',
  PRIMARY KEY  (admin_id),
  KEY idx_admin_name_zen (admin_name),
  KEY idx_admin_email_zen (admin_email),
  KEY idx_admin_profile_zen (admin_profile)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin_activity_log'
#

DROP TABLE IF EXISTS admin_activity_log;
CREATE TABLE admin_activity_log (
  log_id bigint(15) NOT NULL auto_increment,
  access_date datetime NOT NULL default '0001-01-01 00:00:00',
  admin_id int(11) NOT NULL default '0',
  page_accessed varchar(80) NOT NULL default '',
  page_parameters text,
  ip_address varchar(45) NOT NULL default '',
  flagged tinyint NOT NULL default '0',
  attention varchar(255) NOT NULL default '',
  gzpost mediumblob,
  PRIMARY KEY  (log_id),
  KEY idx_page_accessed_zen (page_accessed),
  KEY idx_access_date_zen (access_date),
  KEY idx_flagged_zen (flagged),
  KEY idx_ip_zen (ip_address)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin_menu'
#

DROP TABLE IF EXISTS admin_menus;
CREATE TABLE admin_menus (
  menu_key VARCHAR(255) NOT NULL DEFAULT '',
  language_key VARCHAR(255) NOT NULL DEFAULT '',
  sort_order INT(11) NOT NULL DEFAULT 0,
  UNIQUE KEY menu_key (menu_key)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin_pages'
#

DROP TABLE IF EXISTS admin_pages;
CREATE TABLE admin_pages (
  page_key VARCHAR(255) NOT NULL DEFAULT '',
  language_key VARCHAR(255) NOT NULL DEFAULT '',
  main_page varchar(255) NOT NULL default '',
  page_params varchar(255) NOT NULL default '',
  menu_key varchar(255) NOT NULL default '',
  display_on_menu char(1) NOT NULL default 'N',
  sort_order int(11) NOT NULL default 0,
  UNIQUE KEY page_key (page_key)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin_profiles'
#

DROP TABLE IF EXISTS admin_profiles;
CREATE TABLE admin_profiles (
  profile_id int(11) NOT NULL AUTO_INCREMENT,
  profile_name varchar(255) NOT NULL default '',
  PRIMARY KEY (profile_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'admin_pages_to_profiles'
#

DROP TABLE IF EXISTS admin_pages_to_profiles;
CREATE TABLE admin_pages_to_profiles (
  profile_id int(11) NOT NULL default '0',
  page_key varchar(255) NOT NULL default '',
  UNIQUE KEY profile_page (profile_id, page_key),
  UNIQUE KEY page_profile (page_key, profile_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'authorizenet'
#
DROP TABLE IF EXISTS authorizenet;
CREATE TABLE authorizenet (
  id int(11) unsigned NOT NULL auto_increment,
  customer_id int(11) NOT NULL default '0',
  order_id int(11) NOT NULL default '0',
  response_code int(1) NOT NULL default '0',
  response_text varchar(255) NOT NULL default '',
  authorization_type varchar(50) NOT NULL default '',
  transaction_id bigint(20) default NULL,
  sent longtext NOT NULL,
  received longtext NOT NULL,
  time varchar(50) NOT NULL default '',
  session_id varchar(255) NOT NULL default '',
  PRIMARY KEY  (id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'banners'
#

DROP TABLE IF EXISTS banners;
CREATE TABLE banners (
  banners_id int(11) NOT NULL auto_increment,
  banners_title varchar(64) NOT NULL default '',
  banners_url varchar(255) NOT NULL default '',
  banners_image varchar(64) NOT NULL default '',
  banners_group varchar(15) NOT NULL default '',
  banners_html_text text,
  expires_impressions int(7) default '0',
  expires_date datetime default NULL,
  date_scheduled datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  banners_open_new_windows int(1) NOT NULL default '1',
  banners_on_ssl int(1) NOT NULL default '1',
  banners_sort_order int(11) NOT NULL default '0',
  PRIMARY KEY  (banners_id),
  KEY idx_status_group_zen (status,banners_group),
  KEY idx_expires_date_zen (expires_date),
  KEY idx_date_scheduled_zen (date_scheduled)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------

#
# Table structure for table 'banners_history'
#

DROP TABLE IF EXISTS banners_history;
CREATE TABLE banners_history (
  banners_history_id int(11) NOT NULL auto_increment,
  banners_id int(11) NOT NULL default '0',
  banners_shown int(5) NOT NULL default '0',
  banners_clicked int(5) NOT NULL default '0',
  banners_history_date datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (banners_history_id),
  KEY idx_banners_id_zen (banners_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'categories'
#

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  categories_id int(11) NOT NULL auto_increment,
  categories_image varchar(64) default NULL,
  parent_id int(11) NOT NULL default '0',
  sort_order int(3) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  categories_status tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (categories_id),
  KEY idx_parent_id_cat_id_zen (parent_id,categories_id),
  KEY idx_status_zen (categories_status),
  KEY idx_sort_order_zen (sort_order)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'categories_description'
#

DROP TABLE IF EXISTS categories_description;
CREATE TABLE categories_description (
  categories_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  categories_name varchar(32) NOT NULL default '',
  categories_description text NOT NULL,
  PRIMARY KEY  (categories_id,language_id),
  KEY idx_categories_name_zen (categories_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'configuration'
#

DROP TABLE IF EXISTS configuration;
CREATE TABLE configuration (
  configuration_id int(11) NOT NULL auto_increment,
  configuration_title text NOT NULL,
  configuration_key varchar(255) NOT NULL default '',
  configuration_value text NOT NULL,
  configuration_description text NOT NULL,
  configuration_group_id int(11) NOT NULL default '0',
  sort_order int(5) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  use_function text default NULL,
  set_function text default NULL,
  PRIMARY KEY  (configuration_id),
  UNIQUE KEY unq_config_key_zen (configuration_key),
  KEY idx_key_value_zen (configuration_key,configuration_value(10)),
  KEY idx_cfg_grp_id_zen (configuration_group_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'configuration_group'
#

DROP TABLE IF EXISTS configuration_group;
CREATE TABLE configuration_group (
  configuration_group_id int(11) NOT NULL auto_increment,
  configuration_group_title varchar(64) NOT NULL default '',
  configuration_group_description varchar(255) NOT NULL default '',
  sort_order int(5) default NULL,
  visible int(1) default '1',
  PRIMARY KEY  (configuration_group_id),
  KEY idx_visible_zen (visible)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'counter'
#

DROP TABLE IF EXISTS counter;
CREATE TABLE counter (
  startdate char(8) default NULL,
  counter int(12) default NULL
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'counter_history'
#

DROP TABLE IF EXISTS counter_history;
CREATE TABLE counter_history (
  startdate char(8) default NULL,
  counter int(12) default NULL,
  session_counter int(12) default NULL,
  PRIMARY KEY  (startdate)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'countries'
#

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  countries_id int(11) NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL default '',
  countries_iso_code_2 char(2) NOT NULL default '',
  countries_iso_code_3 char(3) NOT NULL default '',
  address_format_id int(11) NOT NULL default '0',
  status tinyint(1) default 1,
  PRIMARY KEY  (countries_id),
  KEY idx_countries_name_zen (countries_name),
  KEY idx_address_format_id_zen (address_format_id),
  KEY idx_iso_2_zen (countries_iso_code_2),
  KEY idx_iso_3_zen (countries_iso_code_3)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupon_email_track'
#

DROP TABLE IF EXISTS coupon_email_track;
CREATE TABLE coupon_email_track (
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id_sent int(11) NOT NULL default '0',
  sent_firstname varchar(32) default NULL,
  sent_lastname varchar(32) default NULL,
  emailed_to varchar(32) default NULL,
  date_sent datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (unique_id),
  KEY idx_coupon_id_zen (coupon_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupon_gv_customer'
#

DROP TABLE IF EXISTS coupon_gv_customer;
CREATE TABLE coupon_gv_customer (
  customer_id int(5) NOT NULL default '0',
  amount decimal(15,4) NOT NULL default '0.0000',
  PRIMARY KEY  (customer_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupon_gv_queue'
#

DROP TABLE IF EXISTS coupon_gv_queue;
CREATE TABLE coupon_gv_queue (
  unique_id int(5) NOT NULL auto_increment,
  customer_id int(5) NOT NULL default '0',
  order_id int(5) NOT NULL default '0',
  amount decimal(15,4) NOT NULL default '0.0000',
  date_created datetime NOT NULL default '0001-01-01 00:00:00',
  ipaddr varchar(45) NOT NULL default '',
  release_flag char(1) NOT NULL default 'N',
  PRIMARY KEY  (unique_id),
  KEY idx_cust_id_order_id_zen (customer_id,order_id),
  KEY idx_release_flag_zen (release_flag)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupon_redeem_track'
#

DROP TABLE IF EXISTS coupon_redeem_track;
CREATE TABLE coupon_redeem_track (
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id int(11) NOT NULL default '0',
  redeem_date datetime NOT NULL default '0001-01-01 00:00:00',
  redeem_ip varchar(45) NOT NULL default '',
  order_id int(11) NOT NULL default '0',
  PRIMARY KEY  (unique_id),
  KEY idx_coupon_id_zen (coupon_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupon_restrict'
#

DROP TABLE IF EXISTS coupon_restrict;
CREATE TABLE coupon_restrict (
  restrict_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  product_id int(11) NOT NULL default '0',
  category_id int(11) NOT NULL default '0',
  coupon_restrict char(1) NOT NULL default 'N',
  PRIMARY KEY  (restrict_id),
  KEY idx_coup_id_prod_id_zen (coupon_id,product_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupons'
#

DROP TABLE IF EXISTS coupons;
CREATE TABLE coupons (
  coupon_id int(11) NOT NULL auto_increment,
  coupon_type char(1) NOT NULL default 'F',
  coupon_code varchar(32) NOT NULL default '',
  coupon_amount decimal(15,4) NOT NULL default '0.0000',
  coupon_minimum_order decimal(15,4) NOT NULL default '0.0000',
  coupon_start_date datetime NOT NULL default '0001-01-01 00:00:00',
  coupon_expire_date datetime NOT NULL default '0001-01-01 00:00:00',
  uses_per_coupon int(5) NOT NULL default '1',
  uses_per_user int(5) NOT NULL default '0',
  restrict_to_products varchar(255) default NULL,
  restrict_to_categories varchar(255) default NULL,
  restrict_to_customers text,
  coupon_active char(1) NOT NULL default 'Y',
  date_created datetime NOT NULL default '0001-01-01 00:00:00',
  date_modified datetime NOT NULL default '0001-01-01 00:00:00',
  coupon_zone_restriction int(11) NOT NULL default '0',
  PRIMARY KEY (coupon_id),
  KEY idx_active_type_zen (coupon_active,coupon_type),
  KEY idx_coupon_code_zen (coupon_code),
  KEY idx_coupon_type_zen (coupon_type)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'coupons_description'
#

DROP TABLE IF EXISTS coupons_description;
CREATE TABLE coupons_description (
  coupon_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  coupon_name varchar(32) NOT NULL default '',
  coupon_description text,
  PRIMARY KEY (coupon_id,language_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'currencies'
#

DROP TABLE IF EXISTS currencies;
CREATE TABLE currencies (
  currencies_id int(11) NOT NULL auto_increment,
  title varchar(32) NOT NULL default '',
  code char(3) NOT NULL default '',
  symbol_left varchar(24) default NULL,
  symbol_right varchar(24) default NULL,
  decimal_point char(1) default NULL,
  thousands_point char(1) default NULL,
  decimal_places char(1) default NULL,
  value float(13,8) default NULL,
  last_updated datetime default NULL,
  PRIMARY KEY  (currencies_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'customers'
#

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customers_id int(11) NOT NULL auto_increment,
  customers_gender char(1) NOT NULL default '',
  customers_firstname varchar(32) NOT NULL default '',
  customers_lastname varchar(32) NOT NULL default '',
  customers_dob datetime NOT NULL default '0001-01-01 00:00:00',
  customers_email_address varchar(96) NOT NULL default '',
  customers_nick varchar(96) NOT NULL default '',
  customers_default_address_id int(11) NOT NULL default '0',
  customers_telephone varchar(32) NOT NULL default '',
  customers_fax varchar(32) default NULL,
  customers_password varchar(255) NOT NULL default '',
  customers_newsletter char(1) default NULL,
  customers_group_pricing int(11) NOT NULL default '0',
  customers_email_format varchar(4) NOT NULL default 'TEXT',
  customers_authorization int(1) NOT NULL default '0',
  customers_referral varchar(32) NOT NULL default '',
  customers_paypal_payerid VARCHAR(20) NOT NULL default '',
  customers_paypal_ec TINYINT(1) UNSIGNED DEFAULT 0 NOT NULL,
  PRIMARY KEY  (customers_id),
  KEY idx_email_address_zen (customers_email_address),
  KEY idx_referral_zen (customers_referral(10)),
  KEY idx_grp_pricing_zen (customers_group_pricing),
  KEY idx_nick_zen (customers_nick),
  KEY idx_newsletter_zen (customers_newsletter)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'customers_basket'
#

DROP TABLE IF EXISTS customers_basket;
CREATE TABLE customers_basket (
  customers_basket_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  customers_basket_quantity float NOT NULL default '0',
  final_price decimal(15,4) NOT NULL default '0.0000',
  customers_basket_date_added varchar(8) default NULL,
  PRIMARY KEY  (customers_basket_id),
  KEY idx_customers_id_zen (customers_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'customers_basket_attributes'
#

DROP TABLE IF EXISTS customers_basket_attributes;
CREATE TABLE customers_basket_attributes (
  customers_basket_attributes_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  products_options_id varchar(64) NOT NULL default '0',
  products_options_value_id int(11) NOT NULL default '0',
  products_options_value_text BLOB NULL,
  products_options_sort_order text NOT NULL,
  PRIMARY KEY  (customers_basket_attributes_id),
  KEY idx_cust_id_prod_id_zen (customers_id,products_id(36))
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'customers_info'
#

DROP TABLE IF EXISTS customers_info;
CREATE TABLE customers_info (
  customers_info_id int(11) NOT NULL default '0',
  customers_info_date_of_last_logon datetime default NULL,
  customers_info_number_of_logons int(5) default NULL,
  customers_info_date_account_created datetime default NULL,
  customers_info_date_account_last_modified datetime default NULL,
  global_product_notifications int(1) default '0',
  PRIMARY KEY  (customers_info_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table db_cache
#
DROP TABLE IF EXISTS db_cache;
CREATE TABLE db_cache (
  cache_entry_name varchar(64) NOT NULL default '',
  cache_data mediumblob,
  cache_entry_created int(15) default NULL,
  PRIMARY KEY  (cache_entry_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;



# --------------------------------------------------------

#
# Table structure for table 'email_archive'
#

DROP TABLE IF EXISTS email_archive;
CREATE TABLE email_archive (
  archive_id int(11) NOT NULL auto_increment,
  email_to_name varchar(96) NOT NULL default '',
  email_to_address varchar(96) NOT NULL default '',
  email_from_name varchar(96) NOT NULL default '',
  email_from_address varchar(96) NOT NULL default '',
  email_subject varchar(255) NOT NULL default '',
  email_html text NOT NULL,
  email_text text NOT NULL,
  date_sent datetime NOT NULL default '0001-01-01 00:00:00',
  module varchar(64) NOT NULL default '',
  PRIMARY KEY  (archive_id),
  KEY idx_email_to_address_zen (email_to_address),
  KEY idx_module_zen (module)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------

#
# Table structure for table 'ezpages'
#

DROP TABLE IF EXISTS ezpages;
CREATE TABLE ezpages (
  pages_id int(11) NOT NULL auto_increment,
  languages_id int(11) NOT NULL default '1',
  pages_title varchar(64) NOT NULL default '',
  alt_url varchar(255) NOT NULL default '',
  alt_url_external varchar(255) NOT NULL default '',
  pages_html_text mediumtext,
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
  KEY idx_lang_id_zen (languages_id),
  KEY idx_ezp_status_header_zen (status_header),
  KEY idx_ezp_status_sidebox_zen (status_sidebox),
  KEY idx_ezp_status_footer_zen (status_footer),
  KEY idx_ezp_status_toc_zen (status_toc)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table ezpages_content
#

DROP TABLE IF EXISTS ezpages_content;
CREATE TABLE ezpages_content (
  pc_id int(11) NOT NULL auto_increment,
  pages_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '1',
  pages_title varchar(64) NOT NULL default '',
  pages_html_text text,
  PRIMARY KEY  (pc_id),
  KEY idx_ezpages_content (pages_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#
# Table structure for table 'featured'
#

DROP TABLE IF EXISTS featured;
CREATE TABLE featured (
  featured_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  featured_date_added datetime default NULL,
  featured_last_modified datetime default NULL,
  expires_date date NOT NULL default '0001-01-01',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  featured_date_available date NOT NULL default '0001-01-01',
  PRIMARY KEY  (featured_id),
  KEY idx_status_zen (status),
  KEY idx_products_id_zen (products_id),
  KEY idx_date_avail_zen (featured_date_available),
  KEY idx_expires_date_zen (expires_date)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'files_uploaded'
#

DROP TABLE IF EXISTS files_uploaded;
CREATE TABLE files_uploaded (
  files_uploaded_id int(11) NOT NULL auto_increment,
  sesskey varchar(32) default NULL,
  customers_id int(11) default NULL,
  files_uploaded_name varchar(64) NOT NULL default '',
  PRIMARY KEY  (files_uploaded_id),
  KEY idx_customers_id_zen (customers_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='Must always have either a sesskey or customers_id';

# --------------------------------------------------------

#
# Table structure for table 'geo_zones'
#

DROP TABLE IF EXISTS geo_zones;
CREATE TABLE geo_zones (
  geo_zone_id int(11) NOT NULL auto_increment,
  geo_zone_name varchar(32) NOT NULL default '',
  geo_zone_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (geo_zone_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'get_terms_to_filter'
#
DROP TABLE IF EXISTS get_terms_to_filter;
CREATE TABLE get_terms_to_filter (
  get_term_name varchar(255) NOT NULL default '',
  get_term_table varchar(64) NOT NULL,
  get_term_name_field varchar(64) NOT NULL,
  PRIMARY KEY  (get_term_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'group_pricing'
#

DROP TABLE IF EXISTS group_pricing;
CREATE TABLE group_pricing (
  group_id int(11) NOT NULL auto_increment,
  group_name varchar(32) NOT NULL default '',
  group_percentage decimal(5,2) NOT NULL default '0.00',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (group_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'languages'
#

DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  languages_id int(11) NOT NULL auto_increment,
  name varchar(32) NOT NULL default '',
  code char(2) NOT NULL default '',
  image varchar(64) default NULL,
  directory varchar(32) default NULL,
  sort_order int(3) default NULL,
  PRIMARY KEY  (languages_id),
  KEY idx_languages_name_zen (name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'layout_boxes'
#

DROP TABLE IF EXISTS layout_boxes;
CREATE TABLE layout_boxes (
  layout_id int(11) NOT NULL auto_increment,
  layout_template varchar(64) NOT NULL default '',
  layout_box_name varchar(64) NOT NULL default '',
  layout_box_status tinyint(1) NOT NULL default '0',
  layout_box_location tinyint(1) NOT NULL default '0',
  layout_box_sort_order int(11) NOT NULL default '0',
  layout_box_sort_order_single int(11) NOT NULL default '0',
  layout_box_status_single tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (layout_id),
  KEY idx_name_template_zen (layout_template,layout_box_name),
  KEY idx_layout_box_status_zen (layout_box_status),
  KEY idx_layout_box_sort_order_zen (layout_box_sort_order)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'manufacturers'
#

DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
  manufacturers_id int(11) NOT NULL auto_increment,
  manufacturers_name varchar(32) NOT NULL default '',
  manufacturers_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (manufacturers_id),
  KEY idx_mfg_name_zen (manufacturers_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'manufacturers_info'
#

DROP TABLE IF EXISTS manufacturers_info;
CREATE TABLE manufacturers_info (
  manufacturers_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  manufacturers_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (manufacturers_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'media_clips'
#

DROP TABLE IF EXISTS media_clips;
CREATE TABLE media_clips (
  clip_id int(11) NOT NULL auto_increment,
  media_id int(11) NOT NULL default '0',
  clip_type smallint(6) NOT NULL default '0',
  clip_filename text NOT NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (clip_id),
  KEY idx_media_id_zen (media_id),
  KEY idx_clip_type_zen (clip_type)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'media_manager'
#

DROP TABLE IF EXISTS media_manager;
CREATE TABLE media_manager (
  media_id int(11) NOT NULL auto_increment,
  media_name varchar(255) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (media_id),
  KEY idx_media_name_zen (media_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'media_to_products'
#

DROP TABLE IF EXISTS media_to_products;
CREATE TABLE media_to_products (
  media_id int(11) NOT NULL default '0',
  product_id int(11) NOT NULL default '0',
  KEY idx_media_product_zen (media_id,product_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'media_types'
#

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  type_id int(11) NOT NULL auto_increment,
  type_name varchar(64) NOT NULL default '',
  type_ext varchar(8) NOT NULL default '',
  PRIMARY KEY  (type_id),
  KEY idx_type_name_zen (type_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO media_types (type_name, type_ext) VALUES ('MP3','.mp3');

# -------------------------------------------------------

#
# Table structure for table 'meta_tags_categories_description'
#

DROP TABLE IF EXISTS meta_tags_categories_description;
CREATE TABLE meta_tags_categories_description (
  categories_id int(11) NOT NULL,
  language_id int(11) NOT NULL default '1',
  metatags_title varchar(255) NOT NULL default '',
  metatags_keywords text,
  metatags_description text,
  PRIMARY KEY  (categories_id,language_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'meta_tags_products_description'
#

DROP TABLE IF EXISTS meta_tags_products_description;
CREATE TABLE meta_tags_products_description (
  products_id int(11) NOT NULL,
  language_id int(11) NOT NULL default '1',
  metatags_title varchar(255) NOT NULL default '',
  metatags_keywords text,
  metatags_description text,
  PRIMARY KEY  (products_id,language_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'music_genre'
#

DROP TABLE IF EXISTS music_genre;
CREATE TABLE music_genre (
  music_genre_id int(11) NOT NULL auto_increment,
  music_genre_name varchar(32) NOT NULL default '',
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (music_genre_id),
  KEY idx_music_genre_name_zen (music_genre_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'newsletters'
#

DROP TABLE IF EXISTS newsletters;
CREATE TABLE newsletters (
  newsletters_id int(11) NOT NULL auto_increment,
  title varchar(255) NOT NULL default '',
  content text NOT NULL,
  content_html text NOT NULL,
  module varchar(255) NOT NULL default '',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  date_sent datetime default NULL,
  status int(1) default NULL,
  locked int(1) default '0',
  PRIMARY KEY  (newsletters_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders'
#

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  orders_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  customers_name varchar(64) NOT NULL default '',
  customers_company varchar(64) default NULL,
  customers_street_address varchar(64) NOT NULL default '',
  customers_suburb varchar(32) default NULL,
  customers_city varchar(32) NOT NULL default '',
  customers_postcode varchar(10) NOT NULL default '',
  customers_state varchar(32) default NULL,
  customers_country varchar(32) NOT NULL default '',
  customers_telephone varchar(32) NOT NULL default '',
  customers_email_address varchar(96) NOT NULL default '',
  customers_address_format_id int(5) NOT NULL default '0',
  delivery_name varchar(64) NOT NULL default '',
  delivery_company varchar(64) default NULL,
  delivery_street_address varchar(64) NOT NULL default '',
  delivery_suburb varchar(32) default NULL,
  delivery_city varchar(32) NOT NULL default '',
  delivery_postcode varchar(10) NOT NULL default '',
  delivery_state varchar(32) default NULL,
  delivery_country varchar(32) NOT NULL default '',
  delivery_address_format_id int(5) NOT NULL default '0',
  billing_name varchar(64) NOT NULL default '',
  billing_company varchar(64) default NULL,
  billing_street_address varchar(64) NOT NULL default '',
  billing_suburb varchar(32) default NULL,
  billing_city varchar(32) NOT NULL default '',
  billing_postcode varchar(10) NOT NULL default '',
  billing_state varchar(32) default NULL,
  billing_country varchar(32) NOT NULL default '',
  billing_address_format_id int(5) NOT NULL default '0',
  payment_method varchar(128) NOT NULL default '',
  payment_module_code varchar(32) NOT NULL default '',
  shipping_method varchar(128) NOT NULL default '',
  shipping_module_code varchar(32) NOT NULL default '',
  coupon_code varchar(32) NOT NULL default '',
  cc_type varchar(20) default NULL,
  cc_owner varchar(64) default NULL,
  cc_number varchar(32) default NULL,
  cc_expires varchar(4) default NULL,
  cc_cvv blob,
  last_modified datetime default NULL,
  date_purchased datetime default NULL,
  orders_status int(5) NOT NULL default '0',
  orders_date_finished datetime default NULL,
  currency char(3) default NULL,
  currency_value decimal(14,6) default NULL,
  order_total decimal(14,2) default NULL,
  order_tax decimal(14,2) default NULL,
  paypal_ipn_id int(11) NOT NULL default '0',
  ip_address varchar(96) NOT NULL default '',
  PRIMARY KEY  (orders_id),
  KEY idx_status_orders_cust_zen (orders_status,orders_id,customers_id),
  KEY idx_date_purchased_zen (date_purchased),
  KEY idx_cust_id_orders_id_zen (customers_id,orders_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------

#
# Table structure for table 'orders_products'
#

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  orders_products_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  products_id int(11) NOT NULL default '0',
  products_model varchar(32) default NULL,
  products_name varchar(64) NOT NULL default '',
  products_price decimal(15,4) NOT NULL default '0.0000',
  final_price decimal(15,4) NOT NULL default '0.0000',
  products_tax decimal(7,4) NOT NULL default '0.0000',
  products_quantity float NOT NULL default '0',
  onetime_charges decimal(15,4) NOT NULL default '0.0000',
  products_priced_by_attribute tinyint(1) NOT NULL default '0',
  product_is_free tinyint(1) NOT NULL default '0',
  products_discount_type tinyint(1) NOT NULL default '0',
  products_discount_type_from tinyint(1) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_id),
  KEY idx_orders_id_prod_id_zen (orders_id,products_id),
  KEY idx_prod_id_orders_id_zen (products_id,orders_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders_products_attributes'
#

DROP TABLE IF EXISTS orders_products_attributes;
CREATE TABLE orders_products_attributes (
  orders_products_attributes_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  products_options varchar(32) NOT NULL default '',
  products_options_values text NOT NULL,
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  product_attribute_is_free tinyint(1) NOT NULL default '0',
  products_attributes_weight float NOT NULL default '0',
  products_attributes_weight_prefix char(1) NOT NULL default '',
  attributes_discounted tinyint(1) NOT NULL default '1',
  attributes_price_base_included tinyint(1) NOT NULL default '1',
  attributes_price_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_qty_prices text,
  attributes_qty_prices_onetime text,
  attributes_price_words decimal(15,4) NOT NULL default '0.0000',
  attributes_price_words_free int(4) NOT NULL default '0',
  attributes_price_letters decimal(15,4) NOT NULL default '0.0000',
  attributes_price_letters_free int(4) NOT NULL default '0',
  products_options_id int(11) NOT NULL default '0',
  products_options_values_id int(11) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_attributes_id),
  KEY idx_orders_id_prod_id_zen (orders_id,orders_products_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders_products_download'
#

DROP TABLE IF EXISTS orders_products_download;
CREATE TABLE orders_products_download (
  orders_products_download_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int(2) NOT NULL default '0',
  download_count int(2) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_download_id),
  KEY idx_orders_id_zen (orders_id),
  KEY idx_orders_products_id_zen (orders_products_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders_status'
#

DROP TABLE IF EXISTS orders_status;
CREATE TABLE orders_status (
  orders_status_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  orders_status_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (orders_status_id,language_id),
  KEY idx_orders_status_name_zen (orders_status_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders_status_history'
#

DROP TABLE IF EXISTS orders_status_history;
CREATE TABLE orders_status_history (
  orders_status_history_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_status_id int(5) NOT NULL default '0',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  customer_notified int(1) default '0',
  comments text,
  PRIMARY KEY  (orders_status_history_id),
  KEY idx_orders_id_status_id_zen (orders_id,orders_status_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'orders_total'
#

DROP TABLE IF EXISTS orders_total;
CREATE TABLE orders_total (
  orders_total_id int(10) unsigned NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  title varchar(255) NOT NULL default '',
  text varchar(255) NOT NULL default '',
  value decimal(15,4) NOT NULL default '0.0000',
  class varchar(32) NOT NULL default '',
  sort_order int(11) NOT NULL default '0',
  PRIMARY KEY  (orders_total_id),
  KEY idx_ot_orders_id_zen (orders_id),
  KEY idx_ot_class_zen (class)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'paypal'
#

DROP TABLE IF EXISTS paypal;
CREATE TABLE paypal (
  paypal_ipn_id int(11) unsigned NOT NULL auto_increment,
  order_id int(11) unsigned NOT NULL default '0',
  txn_type varchar(40) NOT NULL default '',
  module_name varchar(40) NOT NULL default '',
  module_mode varchar(40) NOT NULL default '',
  reason_code varchar(40) default NULL,
  payment_type varchar(40) NOT NULL default '',
  payment_status varchar(32) NOT NULL default '',
  pending_reason varchar(32) default NULL,
  invoice varchar(128) default NULL,
  mc_currency char(3) NOT NULL default '',
  first_name varchar(32) NOT NULL default '',
  last_name varchar(32) NOT NULL default '',
  payer_business_name varchar(128) default NULL,
  address_name varchar(64) default NULL,
  address_street varchar(254) default NULL,
  address_city varchar(120) default NULL,
  address_state varchar(120) default NULL,
  address_zip varchar(10) default NULL,
  address_country varchar(64) default NULL,
  address_status varchar(11) default NULL,
  payer_email varchar(128) NOT NULL default '',
  payer_id varchar(32) NOT NULL default '',
  payer_status varchar(10) NOT NULL default '',
  payment_date datetime NOT NULL default '0001-01-01 00:00:00',
  business varchar(128) NOT NULL default '',
  receiver_email varchar(128) NOT NULL default '',
  receiver_id varchar(32) NOT NULL default '',
  txn_id varchar(20) NOT NULL default '',
  parent_txn_id varchar(20) default NULL,
  num_cart_items tinyint(4) unsigned NOT NULL default '1',
  mc_gross decimal(7,2) NOT NULL default '0.00',
  mc_fee decimal(7,2) NOT NULL default '0.00',
  payment_gross decimal(7,2) default NULL,
  payment_fee decimal(7,2) default NULL,
  settle_amount decimal(7,2) default NULL,
  settle_currency char(3) default NULL,
  exchange_rate decimal(4,2) default NULL,
  notify_version varchar(6) NOT NULL default '',
  verify_sign varchar(128) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  memo text,
  PRIMARY KEY (paypal_ipn_id,txn_id),
  KEY idx_order_id_zen (order_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'paypal_payment_status'
#

DROP TABLE IF EXISTS paypal_payment_status;
CREATE TABLE paypal_payment_status (
  payment_status_id int(11) NOT NULL auto_increment,
  payment_status_name varchar(64) NOT NULL default '',
  PRIMARY KEY (payment_status_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#
# Dumping data for table 'paypal_payment_status'
#

INSERT INTO paypal_payment_status VALUES (1, 'Completed');
INSERT INTO paypal_payment_status VALUES (2, 'Pending');
INSERT INTO paypal_payment_status VALUES (3, 'Failed');
INSERT INTO paypal_payment_status VALUES (4, 'Denied');
INSERT INTO paypal_payment_status VALUES (5, 'Refunded');
INSERT INTO paypal_payment_status VALUES (6, 'Canceled_Reversal');
INSERT INTO paypal_payment_status VALUES (7, 'Reversed');

# --------------------------------------------------------

#
# Table structure for table 'paypal_payment_status_history'
#

DROP TABLE IF EXISTS paypal_payment_status_history;
CREATE TABLE paypal_payment_status_history (
  payment_status_history_id int(11) NOT NULL auto_increment,
  paypal_ipn_id int(11) NOT NULL default '0',
  txn_id varchar(64) NOT NULL default '',
  parent_txn_id varchar(64) NOT NULL default '',
  payment_status varchar(17) NOT NULL default '',
  pending_reason varchar(32) default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY (payment_status_history_id),
  KEY idx_paypal_ipn_id_zen (paypal_ipn_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'paypal_session'
#

DROP TABLE IF EXISTS paypal_session;
CREATE TABLE paypal_session (
  unique_id int(11) NOT NULL auto_increment,
  session_id text NOT NULL,
  saved_session mediumblob NOT NULL,
  expiry int(17) NOT NULL default '0',
  PRIMARY KEY  (unique_id),
  KEY idx_session_id_zen (session_id(36))
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'paypal_testing'
#

DROP TABLE IF EXISTS paypal_testing;
CREATE TABLE paypal_testing (
  paypal_ipn_id int(11) unsigned NOT NULL auto_increment,
  order_id int(11) unsigned NOT NULL default '0',
  custom varchar(255) NOT NULL default '',
  txn_type varchar(40) NOT NULL default '',
  module_name varchar(40) NOT NULL default '',
  module_mode varchar(40) NOT NULL default '',
  reason_code varchar(40) default NULL,
  payment_type varchar(40) NOT NULL default '',
  payment_status varchar(32) NOT NULL default '',
  pending_reason varchar(32) default NULL,
  invoice varchar(128) default NULL,
  mc_currency char(3) NOT NULL default '',
  first_name varchar(32) NOT NULL default '',
  last_name varchar(32) NOT NULL default '',
  payer_business_name varchar(128) default NULL,
  address_name varchar(64) default NULL,
  address_street varchar(254) default NULL,
  address_city varchar(120) default NULL,
  address_state varchar(120) default NULL,
  address_zip varchar(10) default NULL,
  address_country varchar(64) default NULL,
  address_status varchar(11) default NULL,
  payer_email varchar(128) NOT NULL default '',
  payer_id varchar(32) NOT NULL default '',
  payer_status varchar(10) NOT NULL default '',
  payment_date datetime NOT NULL default '0001-01-01 00:00:00',
  business varchar(128) NOT NULL default '',
  receiver_email varchar(128) NOT NULL default '',
  receiver_id varchar(32) NOT NULL default '',
  txn_id varchar(20) NOT NULL default '',
  parent_txn_id varchar(20) default NULL,
  num_cart_items tinyint(4) unsigned NOT NULL default '1',
  mc_gross decimal(7,2) NOT NULL default '0.00',
  mc_fee decimal(7,2) NOT NULL default '0.00',
  payment_gross decimal(7,2) default NULL,
  payment_fee decimal(7,2) default NULL,
  settle_amount decimal(7,2) default NULL,
  settle_currency char(3) default NULL,
  exchange_rate decimal(4,2) default NULL,
  notify_version decimal(2,1) NOT NULL default '0.0',
  verify_sign varchar(128) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  memo text,
  PRIMARY KEY  (paypal_ipn_id,txn_id),
  KEY idx_order_id_zen (order_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'product_music_extra'
#

DROP TABLE IF EXISTS product_music_extra;
CREATE TABLE product_music_extra (
  products_id int(11) NOT NULL default '0',
  artists_id int(11) NOT NULL default '0',
  record_company_id int(11) NOT NULL default '0',
  music_genre_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id),
  KEY idx_music_genre_id_zen (music_genre_id),
  KEY idx_artists_id_zen (artists_id),
  KEY idx_record_company_id_zen (record_company_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------

#
# Table structure for table 'product_type_layout'
#
DROP TABLE IF EXISTS product_type_layout;
CREATE TABLE product_type_layout (
  configuration_id int(11) NOT NULL auto_increment,
  configuration_title text NOT NULL,
  configuration_key varchar(255) NOT NULL default '',
  configuration_value text NOT NULL,
  configuration_description text NOT NULL,
  product_type_id int(11) NOT NULL default '0',
  sort_order int(5) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  use_function text default NULL,
  set_function text default NULL,
  PRIMARY KEY  (configuration_id),
  UNIQUE KEY unq_config_key_zen (configuration_key),
  KEY idx_key_value_zen (configuration_key,configuration_value(10)),
  KEY idx_type_id_sort_order_zen (product_type_id,sort_order)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'product_types'
#

DROP TABLE IF EXISTS product_types;
CREATE TABLE product_types (
  type_id int(11) NOT NULL auto_increment,
  type_name varchar(255) NOT NULL default '',
  type_handler varchar(255) NOT NULL default '',
  type_master_type int(11) NOT NULL default '1',
  allow_add_to_cart char(1) NOT NULL default 'Y',
  default_image varchar(255) NOT NULL default '',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (type_id),
  KEY idx_type_master_type_zen (type_master_type)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'product_types_to_category'
#

DROP TABLE IF EXISTS product_types_to_category;
CREATE TABLE product_types_to_category (
  product_type_id int(11) NOT NULL default '0',
  category_id int(11) NOT NULL default '0',
  KEY idx_category_id_zen (category_id),
  KEY idx_product_type_id_zen (product_type_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;


# --------------------------------------------------------

#
# Table structure for table 'products'
#

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  products_id int(11) NOT NULL auto_increment,
  products_type int(11) NOT NULL default '1',
  products_quantity float NOT NULL default '0',
  products_model varchar(32) default NULL,
  products_image varchar(64) default NULL,
  products_price decimal(15,4) NOT NULL default '0.0000',
  products_virtual tinyint(1) NOT NULL default '0',
  products_date_added datetime NOT NULL default '0001-01-01 00:00:00',
  products_last_modified datetime default NULL,
  products_date_available datetime default NULL,
  products_weight float NOT NULL default '0',
  products_status tinyint(1) NOT NULL default '0',
  products_tax_class_id int(11) NOT NULL default '0',
  manufacturers_id int(11) default NULL,
  products_ordered float NOT NULL default '0',
  products_quantity_order_min float NOT NULL default '1',
  products_quantity_order_units float NOT NULL default '1',
  products_priced_by_attribute tinyint(1) NOT NULL default '0',
  product_is_free tinyint(1) NOT NULL default '0',
  product_is_call tinyint(1) NOT NULL default '0',
  products_quantity_mixed tinyint(1) NOT NULL default '0',
  product_is_always_free_shipping tinyint(1) NOT NULL default '0',
  products_qty_box_status tinyint(1) NOT NULL default '1',
  products_quantity_order_max float NOT NULL default '0',
  products_sort_order int(11) NOT NULL default '0',
  products_discount_type tinyint(1) NOT NULL default '0',
  products_discount_type_from tinyint(1) NOT NULL default '0',
  products_price_sorter decimal(15,4) NOT NULL default '0.0000',
  master_categories_id int(11) NOT NULL default '0',
  products_mixed_discount_quantity tinyint(1) NOT NULL default '1',
  metatags_title_status tinyint(1) NOT NULL default '0',
  metatags_products_name_status tinyint(1) NOT NULL default '0',
  metatags_model_status tinyint(1) NOT NULL default '0',
  metatags_price_status tinyint(1) NOT NULL default '0',
  metatags_title_tagline_status tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (products_id),
  KEY idx_products_date_added_zen (products_date_added),
  KEY idx_products_status_zen (products_status),
  KEY idx_products_date_available_zen (products_date_available),
  KEY idx_products_ordered_zen (products_ordered),
  KEY idx_products_model_zen (products_model),
  KEY idx_products_price_sorter_zen (products_price_sorter),
  KEY idx_master_categories_id_zen (master_categories_id),
  KEY idx_products_sort_order_zen (products_sort_order),
  KEY idx_manufacturers_id_zen (manufacturers_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;
# --------------------------------------------------------

#
# Table structure for table 'products_attributes'
#

DROP TABLE IF EXISTS products_attributes;
CREATE TABLE products_attributes (
  products_attributes_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  options_id int(11) NOT NULL default '0',
  options_values_id int(11) NOT NULL default '0',
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  products_options_sort_order int(11) NOT NULL default '0',
  product_attribute_is_free tinyint(1) NOT NULL default '0',
  products_attributes_weight float NOT NULL default '0',
  products_attributes_weight_prefix char(1) NOT NULL default '',
  attributes_display_only tinyint(1) NOT NULL default '0',
  attributes_default tinyint(1) NOT NULL default '0',
  attributes_discounted tinyint(1) NOT NULL default '1',
  attributes_image varchar(64) default NULL,
  attributes_price_base_included tinyint(1) NOT NULL default '1',
  attributes_price_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_qty_prices text,
  attributes_qty_prices_onetime text,
  attributes_price_words decimal(15,4) NOT NULL default '0.0000',
  attributes_price_words_free int(4) NOT NULL default '0',
  attributes_price_letters decimal(15,4) NOT NULL default '0.0000',
  attributes_price_letters_free int(4) NOT NULL default '0',
  attributes_required tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (products_attributes_id),
  KEY idx_id_options_id_values_zen (products_id,options_id,options_values_id),
  KEY idx_opt_sort_order_zen (products_options_sort_order)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_attributes_download'
#

DROP TABLE IF EXISTS products_attributes_download;
CREATE TABLE products_attributes_download (
  products_attributes_id int(11) NOT NULL default '0',
  products_attributes_filename varchar(255) NOT NULL default '',
  products_attributes_maxdays int(2) default '0',
  products_attributes_maxcount int(2) default '0',
  PRIMARY KEY  (products_attributes_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_description'
#

DROP TABLE IF EXISTS products_description;
CREATE TABLE products_description (
  products_id int(11) NOT NULL auto_increment,
  language_id int(11) NOT NULL default '1',
  products_name varchar(64) NOT NULL default '',
  products_description text,
  products_url varchar(255) default NULL,
  products_viewed int(5) default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY idx_products_name_zen (products_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_discount_quantity'
#
DROP TABLE IF EXISTS products_discount_quantity;
CREATE TABLE products_discount_quantity (
  discount_id int(4) NOT NULL default '0',
  products_id int(11) NOT NULL default '0',
  discount_qty float NOT NULL default '0',
  discount_price decimal(15,4) NOT NULL default '0.0000',
  KEY idx_id_qty_zen (products_id,discount_qty)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_notifications'
#

DROP TABLE IF EXISTS products_notifications;
CREATE TABLE products_notifications (
  products_id int(11) NOT NULL default '0',
  customers_id int(11) NOT NULL default '0',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (products_id,customers_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_options'
#

DROP TABLE IF EXISTS products_options;
CREATE TABLE products_options (
  products_options_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_name varchar(32) NOT NULL default '',
  products_options_sort_order int(11) NOT NULL default '0',
  products_options_type int(5) NOT NULL default '0',
  products_options_length smallint(2) NOT NULL default '32',
  products_options_comment varchar(64) default NULL,
  products_options_size smallint(2) NOT NULL default '32',
  products_options_images_per_row int(2) default '5',
  products_options_images_style int(1) default '0',
  products_options_rows smallint(2) NOT NULL default '1',
  PRIMARY KEY  (products_options_id,language_id),
  KEY idx_lang_id_zen (language_id),
  KEY idx_products_options_sort_order_zen (products_options_sort_order),
  KEY idx_products_options_name_zen (products_options_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_options_types'
#

DROP TABLE IF EXISTS products_options_types;
CREATE TABLE products_options_types (
  products_options_types_id int(11) NOT NULL default '0',
  products_options_types_name varchar(32) default NULL,
  PRIMARY KEY  (products_options_types_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='Track products_options_types';

# --------------------------------------------------------

#
# Table structure for table 'products_options_values'
#

DROP TABLE IF EXISTS products_options_values;
CREATE TABLE products_options_values (
  products_options_values_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_values_name varchar(64) NOT NULL default '',
  products_options_values_sort_order int(11) NOT NULL default '0',
  PRIMARY KEY (products_options_values_id,language_id),
  KEY idx_products_options_values_name_zen (products_options_values_name),
  KEY idx_products_options_values_sort_order_zen (products_options_values_sort_order)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_options_values_to_products_options'
#

DROP TABLE IF EXISTS products_options_values_to_products_options;
CREATE TABLE products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) NOT NULL auto_increment,
  products_options_id int(11) NOT NULL default '0',
  products_options_values_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_options_values_to_products_options_id),
  KEY idx_products_options_id_zen (products_options_id),
  KEY idx_products_options_values_id_zen (products_options_values_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'products_to_categories'
#

DROP TABLE IF EXISTS products_to_categories;
CREATE TABLE products_to_categories (
  products_id int(11) NOT NULL default '0',
  categories_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id,categories_id),
  KEY idx_cat_prod_id_zen (categories_id,products_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'project_version'
#

DROP TABLE IF EXISTS project_version;
CREATE TABLE project_version (
  project_version_id tinyint(3) NOT NULL auto_increment,
  project_version_key varchar(40) NOT NULL default '',
  project_version_major varchar(20) NOT NULL default '',
  project_version_minor varchar(20) NOT NULL default '',
  project_version_patch1 varchar(20) NOT NULL default '',
  project_version_patch2 varchar(20) NOT NULL default '',
  project_version_patch1_source varchar(20) NOT NULL default '',
  project_version_patch2_source varchar(20) NOT NULL default '',
  project_version_comment varchar(250) NOT NULL default '',
  project_version_date_applied datetime NOT NULL default '0001-01-01 01:01:01',
  PRIMARY KEY  (project_version_id),
  UNIQUE KEY idx_project_version_key_zen (project_version_key)
) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='Database Version Tracking';


# --------------------------------------------------------

#
# Table structure for table 'project_version_history'
#
DROP TABLE IF EXISTS project_version_history;
CREATE TABLE project_version_history (
  project_version_id tinyint(3) NOT NULL auto_increment,
  project_version_key varchar(40) NOT NULL default '',
  project_version_major varchar(20) NOT NULL default '',
  project_version_minor varchar(20) NOT NULL default '',
  project_version_patch varchar(20) NOT NULL default '',
  project_version_comment varchar(250) NOT NULL default '',
  project_version_date_applied datetime NOT NULL default '0001-01-01 01:01:01',
  PRIMARY KEY  (project_version_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='Database Version Tracking History';

# --------------------------------------------------------

#
# Table structure for table 'query_builder'
# This table is used by audiences.php for building data-extraction queries
#
DROP TABLE IF EXISTS query_builder;
CREATE TABLE query_builder (
  query_id int(11) NOT NULL auto_increment,
  query_category varchar(40) NOT NULL default '',
  query_name varchar(80) NOT NULL default '',
  query_description TEXT NOT NULL,
  query_string TEXT NOT NULL,
  query_keys_list TEXT NOT NULL,
  PRIMARY KEY  (query_id),
  UNIQUE KEY query_name (query_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='Stores queries for re-use in Admin email and report modules';

# --------------------------------------------------------

#
# Table structure for table 'record_artists'
#

DROP TABLE IF EXISTS record_artists;
CREATE TABLE record_artists (
  artists_id int(11) NOT NULL auto_increment,
  artists_name varchar(32) NOT NULL default '',
  artists_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (artists_id),
  KEY idx_rec_artists_name_zen (artists_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'record_artists_info'
#

DROP TABLE IF EXISTS record_artists_info;
CREATE TABLE record_artists_info (
  artists_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  artists_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (artists_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'record_company'
#

DROP TABLE IF EXISTS record_company;
CREATE TABLE record_company (
  record_company_id int(11) NOT NULL auto_increment,
  record_company_name varchar(32) NOT NULL default '',
  record_company_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (record_company_id),
  KEY idx_rec_company_name_zen (record_company_name)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'record_company_info'
#

DROP TABLE IF EXISTS record_company_info;
CREATE TABLE record_company_info (
  record_company_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  record_company_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (record_company_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'reviews'
#

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  reviews_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  customers_id int(11) default NULL,
  customers_name varchar(64) NOT NULL default '',
  reviews_rating int(1) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  reviews_read int(5) NOT NULL default '0',
  status int(1) NOT NULL default '1',
  PRIMARY KEY  (reviews_id),
  KEY idx_products_id_zen (products_id),
  KEY idx_customers_id_zen (customers_id),
  KEY idx_status_zen (status),
  KEY idx_date_added_zen (date_added)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'reviews_description'
#

DROP TABLE IF EXISTS reviews_description;
CREATE TABLE reviews_description (
  reviews_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  reviews_text text NOT NULL,
  PRIMARY KEY  (reviews_id,languages_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'salemaker_sales'
#

DROP TABLE IF EXISTS salemaker_sales;
CREATE TABLE salemaker_sales (
  sale_id int(11) NOT NULL auto_increment,
  sale_status tinyint(4) NOT NULL default '0',
  sale_name varchar(30) NOT NULL default '',
  sale_deduction_value decimal(15,4) NOT NULL default '0.0000',
  sale_deduction_type tinyint(4) NOT NULL default '0',
  sale_pricerange_from decimal(15,4) NOT NULL default '0.0000',
  sale_pricerange_to decimal(15,4) NOT NULL default '0.0000',
  sale_specials_condition tinyint(4) NOT NULL default '0',
  sale_categories_selected text,
  sale_categories_all text,
  sale_date_start date NOT NULL default '0001-01-01',
  sale_date_end date NOT NULL default '0001-01-01',
  sale_date_added date NOT NULL default '0001-01-01',
  sale_date_last_modified date NOT NULL default '0001-01-01',
  sale_date_status_change date NOT NULL default '0001-01-01',
  PRIMARY KEY  (sale_id),
  KEY idx_sale_status_zen (sale_status),
  KEY idx_sale_date_start_zen (sale_date_start),
  KEY idx_sale_date_end_zen (sale_date_end)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'sessions'
#

DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  sesskey varchar(255) NOT NULL default '',
  expiry int(11) unsigned NOT NULL default '0',
  value mediumblob NOT NULL,
  PRIMARY KEY  (sesskey)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'specials'
#

DROP TABLE IF EXISTS specials;
CREATE TABLE specials (
  specials_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  specials_new_products_price decimal(15,4) NOT NULL default '0.0000',
  specials_date_added datetime default NULL,
  specials_last_modified datetime default NULL,
  expires_date date NOT NULL default '0001-01-01',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  specials_date_available date NOT NULL default '0001-01-01',
  PRIMARY KEY  (specials_id),
  KEY idx_status_zen (status),
  KEY idx_products_id_zen (products_id),
  KEY idx_date_avail_zen (specials_date_available),
  KEY idx_expires_date_zen (expires_date)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'tax_class'
#

DROP TABLE IF EXISTS tax_class;
CREATE TABLE tax_class (
  tax_class_id int(11) NOT NULL auto_increment,
  tax_class_title varchar(32) NOT NULL default '',
  tax_class_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (tax_class_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'tax_rates'
#

DROP TABLE IF EXISTS tax_rates;
CREATE TABLE tax_rates (
  tax_rates_id int(11) NOT NULL auto_increment,
  tax_zone_id int(11) NOT NULL default '0',
  tax_class_id int(11) NOT NULL default '0',
  tax_priority int(5) default '1',
  tax_rate decimal(7,4) NOT NULL default '0.0000',
  tax_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (tax_rates_id),
  KEY idx_tax_zone_id_zen (tax_zone_id),
  KEY idx_tax_class_id_zen (tax_class_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'template_select'
#

DROP TABLE IF EXISTS template_select;
CREATE TABLE template_select (
  template_id int(11) NOT NULL auto_increment,
  template_dir varchar(64) NOT NULL default '',
  template_language varchar(64) NOT NULL default '0',
  PRIMARY KEY  (template_id),
  KEY idx_tpl_lang_zen (template_language)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------


#
# Table structure for table 'whos_online'
#

DROP TABLE IF EXISTS whos_online;
CREATE TABLE whos_online (
  customer_id int(11) default NULL,
  full_name varchar(64) NOT NULL default '',
  session_id varchar(255) NOT NULL default '',
  ip_address varchar(45) NOT NULL default '',
  time_entry varchar(14) NOT NULL default '',
  time_last_click varchar(14) NOT NULL default '',
  last_page_url varchar(255) NOT NULL default '',
  host_address text NOT NULL,
  user_agent varchar(255) NOT NULL default '',
  KEY idx_ip_address_zen (ip_address),
  KEY idx_session_id_zen (session_id),
  KEY idx_customer_id_zen (customer_id),
  KEY idx_time_entry_zen (time_entry),
  KEY idx_time_last_click_zen (time_last_click),
  KEY idx_last_page_url_zen (last_page_url)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'zones'
#

DROP TABLE IF EXISTS zones;
CREATE TABLE zones (
  zone_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_code varchar(32) NOT NULL default '',
  zone_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (zone_id),
  KEY idx_zone_country_id_zen (zone_country_id),
  KEY idx_zone_code_zen (zone_code)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# --------------------------------------------------------

#
# Table structure for table 'zones_to_geo_zones'
#

DROP TABLE IF EXISTS zones_to_geo_zones;
CREATE TABLE zones_to_geo_zones (
  association_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_id int(11) default NULL,
  geo_zone_id int(11) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (association_id),
  KEY idx_zones_zen (geo_zone_id,zone_country_id,zone_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;















# default data

INSERT INTO template_select VALUES (1, 'classic', '0');

# 1 - Default, 2 - USA, 3 - Spain, 4 - Singapore, 5 - Germany, 6 - UK/GB, 7 - China
INSERT INTO address_format VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country');
INSERT INTO address_format VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country');
INSERT INTO address_format VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country');
INSERT INTO address_format VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO address_format VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');
INSERT INTO address_format VALUES (6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country');
INSERT INTO address_format VALUES (7, '$postcode$cr$country $state $city$cr$streets$cr$company$cr$firstname $lastname','$city / $country');

INSERT INTO admin (admin_id, admin_name, admin_email, admin_pass, admin_profile, last_modified) VALUES
 (1, 'Admin', 'admin@localhost', '351683ea4e19efe34874b501fdbf9792:9b', 1, now());

# Insert default data into admin profiles table
INSERT INTO admin_profiles (profile_id, profile_name) VALUES (1, 'Superuser');

# Insert default data into admin_menus table
INSERT INTO admin_menus (menu_key, language_key, sort_order)
VALUES ('configuration', 'BOX_HEADING_CONFIGURATION', 1),
       ('catalog', 'BOX_HEADING_CATALOG', 2),
       ('modules', 'BOX_HEADING_MODULES', 3),
       ('customers', 'BOX_HEADING_CUSTOMERS', 4),
       ('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
       ('localization', 'BOX_HEADING_LOCALIZATION', 6),
       ('reports', 'BOX_HEADING_REPORTS', 7),
       ('tools', 'BOX_HEADING_TOOLS', 8),
       ('gv', 'BOX_HEADING_GV_ADMIN', 9),
       ('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
       ('extras', 'BOX_HEADING_EXTRAS', 11);

# Insert data into admin_pages table
INSERT INTO admin_pages (page_key, language_key, main_page, page_params, menu_key, display_on_menu, sort_order)
VALUES ('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
       ('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
       ('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
       ('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
       ('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
       ('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
       ('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
       ('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
       ('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
       ('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
       ('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
       ('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
       ('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
       ('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
       ('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
       ('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
       ('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
       ('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
       ('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
       ('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
       ('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
       ('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
       ('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
       ('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
       ('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
       ('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
       ('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
       ('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
       ('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
       ('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
       ('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
       ('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
       ('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
       ('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
       ('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
       ('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
       ('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
       ('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
       ('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
       ('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
       ('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
       ('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
       ('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
       ('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
       ('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
       ('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
       ('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
       ('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
       ('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
       ('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
       ('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
       ('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
       ('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
       ('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2),
       ('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
       ('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
       ('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
       ('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
       ('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
       ('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
       ('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
       ('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
       ('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
       ('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
       ('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
       ('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
       ('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
       ('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
       ('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
       ('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
       ('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
       ('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
       ('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
       ('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
       ('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
       ('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
       ('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
       ('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
       ('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
       ('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
       ('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
       ('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
       ('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
       ('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
       ('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
       ('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
       ('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
       ('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
       ('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
       ('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
       ('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5);

INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/zencart_cn_logo.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('还考虑什么? 现在就装一个吧!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-12 20:53:18', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', 0, NULL, NULL, '2005-05-13 10:54:38', NULL, 1, 1, 1, 10);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/big-book-ad.gif', 'Wide-Banners', '', '0', NULL, NULL, '2007-02-10 00:00:00',NULL,'1','1','1','1');
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'SideBox-Banners', '', '0', NULL, NULL, '2007-02-10 00:00:00',NULL,'1','1','1','1');
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/logo-zencart-cn-125.gif', 'BannersAll', '', '0', NULL, NULL, '2005-12-10 00:00:00',NULL,'1','1','1','15');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商店名称', 'STORE_NAME', 'Zen Cart', '商店名称', '1', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('店主', 'STORE_OWNER', 'Team Zen Cart', '店主的名字', '1', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('客服电话', 'STORE_TELEPHONE_CUSTSERVICE', '', '请输入客服电话，可能用于支付处理。', '1', '3', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('国家或地区', 'STORE_COUNTRY', '44', '商店所在的国家或地区 <br /><br /><strong>备注: 请记住更新商店所在地区。</strong>', '1', '6', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('地区', 'STORE_ZONE', '131', '商店所在地区', '1', '7', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('预售商品排序', 'EXPECTED_PRODUCTS_SORT', 'desc', '预售商品方框的排序.', '1', '8', 'zen_cfg_select_option(array(\'asc\', \'desc\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('预售商品排序字段', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', '预售商品方框的排序字段.', '1', '9', 'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('使用缺省语言货币', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'true', '自动转换到选择语言的相应货币', '1', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('语言选择', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', '商店缺省的语言选择为商店的设置，还是用户浏览器中的设置？<br /><br />Default: 商店的缺省设置', '1', '11', 'zen_cfg_select_option(array(\'Default\', \'Browser\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('使用搜索引擎友好的URLs (还在开发中)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', '6', '12', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('添加商品后显示购物车', 'DISPLAY_CART', 'true', '添加商品后显示购物车 (或退回原来的状态)', '1', '14', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('缺省搜索操作', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', '缺省搜索操作', '1', '17', 'zen_cfg_select_option(array(\'and\', \'or\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商店地址和电话', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', '商店名称, 地址和电话号码, 用于打印文件和在线显示', '1', '7', 'zen_cfg_textarea(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示分类计数', 'SHOW_COUNTS', 'false', '递归计算分类中商品数量', '1', '19', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('税收小数位', 'TAX_DECIMAL_PLACES', '0', '税收金额的小数位', '1', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示含税价格', 'DISPLAY_PRICE_WITH_TAX', 'false', '显示含税价格 (True) 或 最后再加税 (False)', '1', '21', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在管理页面中显示含税价格', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', '在管理页面中(发票), 显示含税价格 (True) 或 最后再加税 (False)', '1', '21', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品税的计算', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', '计算商品税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址', '1', '21', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('运费税的计算', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', '计算运费税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址 - 货运模块可以覆盖该设置', '1', '21', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('销售税显示', 'STORE_TAX_DISPLAY_STATUS', '0', '即使金额为零也显示销售税<br />0= 否<br />1= 是', '1', '21', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分开显示税项', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', '如果有多个税项，结帐时每个税项单独显示一行', '1', '22', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('PA-DSS 管理页面 Session 超时设置?', 'PADSS_ADMIN_SESSION_TIMEOUT_ENFORCED', '1', 'PA-DSS 规范要求管理页面在15分钟没有操作时关闭。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', 1, 30, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('PA-DSS 高强度密码设置?', 'PADSS_PWD_EXPIRY_ENFORCED', '1', 'PA-DSS 规范要求管理员密码90天必须修改，且不能使用最近4次密码。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', 1, 30, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('PA-DSS Ajax 结帐?', 'PADSS_AJAX_CHECKOUT', '1', 'PA-DSS 兼容要求支付模块使用 ajax 生成结帐确认页面。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', 1, 30, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added) VALUES ('管理对话超时秒数', 'SESSION_TIMEOUT_ADMIN', '900', '输入以秒为单位的时间。<br />PCI 兼容要求最大不超过 900 。<br /> 默认=900<br />例如: 900= 15 分钟<br /><br />备注: 时间太短会导致添加/编辑商品时超时', 1, 40, NULL, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('管理设置最大进程执行时间', 'GLOBAL_SET_TIME_LIMIT', '60', '输入以秒为单位的时间, 管理设置最大进程执行时间。<br />缺省=60 秒<br />例如: 60= 1 分钟<br /><br />备注: 仅当您进程执行时间有问题时, 才需要修改该时间限制', 1, 42, NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示是否有新版本', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', '自动显示是否有Zen Cart新版本。打开该选项有时会降低管理页面打开时间。(显示于登录后的主索引页面和服务器信息页面)', 1, 44, 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商店模式', 'STORE_STATUS', '0', '商店模式<br />0= 正常<br />1= 商品展示, 不显示价格<br />2= 商品展示, 显示价格', '1', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('服务器运行时数', 'DISPLAY_SERVER_UPTIME', 'true', '显示服务器运行时数在某些服务器上会导致日志文件中有错误记录。(true = 显示, false = 不显示)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('丢失页面检测', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart能够检测不存在的页面并自动调转到索引页面。调试时可关闭该选项。<br /><br /><strong>缺省=On</strong><br />On = 如有不存在的页面，调整到\'index\'<br />Off = 不检测不存在的页面<br />Page Not Found = 显示页面不存在的提示页面', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('cURL代理服务器状态', 'CURL_PROXY_REQUIRED', 'False', '您的cURL是否使用代理服务器?', 6, '50', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('cURL代理服务器地址', 'CURL_PROXY_SERVER_DETAILS', '', '如果您的主机需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: 127.0.0.1:3128', 6, 51, NULL, now(), NULL, NULL);


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('HTML编辑器', 'HTML_EDITOR_PREFERENCE', 'NONE', '请选择用于管理电子邮件、电子商情和商品简介的文本编辑器。', '1', '110', 'zen_cfg_pull_down_htmleditors(', now());
#phpbb
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('打开phpBB链接?', 'PHPBB_LINKS_ENABLED', 'false', 'Zen Cart的新帐号要和您的(已安装)phpBB论坛同步吗?', '1', '120', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示分类计数 - 管理员', 'SHOW_COUNTS_ADMIN', 'true', '在管理页面显示分类计数吗?', '1', '19', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示分类的链接状态', 'SHOW_CATEGORY_PRODUCTS_LINKED_STATUS', 'true', '显示分类产品链接状态?', '1', '19', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('货币兑换比率', 'CURRENCY_UPLIFT_RATIO', '1.05', '自动更新汇率时，需要使用的"额外"比率是多少？<br />例如: 从汇率服务器更新银行汇率后，您要在银行汇率基础上增加多少比例来设置给客户的汇率？<br /><br /><strong>缺省: 1.05 </strong><br />将公布的银行汇率乘以1.05作为商店的汇率。', 1, 55, NULL, now(), NULL, NULL);


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('名字', 'ENTRY_FIRST_NAME_MIN_LENGTH', '1', '名字最少字数', '2', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('姓氏', 'ENTRY_LAST_NAME_MIN_LENGTH', '1', '姓氏最少字数', '2', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('生日', 'ENTRY_DOB_MIN_LENGTH', '10', '生日最少字数', '2', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('电子邮件', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', '电子邮件地址最少字数', '2', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('地址', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '4', '地址最少字数', '2', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('公司', 'ENTRY_COMPANY_MIN_LENGTH', '0', '公司名称最少字数', '2', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('邮编', 'ENTRY_POSTCODE_MIN_LENGTH', '4', '邮编最少字数', '2', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('城市', 'ENTRY_CITY_MIN_LENGTH', '2', '城市最少字数', '2', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('省份', 'ENTRY_STATE_MIN_LENGTH', '2', '省份最少字数', '2', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('电话号码', 'ENTRY_TELEPHONE_MIN_LENGTH', '6', '电话号码最少字数', '2', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('密码', 'ENTRY_PASSWORD_MIN_LENGTH', '7', '密码最少字数', '2', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('信用卡持卡人姓名', 'CC_OWNER_MIN_LENGTH', '2', '信用卡持卡人姓名最少字数', '2', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('信用卡号', 'CC_NUMBER_MIN_LENGTH', '10', '信用卡号码最少字数', '2', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('信用卡CVV校验码', 'CC_CVV_MIN_LENGTH', '3', '信用卡CVV校验码最少字数', '2', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品评论文字', 'REVIEW_TEXT_MIN_LENGTH', '1', '商品评论文字最少字数', '2', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('畅销商品', 'MIN_DISPLAY_BESTSELLERS', '1', '成为畅销商品的最小销售数量', '2', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('同时购买商品', 'MIN_DISPLAY_ALSO_PURCHASED', '1', '显示为客户同时购买商品的最少数量', '2', '16', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('昵称', 'ENTRY_NICK_MIN_LENGTH', '1', '昵称最少字数', '2', '1', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('地址簿条目', 'MAX_ADDRESS_BOOK_ENTRIES', '5', '每个客户地址簿中最多允许的条目', '3', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('管理页面每页搜索结果', 'MAX_DISPLAY_SEARCH_RESULTS', '20', '管理页面搜索结果的商品数量', '3', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('前/后页导航页链接', 'MAX_DISPLAY_PAGE_LINKS', '5', '导航链接显示的数目的数量', '3', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('首页新进商品数量', 'MAX_DISPLAY_NEW_PRODUCTS', '9', '显示在首页的新进商品数量', '3', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('首页推荐商品数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', '显示在首页的推荐商品数量', '3', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('首页特价商品数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '10', '显示在首页的特价商品数量', '3', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('预售商品数量', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', '显示的预售商品数量', '3', '7', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('特价商品列表数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '6', '特价商品列表每页显示的商品数量', '3', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('新进商品列表数量', 'MAX_DISPLAY_PRODUCTS_NEW', '10', '新进商品列表每页显示的商品数量', '3', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('推荐商品列表数量', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', '推荐商品列表每页显示的商品数量', '3', '29', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('所有商品列表数量', 'MAX_DISPLAY_PRODUCTS_ALL', '10', '所有商品列表每页显示的商品数量', '3', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分类商品列表数量', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', '分类商品列表每页显示的商品数量', '3', '12', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('畅销商品数量', 'MAX_DISPLAY_BESTSELLERS', '10', '畅销商品数量', '3', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('同时购买商品数量', 'MAX_DISPLAY_ALSO_PURCHASED', '6', '\'客户同时购买的商品\'方框中显示的商品数量', '3', '14', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('边框中随机推荐商品数量', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', '在边框中显示的随机推荐商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('边框中随机新进商品数量', 'MAX_RANDOM_SELECT_NEW', '3', '在边框中显示的随机新进商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '16', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('边框中随机特价商品数量', 'MAX_RANDOM_SELECT_SPECIALS', '2', '在边框中显示的随机特价商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '17', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('边框中随机商品评论数量', 'MAX_RANDOM_SELECT_REVIEWS', '1', '在边框中显示的随机商品评论的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '18', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('每页商品评论数量', 'MAX_DISPLAY_NEW_REVIEWS', '6', '每页显示的商品评论数量', '3', '19', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('厂商列表 - 滚动栏大小/样式', 'MAX_MANUFACTURERS_LIST', '3', '滚动栏窗口里显示的厂商数目。如果设为1或0显示下拉菜单', '3', '20', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('厂商列表 - 检验商品存在', 'PRODUCTS_MANUFACTURERS_STATUS', '1', '要显示厂商名字，保证至少存在一个有效商品<br /><br />提示: 当该开关为开启时，如果有很多商品或厂商，会影响网站速度<br />0= 关 1= 开', '3', '21', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('音乐类型列表 - 滚动栏大小/样式', 'MAX_MUSIC_GENRES_LIST', '3', '滚动栏窗口里显示的音乐类型数目. 如果设为1或0会显示下拉菜单。', '3', '22', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('唱片公司列表 - 滚动栏大小/样式', 'MAX_RECORD_COMPANY_LIST', '3', '滚动栏窗口里显示的唱片公司数目. 如果设为1或0会显示下拉菜单。', '3', '23', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('唱片公司名称长度', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', '用于唱片公司栏; 唱片公司名称显示的最大长度. 太长的名字会被截断.', '3', '24', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('音乐类型名称长度', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', '用于音乐类型栏; 音乐类型名称显示的最大长度. 太长的名字会被截断.', '3', '25', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('厂商名字长度', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', '用于厂商栏; 厂商名字显示的最大长度. 太长的名字会被截断.', '3', '26', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('每行分类数目', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', '每行分类数目', '3', '27', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('最近购买边框- 备注: 边框已关闭', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', '最近购买边框中显示的商品数量', '3', '28', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('每页显示的客户订单数', 'MAX_DISPLAY_ORDER_HISTORY', '10', '\'我的帐号\'订单历史中显示的订单数目', '3', '29', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('客户页显示最大客户数', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', '3', '30', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('订单页显示最大订单数', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', '3', '31', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分析系统页面显示的商品数', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', '3', '32', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('最大分类商品显示列表', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', '每页显示的商品数目', '3', '33', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品属性 - 选项名称和值的显示', 'MAX_ROW_LISTS_OPTIONS', '10', '显示在商品属性页面的选项名称和值的数量', '3', '34', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品属性 - 属性数量的显示', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', '显示在商品属性控制页面的属性数量', '3', '35', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品属性 - 下载管理显示', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', '下载管理页面显示的下载数量', '3', '36', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('推荐商品 - 显示在管理页面的数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', '管理页面下每屏的推荐商品数量', '3', '37', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('新进商品的定义', 'SHOW_NEW_PRODUCTS_LIMIT', '0', '新进商品列表的定义<br />0= 所有商品<br />1= 当前月份<br />7= 7 天<br />14= 14 天<br />30= 30 天<br />60= 60 天<br />90= 90 天<br />120= 120 天', '3', '40', 'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示语言图标的数目', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', '语言边框中每行显示的语言图标的数目', '3', '50', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('最大文件上传大小', 'MAX_FILE_UPLOAD_SIZE', '2048000', '允许上传文件的大小<br />缺省= 2048000', '3', '60', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许上传的文件名后缀', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', '列出允许客户上传到您网站的文件类型 (文件名后缀)。用逗号(,)分开。不要包含点(.)。<br /><br />建议设置: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', '3', '61', 'zen_cfg_textarea(', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('管理订单下显示的订单内容', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', '最多订单内容数<br />0 = 无限制', '3', '65', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('管理页面显示的PayPal IPN的数量', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', '管理页面显示PayPal IPN的数量<br />缺省为20', '3', '66', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品链接多个分类的显示', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', '商品链接到多个分类的管理界面下，显示的列数<br />3 = 缺省', '3', '70', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('简易页面的显示数量', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', '简易页面的显示数量<br />20 = 缺省', '3', '71', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('小图像宽度', 'SMALL_IMAGE_WIDTH', '100', '小图像象素宽度', '4', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('小图像高度', 'SMALL_IMAGE_HEIGHT', '80', '小图像象素高度', '4', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('标题图像宽度 - 管理页面', 'HEADING_IMAGE_WIDTH', '57', '管理页面的标题图像象素宽度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', '4', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('标题图像高度 - 管理页面', 'HEADING_IMAGE_HEIGHT', '40', '管理页面的标题图像象素高度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', '4', '4', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('子分类图像宽度', 'SUBCATEGORY_IMAGE_WIDTH', '100', '子分类图像象素宽度', '4', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('子分类图像高度', 'SUBCATEGORY_IMAGE_HEIGHT', '57', '子分类图像象素高度', '4', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('计算图像尺寸', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', '是否计算图像尺寸?', '4', '7', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示缺少的图像', 'IMAGE_REQUIRED', 'true', '显示缺少的图像。适合调试。', '4', '8', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('图像 - 购物车状态', 'IMAGE_SHOPPING_CART_STATUS', '1', '是否在购物车中显示商品图像?<br />0= 否 1= 是', 4, 9, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 购物车宽度', 'IMAGE_SHOPPING_CART_WIDTH', '50', '缺省 = 50', 4, 10, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 购物车高度', 'IMAGE_SHOPPING_CART_HEIGHT', '40', '缺省 = 40', 4, 11, now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分类图像宽度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_WIDTH', '57', '商品信息页面的分类图标的象素宽度', '4', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('分类图像高度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', '商品信息页面的分类图标的象素高度', '4', '14', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('含子分类的分类图像宽度', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', '含子分类的分类图像宽度', '4', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('含子分类的分类图像高度', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', '含子分类的分类图像高度', '4', '16', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 图像宽度', 'MEDIUM_IMAGE_WIDTH', '150', '商品信息图像的象素宽度', '4', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 图像高度', 'MEDIUM_IMAGE_HEIGHT', '120', '商品信息图像的象素高度', '4', '21', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 中图像后缀', 'IMAGE_SUFFIX_MEDIUM', '_MED', '商品信息 - 中图像后缀<br />缺省 = _MED', '4', '22', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 大图像后缀', 'IMAGE_SUFFIX_LARGE', '_LRG', '商品信息 - 大图像后缀<br />缺省 = _LRG', '4', '23', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 每行附加图像数目', 'IMAGES_AUTO_ADDED', '3', '商品信息 - 每行附加图像数目<br />缺省 = 3', '4', '30', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 商品列表宽度', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', '缺省 = 100', 4, 40, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 商品列表高度', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', '缺省 = 80', 4, 41, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 新进商品列表宽度', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', '缺省 = 100', 4, 42, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 新进商品列表高度', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', '缺省 = 80', 4, 43, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 新进商品宽度', 'IMAGE_PRODUCT_NEW_WIDTH', '100', '缺省 = 100', 4, 44, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 新进商品高度', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', '缺省 = 80', 4, 45, now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 推荐商品宽度', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', '缺省 = 100', 4, 46, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 推荐商品高度', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', '缺省 = 80', 4, 47, now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 所有商品列表宽度', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', '缺省 = 100', 4, 48, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('图像 - 所有商品列表高度', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', '缺省 = 80', 4, 49, now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品图像 - 缺省图象状态', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', '如果商品没有图像，是否使用缺省图象<br />0= 否<br />1= 是', '4', '60', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品图像 - 缺省图象', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', '如果商品没有图像，使用的缺省图象的文件名<br />缺省 = no_picture.gif', '4', '61', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('图像 - 商品和分类使用同比例的图像', 'PROPORTIONAL_IMAGES_STATUS', '1', '商品和分类使用同比例的图像吗?<br /><br />提示: 图像比例中不要设置高度或宽度为0<br />0= 关 1= 开', 4, 75, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('称呼字段', 'ACCOUNT_GENDER', 'true', '创建帐号时显示性别选择字段，用于发送电子邮件时的称呼。', '5', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('生日字段', 'ACCOUNT_DOB', 'true', '创建帐号时显示生日字段<br />说明: 生日字段的最小值设置为空时，该字段为可选项<br />生日字段的最小值>0时为必选项', '5', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('公司字段', 'ACCOUNT_COMPANY', 'false', '创建帐号时显示公司字段', '5', '3', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('地址行二', 'ACCOUNT_SUBURB', 'true', '创建帐号时显示地址行二字段', '5', '4', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('省份', 'ACCOUNT_STATE', 'true', '创建帐号时显示省份字段', '5', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('省份 - 总是显示下拉菜单？', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', '省份总是显示为下拉菜单吗？', 5, '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('创建帐号时的缺省国家', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', '设置新建帐号时的默认国家：<br />默认为美国', '5', '6', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('传真号码', 'ACCOUNT_FAX_NUMBER', 'true', '创建帐号时显示传真号码字段', '5', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示电子商情选择框', 'ACCOUNT_NEWSLETTER_STATUS', '1', '显示电子商情选择框<br />0= 否<br />1= 显示未选择<br />2= 显示已选择<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章</strong>', 5, 45, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('缺省电子邮件格式', 'ACCOUNT_EMAIL_PREFERENCE', '0', '设置客户缺省电子邮件格式<br />0= 文本<br />1= HTML<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章。</strong>', 5, 46, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品通知', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', '结帐时是否提示客户商品通知<br />0= 不提示<br />1= 提示 (除非已选择全局通知)<br /><br />提示: 边框要另外关闭', '5', '50', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('购物模式 - 查看商品和价格', 'CUSTOMERS_APPROVAL', '0', '客户是否需要批准后才能购物<br />0= 不需要<br />1= 登录后才能浏览<br />2= 可以浏览，但登录后才显示价格<br />3= 演示用途<br /><br />建议选项 2 用于防止Spiders，如果您希望客户登录后才能查看价格。', '5', '55', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

#customer approval to shop
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('客户批准模式 - 授权等待中', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', '客户是否需要授权后才能购物<br />0= 不需要授权<br />1= 授权后才能浏览<br />2= 可以浏览，但授权后才显示价格<br />3= 客户可以浏览商品和价格，但需要授权后才可购物<br /><br />推荐使用选项 2 或 3 防止Spiders', '5', '65', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 文件名', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', '客户授权的文件名<br />提示: 不要包含后缀<br />缺省=customers_authorization', '5', '66', '', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 隐藏页眉', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', '客户授权: 隐藏页眉 <br />(true=隐藏 false=显示)', '5', '67', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 隐藏左栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', '客户授权: 隐藏左栏目 <br />(true=隐藏 false=显示)', '5', '68', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 隐藏右栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', '客户授权: 隐藏右栏目 <br />(true=隐藏 false=显示)', '5', '69', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 隐藏页脚', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', '客户授权: 隐藏页脚 <br />(true=隐藏 false=显示)', '5', '70', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('客户授权: 隐藏价格', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', '客户授权: 隐藏价格 <br />(true=隐藏 false=显示)', '5', '71', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('客户推荐模式', 'CUSTOMERS_REFERRAL_STATUS', '0', '客户推荐代码创建于<br />0= 关闭<br />1= 用户使用的第一张优惠券的号码<br />2= 客户可以在创建帐号时添加，如果为空可以编辑<br /><br />提示: 一旦客户推荐号码设置好，只能在客户管理下修改', '5', '80', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('已安装支付模块', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', '支付模块文件名用分号隔开。自动更新，无需编辑。(例如: freecharger.php;cod.php;paypal.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('已安装总额计算模块', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', '总额计算模块文件名用分号分开。自动更新，无需编辑。(例如: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('已安装配送模块', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', '配送模块文件名用分号分开。自动更新，无需编辑。(例如: ups.php;flat.php;item.php)', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('启用免运费模块', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', '要启用免运费模块吗?', 6, 0, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('商店提货', 'MODULE_SHIPPING_STOREPICKUP_LOCATIONS_LIST', '自行提货', '输入以分号(;)分开的地点列表。<br>可以在每个地点后加上逗号和数字来设定一个手续费。如果没有设定数字，将使用下一个设置的运费值。<br><br>例如:<br>121 Main Street;20 Church Street<br>Sunnyside,4.00;Lee Park,5.00;High Street,0.00<br>Dallas;Tulsa,5.00;Phoenix,0.00<br>多语言请参考本模块语言文件中的说明。', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('免运费成本', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', '免运费成本?', 6, 6, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('手续费', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', '免运费手续费。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', '免运费手续费税率。', 6, 0, now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('免运费地区', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', '如果免运费，仅限于该地区。', 6, 0, now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', '显示排序。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('商店提货', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', '使用商店提货?', 6, 0, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('商店提货费用', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', '商店提货费用。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', '商店提货处理费税率。', 6, 0, now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率基准', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', 6, 0, now(), NULL, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('配送地区', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', 6, 0, now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', '显示的排序。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('按件计价', 'MODULE_SHIPPING_ITEM_STATUS', 'True', '使用按件计价吗?', 6, 0, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('运输费用', 'MODULE_SHIPPING_ITEM_COST', '2.50', '运输费用随订单内件数的增加而增加的配送方式。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('手续费', 'MODULE_SHIPPING_ITEM_HANDLING', '0', '此配送方式的手续费。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', '此运费用下面的税率。', 6, 0, now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率基准', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', 6, 0, now(), NULL, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('配送地区', 'MODULE_SHIPPING_ITEM_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式.', 6, 0, now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', '显示的顺序。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('启用免费商品模块', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', '您接受商品免费吗?', 6, 1, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('显示排序.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', '显示的顺序。低的显示在前。', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('支付地区', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', '如果选择地区则仅限该地区使用此支付方式。', 6, 2, now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('设置订单状态', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', '设置该支付方式下订单状态为', 6, 0, now(), 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('打开PayPal支付模块', 'MODULE_PAYMENT_PAYPAL_STATUS', 'True', '您要使用PayPal支付方式吗?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('商业编号', 'MODULE_PAYMENT_PAYPAL_BUSINESS_ID', 'admin@localhost', '您的PayPal帐号的主要电子邮件地址<br />说明：该地址必须与PayPal上设置的主要电子邮件地址<strong>完全一致</strong>，并且要注意<strong>大小写</strong>。', '6', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('交易货币', 'MODULE_PAYMENT_PAYPAL_CURRENCY', 'Selected Currency', '随订单发送到PayPal的货币<br />说明: 如果选择了非PayPal支持的货币，将自动转换为美元。', '6', '3', 'zen_cfg_select_option(array(\'Selected Currency\', \'Only USD\', \'Only AUD\', \'Only CAD\', \'Only EUR\', \'Only GBP\', \'Only CHF\', \'Only CZK\', \'Only DKK\', \'Only HKD\', \'Only HUF\', \'Only JPY\', \'Only NOK\', \'Only NZD\', \'Only PLN\', \'Only SEK\', \'Only SGD\', \'Only THB\', \'Only MXN\', \'Only ILS\', \'Only PHP\', \'Only TWD\', \'Only BRL\', \'Only MYR\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('付款地区', 'MODULE_PAYMENT_PAYPAL_ZONE', '0', '如果选择了付款地区，仅该地区可以使用该支付模块。', '6', '4', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('设置通知状态', 'MODULE_PAYMENT_PAYPAL_PROCESSING_STATUS_ID', '1', '设置通过该支付方式付款，但还没有完成的订单状态为<br />(推荐状态\'等待中\')', '6', '5', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('设置订单状态', 'MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID', '2', '设置通过该支付方式付款的订单状态<br />(推荐\'处理中\')', '6', '6', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('退款订单状态', 'MODULE_PAYMENT_PAYPAL_REFUND_ORDER_STATUS_ID', '1', '设置通过该支付方式退款的订单状态<br />(推荐\'等待中\')', '6', '7', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('显示顺序', 'MODULE_PAYMENT_PAYPAL_SORT_ORDER', '0', '显示顺序：小的显示在前。', '6', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('地址替代', 'MODULE_PAYMENT_PAYPAL_ADDRESS_OVERRIDE', '1', '如果设置为 1，Zen Cart输入的地址会替代客户在PayPal上储存的地址。客户将看到Zen Cart的地址，但不能修改。<br />(如地址不正确，PayPal将认为没有提交地址或者override=0)<br />0=不覆盖<br />1=ZC地址替代PayPal地址', '6', '18', 'zen_cfg_select_option(array(\'0\',\'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('送货地址选项', 'MODULE_PAYMENT_PAYPAL_ADDRESS_REQUIRED', '2', '送货地址。如果设置为 0，将提示您的客户输入送货地址。如果设置为 1，将不提示客户输入送货地址。如果设置为 2，客户必须输入送货地址。<br />0=提示<br />1=不询问<br />2=必须<br /><br /><strong>提示: 如果允许客户输入自己的送货地址，您一定要核对PayPal确认信息上地址无误。使用Website Payments Standard (IPN), Zen Cart 不知道客户是否会选择和订单上不同的送货地址。</strong>', '6', '20', 'zen_cfg_select_option(array(\'0\',\'1\',\'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('购物车商品清单', 'MODULE_PAYMENT_PAYPAL_DETAILED_CART', 'No', '要向PayPal传递详细的商品清单吗? 如设置为True，将传递详细的购物清单', '6', '22', 'zen_cfg_select_option(array(\'No\',\'Yes\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('页面风格', 'MODULE_PAYMENT_PAYPAL_PAGE_STYLE', 'Primary', '定制付款页面的风格。页面风格的值是您添加或编辑页面风格时输入的名字。您可以在PayPal网址上，添加或修改客户定制的付款页面风格，位于我的帐号选项下面。如果您要使用主要风格，设置为\"primary.\" 如果要使用缺省风格，设置为\"paypal\".', '6', '25', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('PayPal服务的模式<br /><br />缺省:<br /><code>www.paypal.com/cgi-bin/webscr</code><br />或者<br /><code>www.paypal.com/us/cgi-bin/webscr</code><br />or for the UK,<br /><code>www.paypal.com/uk/cgi-bin/webscr</code>', 'MODULE_PAYMENT_PAYPAL_HANDLER', 'www.paypal.com/cgi-bin/webscr', '选择PayPal正式交易的网址', '6', '73', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('PDT Token (Payment Data Transfer)', 'MODULE_PAYMENT_PAYPAL_PDTTOKEN', '', '在这里输入PDT Token值，在处理结束后立刻激活交易。', '6', '25', now(), 'zen_cfg_password_display');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('调试模式', 'MODULE_PAYMENT_PAYPAL_IPN_DEBUG', 'Off', '打开调试模式吗? <br />说明: 会发送大量用于调试的邮件!<br />记录文件位于/includes/modules/payment/paypal/logs 目录<br />电子邮件发送到店主的邮箱。<br />不建议使用邮件选项。<br /><strong>通常设置为OFF。</strong>', '6', '71', 'zen_cfg_select_option(array(\'Off\',\'Log File\',\'Log and Email\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('调试电子邮件地址', 'MODULE_PAYMENT_PAYPAL_DEBUG_EMAIL_ADDRESS','admin@localhost', '用于接收调试信息的电子邮件地址', '6', '72', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('含税', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', '计算时含税?', 6, 6, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, now(), NULL, 'zen_cfg_select_option(array(\'true\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', '显示的顺序.', 6, 2, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('含运费', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', '计算时含运费?', 6, 5, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('重算税价', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', '重新计算税', 6, 7, now(), NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('税率', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', '团体优惠时使用税率.', 6, 0, now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('使用固定运费', 'MODULE_SHIPPING_FLAT_STATUS', 'True', '您要使用固定运费吗?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('配送费用', 'MODULE_SHIPPING_FLAT_COST', '5.00', '所有订单都收取该费用。', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('税率种类', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', '采用下面的运费税种。', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('税率基准', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', '6', '0', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('配送地区', 'MODULE_SHIPPING_FLAT_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', '6', '0', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示排序', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', '显示的顺序', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('缺省货币', 'DEFAULT_CURRENCY', 'USD', '缺省货币', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('缺省语言', 'DEFAULT_LANGUAGE', 'en', '缺省语言', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('缺省的新订单状态', 'DEFAULT_ORDERS_STATUS_ID', '1', '新建一个订单时，订单状态为该值。', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示管理configuration_key', 'ADMIN_CONFIGURATION_KEY_ON', '0', '设置为1将在配置页面下显示configuration_key的名称', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('始发国家或地区', 'SHIPPING_ORIGIN_COUNTRY', '223', '选择计算运费的始发国家或地区。', '7', '1', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('邮编', 'SHIPPING_ORIGIN_ZIP', 'NONE', '输入商店邮编，用于运费计算。', '7', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('最大包裹重量', 'SHIPPING_MAX_WEIGHT', '50', '邮递公司对单件包裹的最大重量限制。', '7', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('小包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_WEIGHT', '0:3', '输入小包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', '7', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('大包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_PADDING', '10:0', '输入大包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', '7', '5', now());

# moved to product_types
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('虚拟商品缺省状态 - 不需要送货地址', 'PRODUCTS_VIRTUAL_DEFAULT', '0', '添加新进商品时，缺省的虚拟商品的状态是什么?<br /><br />0= 虚拟商品缺省为关闭<br />1= 虚拟商品缺省为打开<br />提示: 虚拟商品不需要送货地址', '7', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品免运费缺省状态 - 正常运费', 'PRODUCTS_IS_ALWAYS_FREE_SHIPPING_DEFAULT', '0', '添加新进商品时，缺省的免运费状态是什么?<br /><br />0= 免运费缺省为关闭<br />1= 免运费缺省为打开<br />提示: 免运费商品需要送货地址', '7', '11', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示箱数和重量', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', '显示货物重量和箱数?<br /><br />0= 否<br />1= 只显示箱数<br />2= 只显示重量<br />3= 箱数和重量', '7', '15', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('运费估价显示', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= 否<br />1= 在购物车上显示按钮<br />2= 在购物车页面显示列表', '7', '20', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('在发票管理中显示订单说明', 'ORDER_COMMENTS_INVOICE', '1', '在发票管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '25', now(), NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('在装箱单管理中显示订单说明', 'ORDER_COMMENTS_PACKING_SLIP', '1', '在装箱单管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '26', now(), NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('无重量商品免运费', 'ORDER_WEIGHT_ZERO_STATUS', '0', '如果订单商品重量为零，免运费吗?<br />0= 否<br />1= 是<br /><br />提示: 免运费时，打开免运费模块，这只会在免运费时显示。', '7', '15', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品图像', 'PRODUCT_LIST_IMAGE', '1', '要显示商品图像吗?', '8', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示厂商名字','PRODUCT_LIST_MANUFACTURER', '0', '要显示商品厂商名字吗?', '8', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品型号', 'PRODUCT_LIST_MODEL', '0', '要显示商品型号吗?', '8', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品名称', 'PRODUCT_LIST_NAME', '2', '要显示商品名称吗?', '8', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品价格/加入购物车', 'PRODUCT_LIST_PRICE', '3', '要显示商品价格/添加到购物车吗?', '8', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品数量', 'PRODUCT_LIST_QUANTITY', '0', '要显示商品数量吗?', '8', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品重量', 'PRODUCT_LIST_WEIGHT', '0', '要显示商品重量吗?', '8', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品价格/添加到购物车方框的宽度', 'PRODUCTS_LIST_PRICE_WIDTH', '125', '定义商品价格/添加到购物车方框的宽度<br />缺省= 125', '8', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示分类/厂商过滤 (0=关; 1=开)', 'PRODUCT_LIST_FILTER', '1', '要显示分类/厂商过滤吗?', '8', '9', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('前/后分页导航条 (1-页面顶部, 2-页面底部, 3-同时)', 'PREV_NEXT_BAR_LOCATION', '3', '设置前/后分页导航条的位置', '8', '10', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品列表缺省排序', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', '商品列表缺省排序<br />提示: 留空为商品排序。按照您指定的顺序排序商品列表。例如: 2a', '8', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', '要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong> 如果采用选项2，请关闭下面的多个商品数量方框', '8', '20', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示多个商品数量方框状态和设置按钮位置', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '8', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品介绍', 'PRODUCT_LIST_DESCRIPTION', '150', '要显示商品介绍吗?<br /><br />0= 否<br />150= 建议长度, 或输入显示的最多字数', '8', '30', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品列表升序标记', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', '用于表示升序的标记<br />缺省 = +', 8, 40, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品列表降序标记', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', '用于表示降序的标记<br />缺省 = -', 8, 41, NULL, now(), NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品列表中显示字母过滤选择', 'PRODUCT_LIST_ALPHA_SORTER', 'true', '在商品列表中显示字母过滤的选择吗?', '8', '50', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示商品列表子分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', '在商品列表中显示子分类图像吗?', '8', '52', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示商品列表总分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', '在商品列表中显示总分类图像吗?', '8', '53', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('导航显示子分类', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', '经由总分类导航时显示子分类<br /><br />0= 否<br />1= 是', '8', '60', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('检查库存', 'STOCK_CHECK', 'true', '检查库存是否足够', '9', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('减少库存', 'STOCK_LIMITED', 'true', '按照订单从库存中自动减少商品', '9', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许结帐', 'STOCK_ALLOW_CHECKOUT', 'true', '即使库存不够，也允许客户结帐', '9', '3', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示缺货', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', '在屏幕上提示客户商品库存量不足', '9', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('重新进货', 'STOCK_REORDER_LEVEL', '5', '定义何时需要重新进货', '9', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('缺货时, 商品的状态为', 'SHOW_PRODUCTS_SOLD_OUT', '0', '显示商品缺货<br /><br />0= 设置商品状态为关闭<br />1= 设置商品状态为打开', '9', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('用缺货图标代替加入购物车按钮', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', '不显示加入购物车按钮，而显示缺货图标<br /><br />0= 否<br />1= 是', '9', '11', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('数量小数位', 'QUANTITY_DECIMALS', '0', '商品数量允许几位小数?<br /><br />0= 不允许', '9', '15', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('购物车上显示 - 复选框或删除按钮', 'SHOW_SHOPPING_CART_DELETE', '3', '在购物车上显示，复选框或删除按钮<br /><br />1= 只显示删除按钮<br />2= 只显示复选框<br />3= 同时显示删除按钮和复选框', '9', '20', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('购物车上显示 - 更新购物车按钮的位置', 'SHOW_SHOPPING_CART_UPDATE', '3', '在购物车上显示更新购物车按钮，位于:<br /><br />1= 每个数量框后面<br />2= 所有商品下面<br />3= 同时显示在每个数量框后面和所有商品下面', '9', '22', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示新进商品', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', '在空购物车页面显示新进商品<br />0= 否或设置显示顺序', '9', '30', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示推荐商品', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', '在空购物车页面显示推荐商品<br />0= 否或设置显示顺序', '9', '31', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示特价商品', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', '在空购物车页面显示特价商品<br />0= 否或设置显示顺序', '9', '32', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在空购物车页面显示预售商品', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', '在空购物车页面显示预售商品<br />0= 否或设置显示顺序', '9', '33', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('登录时提醒合并购物车', 'SHOW_SHOPPING_CART_COMBINED', '1', '客户登录时，如果以前购物车中有商品，将于现有购物车中的商品合并。<br /><br />要提醒客户吗?<br /><br />0= OFF, 不提醒<br />1= Yes 提醒并转到购物车页面<br />2= Yes 提醒，但不转到购物车页面', '9', '35', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('记录页面解析时间', 'STORE_PAGE_PARSE_TIME', 'false', '保存(到文件)解析页面的时间', '10', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('日志路径', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/zen/page_parse_time.log', '页面解析时间的日志目录和文件名', '10', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('日志时间格式', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', '时间格式', '10', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示页面解析时间', 'DISPLAY_PAGE_PARSE_TIME', 'false', '在每个页面底部显示页面解析时间<br />(说明: 显示解析时间并不要求保存。)', '10', '4', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('保存数据库查询', 'STORE_DB_TRANSACTIONS', 'false', '保存数据库查询到系统的 /logs/ 目录。注意，这有可能严重影响系统性能并用光硬盘空间。', '10', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('电子邮件发送方式', 'EMAIL_TRANSPORT', 'PHP', '设置发送邮件的方式。<br /><strong>PHP</strong>为缺省方式，采用内置的PHP处理方式。<br />采用Windows和MacOS的服务器要修改该设置为<strong>SMTP</strong>。<br /><br /><strong>SMTPAUTH</strong>仅在服务器要求SMTP验证时使用，同时要设置SMTPAUTH的相应参数。<br /><br /><strong>sendmail</strong>用于linux/unix主机，使用主机上的sendmail程序<br /><strong>"sendmail-f"</strong>仅当服务器要求 -f 参数发送邮件，这个安全措施可以防止欺骗，但如果邮件服务器未设置使用该选项，会出错。<br /><br /><strong>Qmail</strong>用于linux/unix主机的Qmail邮件功能 /var/qmail/bin/sendmail', '12', '1', 'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP帐号邮箱', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', '输入邮箱帐号名 (me@mydomain.com) 。这是SMTP授权帐号名。<br />仅在使用SMTPAUTH时需要。', '12', '101', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) VALUES ('SMTP帐号密码', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', '输入SMTP邮箱的密码。<br />仅在使用SMTPAUTH时需要。', '12', '101', now(), 'zen_cfg_password_display');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP主机', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', '输入SMTP邮件服务器的DNS名字<br />例如: mail.mydomain.com<br />或 55.66.77.88', '12', '101', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP服务器端口', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', '输入SMTP邮件服务器端口号', '12', '101', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('在文本格式邮件中转换货币符号', 'CURRENCIES_TRANSLATIONS', '', '文本格式邮件中使用什么货币符号转换？', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('电子邮件换行', 'EMAIL_LINEFEED', 'LF', '定义分开邮件头的换行符', '12', '2', 'zen_cfg_select_option(array(\'LF\', \'CRLF\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('使用 HTML 邮件', 'EMAIL_USE_HTML', 'false', '是否使用 HTML 格式发送电子邮件', '12', '3', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('通过DNS核对电子邮件地址', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', '是否通过DNS核对电子邮件地址', '6', '6', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送电子邮件', 'SEND_EMAILS', 'true', '是否发出电子邮件', '12', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('电子邮件存档', 'EMAIL_ARCHIVE', 'false', '如果您在发邮件时，需要保存复制件，设置为 "true"。', '12', '6', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('电子邮件出错信息', 'EMAIL_FRIENDLY_ERRORS', 'false', '如果邮件失败，是否显示错误信息?  设置为false将显示PHP错误信息. 仅在调试时设置为false.', '12', '7', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('用于显示的店主邮件地址', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', '商店店主的电子邮件，显示给客户的联系方式。', '12', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发件人邮件地址', 'EMAIL_FROM', 'root@localhost', '缺省的电子邮件发送人地址，在管理模块下输入邮件时可修改。', '12', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function) VALUES ('电子邮件必须从现有域名发送', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', '您的邮件服务器是否要求所有发出的邮件发送地址为你现有的域名？<br /><br />该设置通常用于防止欺骗和垃圾邮件。如果设置为Yes，所有邮件的发送地址为上面设置的发件人邮件地址。', 12, 11, NULL, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function) VALUES ('管理员邮件格式', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', '请选择管理员电子邮件格式', 12, 12, NULL, 'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送订单确认电子邮件的复件到', 'SEND_EXTRA_ORDER_EMAILS_TO', '', '发送订单确认电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送创建帐号电子邮件的复件 - 状态', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', '是否发送创建帐号电子邮件的复件<br />0= 否 1= 是', '12', '13', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送创建帐号电子邮件的复件到', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', '', '发送创建帐号电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送客户发送礼券的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', '是否发送客户发送礼券的电子邮件的复件<br />0= 否 1= 是', '12', '17', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送客户发送礼券的电子邮件的复件到', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', '', '发送客户发送礼券的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '18', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送客户管理礼券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理礼券邮件的电子邮件的复件<br />0= 否 1= 是', '12', '19', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送客户管理礼券邮件的电子邮件的复件到', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', '', '发送客户管理礼券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送客户管理优惠券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理优惠券邮件的电子邮件的复件<br />0= 否 1= 是', '12', '21', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送客户管理优惠券邮件的电子邮件的复件到', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', '', '发送客户管理优惠券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '22', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送管理订单状态的电子邮件的复件 - 状态', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', '是否发送管理订单状态的电子邮件的复件<br />0= 否 1= 是', '12', '23', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送管理订单状态的电子邮件的复件到', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', '', '发送管理订单状态的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '24', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('发送等待审核的电子邮件的复件 - 状态', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', '是否发送等待审核的电子邮件的复件<br />0= 否 1= 是', '12', '25', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送等待审核的电子邮件的复件到', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', '', '发送等待审核的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '26', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('设置 "联系我们" 电子邮件下拉列表', 'CONTACT_US_LIST', '', '设置"联系我们"页面上列出的电子邮件地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;<br />仅有一个邮件地址时，不要输入，采用店主邮件地址', '12', '40', 'zen_cfg_textarea(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('联系我们 - 显示商店名称和地址', 'CONTACT_US_STORE_NAME_ADDRESS', '1', '包含商店名称和地址<br />0= 否 1= 是', '12', '50', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品库存提醒', 'SEND_LOWSTOCK_EMAIL', '0', '当商品处于低库存时，是否发送电子邮件<br />0= 否<br />1= 是', '12', '60', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('发送库存提醒邮件到', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', '', '当商品处于低库存时，发送电子邮件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '61', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示退订电子商情链接', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', '是否在[信息]边框中，显示退订电子商情的链接？', '12', '70', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示客户选择计数', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', '显示接收人名单时，是否显示计数？<br /><em>(如果有很多客户，这会影响速度)</em>', '12', '90', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许下载', 'DOWNLOAD_ENABLED', 'true', '打开商品下载功能', '13', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('重定向下载', 'DOWNLOAD_BY_REDIRECT', 'true', '使用浏览器的重定向下载。在非Unix系统上关闭该功能。<br /><br />提示: 重定向打开时，将/pub设为777', '13', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分块下载', 'DOWNLOAD_IN_CHUNKS', 'false', '如果关闭重定向下载，而您的PHP内存限制的设置低于8 MB，您可能需要打开该选项，使文件分块发送到浏览器。<br /><br />重定向下载打开时没有作用。', '13', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('下载有效期 (天数)' ,'DOWNLOAD_MAX_DAYS', '7', '设置下载有效天数。0 表示无限制。', '13', '3', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许下载次数 - 每件商品' ,'DOWNLOAD_MAX_COUNT', '5', '设置允许下载次数。0 表示不允许下载。', '13', '4', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('下载控制更新状态值', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', '哪个订单状态重置下载天数和下载次数 - 缺省为 4', '13', '10', now(), now(), NULL , NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('下载控制订单状态值 >= 最低状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', '下载控制订单状态值 - 缺省 >= 2<br /><br />是否允许下载取决于订单的状态，订单状态高于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最低值。', '13', '12', now(), now(), NULL , NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('下载控制订单状态值 <= 最高状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', '下载控制订单状态值 - 缺省 <= 4<br /><br />是否允许下载取决于订单的状态，订单状态低于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最高值。', '13', '13', now(), now(), NULL , NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许属性定价', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', '允许属性定价', '13', '25', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许批量优惠', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', '允许批量优惠', '13', '26', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许属性图像', 'ATTRIBUTES_ENABLED_IMAGES', 'true', '允许属性图像', '13', '28', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('允许按词或字定价', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', '允许按词或字定价', '13', '35', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('文字价格 - 空格免费', 'TEXT_SPACES_FREE', '1', '文字定价时，空格免费<br /><br />0= 否 1= 是', '13', '36', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('只读选项类型 - 忽略添加到购物车', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', '当一个商品属性为只读时，是否显示添加到购物车按钮?<br />0= 不显示<br />1= 显示', '13', '37', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());



INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('打开GZip压缩', 'GZIP_LEVEL', '0', '0= 否 1= 是', '14', '1', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Session 目录', 'SESSION_WRITE_DIRECTORY', '/tmp', '指向 configure.php 文件中 DIR_FS_SQL_CACHE 设定的目录。', '15', '1', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Cookie域名', 'SESSION_USE_FQDN', 'True', '如果选True，域名全称用于保存cookie, 例如：www.mydomain.com。如果选False，仅用域名的部分，例如：mydomain.com。如果您不确定，可以选True。', '15', '2', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('强制使用Cookie', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', '15', '2', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('检查SSL Sessions编号', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', '15', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('检查用户代理', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', '15', '4', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('检查IP地址', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', '15', '5', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('阻止机器人Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', '15', '6', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('重建Sessions', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', '15', '7', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('IP到主机名转换', 'SESSION_IP_TO_HOST_ADDRESS', 'false', '转换IP地址为主机名<br /><br />提示: 在某些服务器上，会降低session初始化的速度或电子邮件执行时间。', '15', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('兑现代码长度', 'SECURITY_CODE_LENGTH', '10', '输入兑现代码长度<br />越长越安全', 16, 1, NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) VALUES ('缺省的金额为零的订单状态', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', '当订单的余额为零, 订单状态为', '16', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('新客户的优惠券编号', 'NEW_SIGNUP_DISCOUNT_COUPON', '', '选择优惠券<br />', 16, 75, NULL, now(), NULL, 'zen_cfg_select_coupon_id(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('新客户的礼券金额', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', '没有就留空<br />或输入金额，如 10 表示 10.00元', 16, 76, NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('优惠券每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', '每页显示的优惠券数量', '16', '81', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('优惠券分析页面上每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', '分析页面显示的优惠券数量', '16', '81', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - VISA', 'CC_ENABLED_VISA', '1', '接受VISA 0= 否 1= 是', '17', '1', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - MasterCard', 'CC_ENABLED_MC', '1', '接受MasterCard 0= 否 1= 是', '17', '2', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - AmericanExpress', 'CC_ENABLED_AMEX', '0', '接受AmericanExpress 0= 否 1= 是', '17', '3', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', '接受Diners Club 0= 否 1= 是', '17', '4', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - Discover Card', 'CC_ENABLED_DISCOVER', '0', '接受Discover卡 0= 否 1= 是', '17', '5', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - JCB', 'CC_ENABLED_JCB', '0', '接受JCB 0= 否 1= 是', '17', '6', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', '接受澳大利亚银行卡 0= 否 1= 是', '17', '7', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - SOLO', 'CC_ENABLED_SOLO', '0', '接受SOLO 0= 否 1= 是', '17', '8', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - Switch', 'CC_ENABLED_SWITCH', '0', '接受SWITCH 0= 否 1= 是', '17', '9', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - Maestro', 'CC_ENABLED_MAESTRO', '0', '接受MAESTRO 0= 否 1= 是', '17', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('接受信用卡 - 付款时显示', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', '付款页面是否显示接受信用卡?<br />0= 不显示<br />1= 显示文字<br />2= 显示图像<br /><br />备注: 图像和文字必须在相关信用卡的数据库和语言文件中同时定义.', '17', '50', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('购买队列', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', '您要将购买礼券排队吗?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('含运费', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', '计算时含运费', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('含税', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', '计算时含税。', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('重算税价', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', '重新计算税', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('税率种类', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', '接受礼券时，使用以下的税率种类。', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('含税金额', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', '加入帐号时，在购买的礼券上加税', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('设置订单状态', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', '设置用礼券全额付款时订单的状态', 6, 0, NULL, now(), 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('收取低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', '您要收取低额订单费用吗?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('收取低额订单费的订单金额', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', '总金额低于该值的订单收取低额订单费。', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', '按百分比收取 - 包含符号 % 例如: 10%<br />收取固定金额 - 例如: 输入 5 表示 5.00元', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('低额订单费适用的送货地区', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', '该送货地区收取低额订单费。', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('税率种类', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', '低额订单费使用下面的税率种类。', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('虚拟商品无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', '购物车中只有虚拟商品时，不收取低额订单费', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('礼券无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', '购物车中只有礼券时，不收取低额订单费', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('允许免运费', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', '您要免运费吗?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('免运费的订单金额', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', '当订单总金额大于设值时，免运费。', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('免运费的送货地区', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', '当送货地区为该地区时，免运费。', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('税率种类', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', '优惠券采用下面的税类。', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('含税', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', '计算时含税。', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示排序', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('含运费', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', '计算时含运费', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('该模块已安装', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('重算税价', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', '重新计算税', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('管理员演示', 'ADMIN_DEMO', '0', '是否打开管理员演示？<br />0= 否 1= 是', 6, 0, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品选项类型选择', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', '该数字表示选择的商品选项', 0, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('文字商品选项类型', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', '文字商品选项类型数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('单选按钮商品选项类型', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', '单选按钮商品选项类型数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('多选商品选项类型', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', '多选商品选项类型数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('文件商品选项类型', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', '文件商品选项类型数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('文字和文件商品选项类型的编号', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', '文字和文件商品选项类型的编号数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('上传前缀', 'UPLOAD_PREFIX', 'upload_', '用于区分上传选项和其它选项的前缀', 0, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('文字前缀', 'TEXT_PREFIX', 'txt_', '用于区分文字选项值和其它选项值的前缀', 0, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('只读选项类型', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', '只读选项类型数值', 6, NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('login mode https', 'SSLPWSTATUSCHECK', '', '系统设置，不要修改。', 6, 99, now());





INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品信息 - 商品选项名称排序', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', '商品信息选项名称排序<br />0= 排序, 选项名称<br />1= 选项名称', 18, 35, now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('商品信息 - 商品选项属性值排序', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', '商品信息选项属性值排序<br />0= 排序, 价格<br />1= 排序, 选项值名称', 18, 36, now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');

# test remove and only use products_options_images_per_row
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品信息 - 每行属性图像数目', 'PRODUCTS_IMAGES_ATTRIBUTES_PER_ROW', '5', '商品信息 - 输入每行显示的属性图像的数目<br />缺省 = 5', '18', '40', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 在属性图像下显示选项值名称', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', '商品信息 - 在属性图像下显示选项值名称?<br />0= 否 1= 是', 18, 41, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

# test remove and only use products_options_images_style
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 显示单选和多选按钮的选项值和属性图像', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES_COLUMN', '0', '0= 图像位于选项名称下<br />1= 元素, 图像 和 选项值<br />2= 元素, 图像 和 选项名称下面<br />3= 选项名称位于元素和图像下面<br />4= 元素位于图像和选项名称下面<br />5= 元素位于图像和选项名称上面', 18, 42, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 显示优惠', 'SHOW_SALE_DISCOUNT_STATUS', '1', '商品信息 - 是否显示优惠？<br />0= 否 1= 是', 18, 45, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 优惠价格的显示格式', 'SHOW_SALE_DISCOUNT', '1', '商品信息 - 优惠价格的显示格式:<br />1= 显示百分比 2= 显示金额', 18, 46, 'zen_cfg_select_option(array(\'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 显示优惠百分比的小数位', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', '商品信息 - 优惠格式显示为百分比时的小数位:<br />缺省= 0', 18, 47, NULL, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 免费图像或文字', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', '商品信息 - 是否在价格上显示免费字样的图像或文字<br />0= 文字<br />1= 图像', 18, 50, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品信息 - 价格面议图像或文字', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', '商品信息 - 是否在价格上显示价格面议字样的图像或文字<br />0= 文字<br />1= 图像', 18, 51, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品数量方框 - 添加新商品', 'PRODUCTS_QTY_BOX_STATUS', '1', '添加新商品时，缺省的数量方框显示状态?<br /><br />0= 否<br />1= 是<br />提示: 打开时，会显示数量方框，缺省的[添加到购物车]数量为 1', '18', '55', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品评论请求批准', 'REVIEWS_APPROVAL', '1', '商品评论需要批准吗?<br /><br />提示: 当评论状态为关闭时，也不会显示<br /><br />0= 否 1= 是', '18', '62', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('元标签 - 标题含商品型号', 'META_TAG_INCLUDE_MODEL', '1', '在Meta标签标题中包含商品型号吗?<br /><br />0= 否 1= 是', '18', '69', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('元标签 - 标题含商品价格', 'META_TAG_INCLUDE_PRICE', '1', '在Meta标签标题中包含商品价格吗?<br /><br />0= 否 1= 是', '18', '70', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('元标签的描述字段字数', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', '设置元标签的描述字段字数，缺省 50:', '18', '71', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('每行显示的同时购买商品数', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', '每行显示的同时购买商品数<br />0= 关 或设置排序', '18', '72', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('导航条 - 位置', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', '导航条位置<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 18, 21, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'页面顶部\'), array(\'id\'=>\'2\', \'text\'=>\'页面底部\'), array(\'id\'=>\'3\', \'text\'=>\'同时\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('导航条 - 排序', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', '商品的显示顺序<br />0= 商品编号<br />1= 商品名称<br />2= 商品型号<br />3= 价格, 名称<br />4= 价格, 型号<br />5= 名称, 型号<br />6= 商品排序', 18, 22, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'商品编号\'), array(\'id\'=>\'1\', \'text\'=>\'商品名称\'), array(\'id\'=>\'2\', \'text\'=>\'商品型号\'), array(\'id\'=>\'3\', \'text\'=>\'价格 - 名称\'), array(\'id\'=>\'4\', \'text\'=>\'价格 - 型号\'), array(\'id\'=>\'5\', \'text\'=>\'名称 - 型号\'), array(\'id\'=>\'6\', \'text\'=>\'商品排序\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('导航条 - 按钮和图像', 'SHOW_PREVIOUS_NEXT_STATUS', '0', '是否显示按钮和图像:<br />0= 否<br />1= 是', 18, 20, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'是\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('导航条 - 按钮和图像设置', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', '显示按钮和图像的设置<br />0= 仅显示按钮<br />1= 按钮和商品图像<br />2= 仅显示商品图像', 18, 21, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'仅显示按钮\'), array(\'id\'=>\'1\', \'text\'=>\'按钮和商品图像\'), array(\'id\'=>\'2\', \'text\'=>\'仅显示商品图像\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('导航条 - 图像宽度?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', '上一个/下一个 图像宽度?', '18', '22', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('导航条 - 图像高度?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', '上一个/下一个 图像高度?', '18', '23', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类导航条的位置', 'PRODUCT_INFO_CATEGORIES', '1', '商品的分类图像和名称位于导航条的上面<br />0= 否<br />1= 左对齐<br />2= 中间对齐<br />3= 右对齐', 18, 20, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'左对齐\'), array(\'id\'=>\'2\', \'text\'=>\'中间对齐\'), array(\'id\'=>\'3\', \'text\'=>\'右对齐\')),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类导航条的名称和图像', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', '商品分类图像和名称<br />0= 总是显示商品分类图像和名称<br />1= 只显示名称<br />2= 当非空时显示商品分类图像和名称', 18, 20, now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'分类和图像\'), array(\'id\'=>\'1\', \'text\'=>\'仅分类\'), array(\'id\'=>\'2\', \'text\'=>\'非空时分类和图像\')),');



INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('栏目宽度 - 左栏目', 'BOX_WIDTH_LEFT', '170px', '左栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', 19, 1, NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('栏目宽度 - 右栏目', 'BOX_WIDTH_RIGHT', '140px', '右栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', 19, 2, NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('导航条分割符', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', '输入导航条分隔符<br />提示: 空格用 &amp;nbsp; <br />缺省 = &amp;nbsp;::&amp;nbsp;', 19, 3, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('导航条', 'DEFINE_BREADCRUMB_STATUS', '1', '是否显示导航条<br />0= 关<br />1= 开<br />2= 仅不显示在首页', 19, 4, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('畅销商品 - 数目填充', 'BEST_SELLERS_FILLER', '&nbsp;', '用什么分割数字?<br />缺省 = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('畅销商品 - 截断商品名称', 'BEST_SELLERS_TRUNCATE', '35', '商品名称截断长度?<br />缺省 = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('畅销商品 - 截断商品名称后面加上 ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', '截断商品名称时，后面加上 ...<br />缺省 = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('购物车边框', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', '是否显示购物车边框<br />0= 总是显示<br />1= 满的时候<br />2= 满的时候，但查看购物车时不显示', 19, 8, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类栏 - 显示特价商品链接', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', '在分类边框中显示特价商品链接', 19, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类栏 - 显示新进商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', '在分类边框中显示新进商品链接', 19, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类栏 - 显示推荐商品链接', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', '在分类边框中显示推荐商品链接', 19, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类栏 - 显示所有商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', '在分类边框中显示所有商品链接', 19, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('左边栏目状态 - 全局', 'COLUMN_LEFT_STATUS', '1', '显示左栏目, 除非有文件替代<br />0= 左栏目总是关闭<br />1= 左栏目打开，除非有文件替代', 19, 15, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('右边栏目状态 - 全局', 'COLUMN_RIGHT_STATUS', '1', '显示右栏目, 除非有文件替代<br />0= 右栏目总是关闭<br />1= 右栏目打开, 除非有文件替代', 19, 16, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('栏目宽度 - 左', 'COLUMN_WIDTH_LEFT', '170px', '左边栏目的宽度<br />可以输入 px<br />缺省 = 150px', 19, 20, NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('栏目宽度 - 右', 'COLUMN_WIDTH_RIGHT', '140px', '右边栏目的宽度<br />可以输入 px<br />缺省 = 150px', 19, 21, NULL, '2003-11-21 22:16:36', NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分类分割符', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', '分类名称之间显示分割符吗?<br />0= 否<br />1= 是', 19, 24, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类名称和计数之间的分割符', 'CATEGORIES_SEPARATOR', '', '分类名称和计数间的分割符是?<br />缺省 = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类名称和子分类之间的分割符', 'CATEGORIES_SEPARATOR_SUBS', '', '分类名称和子分类之间的分割符是?<br />缺省 = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类计数前缀', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', '计数要加前缀吗?<br />缺省= (', 19, 27, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类计数后缀', 'CATEGORIES_COUNT_SUFFIX', ')', '计算后缀是?<br />缺省= )', 19, 28, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('分类子分类缩排', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', '子分类的缩进为?<br />缺省= &nbsp;&nbsp;', 19, 29, NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('没有商品的分类', 'CATEGORIES_COUNT_ZERO', '0', '显示商品数量为零的分类吗?<br />0= 否<br />1= 是', 19, 30, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分隔分类边框', 'CATEGORIES_SPLIT_DISPLAY', 'True', '按商品类型分隔分类边框', 19, 31, 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('购物车 - 显示总计', 'SHOW_TOTALS_IN_CART', '1', '是否在购物车上显示总计<br />0= 否<br />1= 是: 件数 重量 金额<br />2= 是: 件数 重量 金额，重量为零时不显示<br />3= 是: 件数 金额', 19, 31, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('顾客欢迎词 - 显示在首页', 'SHOW_CUSTOMER_GREETING', '1', '在首页上显示顾客欢迎词<br />0= 否<br />1= 是', 19, 40, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分类 - 总是显示在首页', 'SHOW_CATEGORIES_ALWAYS', '0', '首页显示分类<br />0= 否<br />1= 是<br />首页显示的分类可以是主分类或一个特定子分类', 19, 45, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('首页 - 显示分类', 'CATEGORIES_START_MAIN', '0', '0= 主分类<br />或输入分类编号<br />提示: 也可以使用子分类，例如: 3_10', '19', '46', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分类 - 显示子分类', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', '总是显示分类和子分类<br />0= 否, 只显示总分类<br />1= 是, 选择时总是显示分类和子分类', 19, 47, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 标题位置 1', 'SHOW_BANNERS_GROUP_SET1', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 1，您要使用哪个广告组?<br />没有就留空', '19', '55', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 标题位置 2', 'SHOW_BANNERS_GROUP_SET2', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 2，您要使用哪个广告组?<br />没有就留空', '19', '56', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 标题位置 3', 'SHOW_BANNERS_GROUP_SET3', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 3，您要使用哪个广告组?<br />没有就留空', '19', '57', '', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 页脚位置 1', 'SHOW_BANNERS_GROUP_SET4', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 1，您要使用哪个广告组?<br />没有就留空', '19', '65', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 页脚位置 2', 'SHOW_BANNERS_GROUP_SET5', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 2，您要使用哪个广告组?<br />没有就留空', '19', '66', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 页脚位置 3', 'SHOW_BANNERS_GROUP_SET6', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 Wide-Banners<br /><br />在页脚位置 3，您要使用哪个广告组?<br />没有就留空', '19', '67', '', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 边框 banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏，您要使用哪个广告组?<br />没有就留空', '19', '70', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 边框 banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏2，您要使用哪个广告组?<br />没有就留空', '19', '71', '', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('广告显示组 - 边框 banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', '所有广告边框栏只可以设置一个广告组<br /><br />缺省组为 BannersAll<br /><br />在边框的所有广告栏，您要使用哪个广告组?<br />没有就留空', '19', '72', '', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('页脚 - 显示IP地址', 'SHOW_FOOTER_IP', '1', '在页脚显示客户IP地址吗<br />0= 否<br />1= 是', 19, 80, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('商品优惠数量 - 添加多少空白优惠?', 'DISCOUNT_QTY_ADD', '5', '在商品价格上添加多少空白优惠?', '19', '90', '', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('商品优惠数量 - 每行显示多少?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', '商品信息页面每行显示多少优惠?', '19', '95', '', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分类/商品显示顺序', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称', '19', '100', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('选项名称和内容全局添加、复制和删除', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', '选项名称和内容全局添加、复制和删除<br />0= 隐藏<br />1= 显示<br />(默认=1)', '19', '110', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分类标签菜单 打开/关闭', 'CATEGORIES_TABS_STATUS', '0', '分类标签<br />在页眉显示商店的分类目录，自己发挥想象力。<br />0= 隐藏分类标签<br />1= 显示分类标签', '19', '112', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('网站地图 - 是否包含我的帐号链接', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', '网站地图上是否显示到我的帐号的链接<br />说明: 搜索引擎会尝试索引该页面，通常不会转向安全页面，因为索引登录页面并无好处。<br /><br />缺省: false', 19, 115, 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('跳过单个商品的分类', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', '跳过单个商品的分类<br />如果设置为True，客户点击单个商品的分类时，Zen Cart将直接显示商品页面。<br />缺省: True', '19', '120', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('分开登录页面', 'USE_SPLIT_LOGIN_MODE', 'False', '登录页面有两种显示模式: 分页模式 或 同页模式<br />分页模式，点击按钮后进入注册页面。同页模式，注册页面显示在登录之下。<br />缺省: True', '19', '121', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());

# CSS Buttons switch
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('CSS按钮', 'IMAGE_USE_CSS_BUTTONS', 'No', 'CSS按钮<br />使用CSS按钮替代图像(GIF/JPG)<br />按钮格式在stylesheet文件中定义。', '19', '147', 'zen_cfg_select_option(array(\'No\', \'Yes\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('<strong>关闭维护中: 开/关</strong>', 'DOWN_FOR_MAINTENANCE', 'false', '网站维护中 <br />(true=是 false=否)', '20', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 文件名', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', '网站维护中: 文件名 <br />备注: 不含后缀<br />缺省=down_for_maintenance', '20', '2', '', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 隐藏页眉', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', '网站维护中: 隐藏页眉 <br />(true=隐藏 false=显示)', '20', '3', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 隐藏左栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', '网站维护中: 隐藏左栏目 <br />(true=隐藏 false=显示)', '20', '4', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 隐藏右栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', '网站维护中: 隐藏右栏目 <br />(true=隐藏 false=显示)', '20', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 隐藏页脚', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', '网站维护中: 隐藏页脚 <br />(true=隐藏 false=显示)', '20', '6', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('网站维护中: 隐藏价格', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', '网站维护中: 隐藏价格 <br />(true=隐藏 false=显示)', '20', '7', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('关闭维护中 (不包括该IP地址)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', '您的IP地址(管理员)', '网站维护时，该地址仍然可以访问网站 (例如网管)<br />要输入多个地址，用逗号分开。如果您不知道IP地址，可以查看商店界面的页脚。', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('关闭维护前发布通知: 开/关', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', '是否在网站维护前给出提醒信息<br />(true=是 false=否)<br />如果您将\'网站维护中: 开/关\'设为开，该值自动设为否', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('维护前的通知日期和小时', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '2003/05/15  2-3 PM', '输入网站维护的日期和时间', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示网站管理员开始维护', 'DISPLAY_MAINTENANCE_TIME', 'false', '显示网管何时开始维护 <br />(true=是 false=否)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('显示网站维护时段', 'DISPLAY_MAINTENANCE_PERIOD', 'false', '显示网站维护时段 <br />(true=是 false=否)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('网站维护时段', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', '输入网站维护时段(小时:分钟)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('结帐时确认顾客须知中条款', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'true', '结帐时显示客户必须同意的顾客须知中的条款。', '11', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('创建帐号时确认隐私声明', 'DISPLAY_PRIVACY_CONDITIONS', 'true', '创建帐号时显示客户必须同意的隐私声明。', '11', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品图像', 'PRODUCT_NEW_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品数量', 'PRODUCT_NEW_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品马上购买按钮', 'PRODUCT_NEW_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品名称', 'PRODUCT_NEW_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品型号', 'PRODUCT_NEW_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示厂商名字', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品价格', 'PRODUCT_NEW_LIST_PRICE', '2402', '要显示商品价格吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品重量', 'PRODUCT_NEW_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品加入日期', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品简介', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '21', '10', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品显示缺省排序', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', '显示新进商品的缺省排序是什么?<br />缺省 = 6 日期由新到旧<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '21', '11', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品缺省的新组编号', 'PRODUCT_NEW_LIST_GROUP_ID', '21', '警告: 仅在新进商品组编号与缺省的21不同时，才修改该值。<br />新进商品组的编号是什么?', '21', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示多个商品数量方框并设定按钮位置', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '21', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('屏蔽预售商品', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', '要在边框和中框的新进商品列表中屏蔽预售商品吗?<br />0= 否<br />1= 是', '21', '30', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品图像', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品数量', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品马上购买按钮', 'PRODUCT_FEATURED_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品名称', 'PRODUCT_FEATURED_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品型号', 'PRODUCT_FEATURED_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示厂商名字', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品价格', 'PRODUCT_FEATURED_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品重量', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品加入日期', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品简介', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '22', '10', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品显示缺省排序', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', '显示推荐商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '22', '11', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('推荐商品的缺省组编号', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', '警告: 仅在推荐商品组编号与缺省的22不同时，才修改该值<br />推荐商品组的编号是什么?', '22', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示多个商品数量方框并设定按钮位置', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '22', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品图像', 'PRODUCT_ALL_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品数量', 'PRODUCT_ALL_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品马上购买按钮', 'PRODUCT_ALL_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品名称', 'PRODUCT_ALL_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品型号', 'PRODUCT_ALL_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示厂商名字', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品价格', 'PRODUCT_ALL_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品重量', 'PRODUCT_ALL_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品加入日期', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('显示商品简介', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '23', '10', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('商品显示缺省排序', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', '显示所有商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '23', '11', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('商品缺省的所有组编号', 'PRODUCT_ALL_LIST_GROUP_ID', '23', '警告: 仅在所有商品组编号与缺省的23不同时，才修改该值<br />所有商品组的编号是什么?', '23', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示多个商品数量方框并设定按钮位置', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '23', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示新进商品', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', '在首页上显示新进商品<br />0= 否 或设置排序顺序', '24', '65', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示推荐商品', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品<br />0= 否 或设置排序顺序', '24', '66', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示特价商品', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品<br />0= 否 或设置排序顺序', '24', '67', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示预售商品', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', '在首页上显示预售商品<br />0= 否 或设置排序顺序', '24', '68', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示新进商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '70', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示推荐商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '71', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示特价商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '72', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示预售商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', '在首页上显示预售商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '73', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示新进商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '75', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示推荐商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '76', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示特价商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '77', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('在首页上显示预售商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', '在首页上显示预售商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '78', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示新进商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', '在商品列表下显示新进商品<br />0= 否 或设置排序顺序', '24', '85', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示推荐商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', '24', '86', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示特价商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', '在商品列表下显示特价商品<br />0= 否 或设置排序顺序', '24', '87', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('显示预售商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', '24', '88', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('新进商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', '每行显示的新进商品数', '24', '95', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('推荐商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', '每行显示的推荐商品数', '24', '96', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('特价商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', '每行显示的特价商品数', '24', '97', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('过滤当前主分类的商品列表', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', '显示当前主分类的商品列表，还是显示所有分类中的商品?<br />0= 关闭过滤 1=打开过滤 ', '24', '100', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

#Define Page Status
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义首页文字', 'DEFINE_MAIN_PAGE_STATUS', '1', '是否使用首页文字的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '60', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义联系我们', 'DEFINE_CONTACT_US_STATUS', '1', '是否使用联系我们的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '61', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义隐私声明', 'DEFINE_PRIVACY_STATUS', '1', '是否使用隐私声明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '62', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义发货付款须知', 'DEFINE_SHIPPINGINFO_STATUS', '1', '是否使用发货付款须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '63', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义顾客须知', 'DEFINE_CONDITIONS_STATUS', '1', '是否使用顾客须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '64', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义成功结帐页面', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', '是否使用成功结帐页的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '65', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义优惠券说明', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', '是否使用优惠券说明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '66', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义网站地图', 'DEFINE_SITE_MAP_STATUS', '1', '是否使用网站地图的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义Page-Not-Found', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', '使用定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义页面二', 'DEFINE_PAGE_2_STATUS', '1', '是否使用页面二的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '82', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义页面三', 'DEFINE_PAGE_3_STATUS', '1', '是否使用页面三的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '83', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
insert into configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('定义页面四', 'DEFINE_PAGE_4_STATUS', '1', '是否使用页面四的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '84', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');

#EZ-Pages settings
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面 - 页眉', 'EZPAGES_STATUS_HEADER', '1', '在全局范围打开/关闭简易页面的页眉<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 10, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面 - 页脚', 'EZPAGES_STATUS_FOOTER', '1', '在全局范围打开/关闭简易页面的页脚<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 11, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面 - 边框', 'EZPAGES_STATUS_SIDEBOX', '1', '在全局范围打开/关闭简易页面的边框<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 12, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面页眉分隔符', 'EZPAGES_SEPARATOR_HEADER', '::', '简易页面页眉分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面页脚分隔符', 'EZPAGES_SEPARATOR_FOOTER', '::', '简易页面页脚分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('简易页面导航按钮', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', '是否在简易页面上显示导航按钮<br />0=否 (无按钮)<br />1="继续"<br />2="上一页/继续/下一页"<br /><br />缺省: 2', 30, 30, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面目录', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', '打开简易页面章节的目录吗?<br />0= OFF<br />1= ON', 30, 35, now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示页眉的页面', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', '简易页面中不显示商店的页眉的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 1,5,2<br />或留空。', 30, 40, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示页脚的页面', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', '简易页面中不显示商店的页脚的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,7<br />或留空。', 30, 41, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示左栏目的页面', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的左栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 21<br />或留空。', 30, 42, NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('简易页面中不显示右栏目的页面', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的右栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,82,13<br />或留空。', 30, 43, NULL, now(), NULL, 'zen_cfg_textarea_small(');





INSERT INTO configuration_group VALUES (1, '基本设置', '商店的基本情况', '1', '1');
INSERT INTO configuration_group VALUES (2, '最小值', '功能/数据的最小值', '2', '1');
INSERT INTO configuration_group VALUES (3, '最大值', '功能/数据的最大值', '3', '1');
INSERT INTO configuration_group VALUES (4, '图像参数', '图像参数', '4', '1');
INSERT INTO configuration_group VALUES (5, '客户资料', '客户帐号选项配置', '5', '1');
INSERT INTO configuration_group VALUES (6, '模块选项', '在配置中不可见', '6', '0');
INSERT INTO configuration_group VALUES (7, '配送参数', '配送参数选项', '7', '1');
INSERT INTO configuration_group VALUES (8, '商品列表', '商品列表配置选项', '8', '1');
INSERT INTO configuration_group VALUES (9, '库存选项', '库存配置选项', '9', '1');
INSERT INTO configuration_group VALUES (10, '日志选项', '日志配置选项', '10', '1');
INSERT INTO configuration_group VALUES (11, '条款选项', '条款选项', '16', '1');
INSERT INTO configuration_group VALUES (12, '电子邮件', '电子邮件的基本设置', '12', '1');
INSERT INTO configuration_group VALUES (13, '属性设置', '商品属性设置', '13', '1');
INSERT INTO configuration_group VALUES (14, 'GZip压缩', 'GZip压缩选项', '14', '1');
INSERT INTO configuration_group VALUES (15, 'Sessions', 'Sessions选项', '15', '1');
INSERT INTO configuration_group VALUES (16, '礼券和优惠券', '礼券和优惠券', '16', '1');
INSERT INTO configuration_group VALUES (17, '信用卡', '接受的信用卡', '17', '1');
INSERT INTO configuration_group VALUES (18, '商品信息', '商品信息显示选项', '18', '1');
INSERT INTO configuration_group VALUES (19, '布局设置', '布局选项', '19', '1');
INSERT INTO configuration_group VALUES (20, '网站维护', '网站维护选项', '20', '1');
INSERT INTO configuration_group VALUES (21, '新进商品', '新进商品列表', '21', '1');
INSERT INTO configuration_group VALUES (22, '推荐商品', '推荐商品列表', '22', '1');
INSERT INTO configuration_group VALUES (23, '所有商品', '所有商品列表', '23', '1');
INSERT INTO configuration_group VALUES (24, '商品索引', '商品索引页面', '24', '1');
INSERT INTO configuration_group VALUES (25, '定义页面', '定义首页和其它HTML页面', '25', '1');
INSERT INTO configuration_group VALUES (30, '简易页面设置', '简易页面设置', '30', '1');

INSERT INTO currencies VALUES (1,'US Dollar','USD','$','','.',',','2','0.14205870', now());
INSERT INTO currencies VALUES (2,'人民币','CNY','','元','.','','2','1.00000000', now());
INSERT INTO currencies VALUES (3,'Euro','EUR','&euro;','','.',',','2','0.09692550', now());
INSERT INTO currencies VALUES (4,'GB Pound','GBP','&pound;','','.',',','2','0.06997200', now());
INSERT INTO currencies VALUES (5,'Canadian Dollar','CAD','$','','.',',','2','0.14287770', now());
INSERT INTO currencies VALUES (6,'Australian Dollar','AUD','$','','.',',','2','0.16222499', now());

INSERT INTO languages VALUES (1,'English','en','icon.gif','english',20);
INSERT INTO languages VALUES (2,'简体中文','gb','icon.gif','schinese',10);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'currencies.php', 1, 1, 80, 60, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'languages.php', 1, 1, 70, 50, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'currencies.php', 1, 1, 80, 60, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'languages.php', 1, 1, 70, 50, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'my_broken_box.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'currencies.php', 1, 1, 80, 60, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'document_categories.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'languages.php', 1, 1, 70, 50, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'music_genres.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'record_companies.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO orders_status VALUES ( '1', '1', 'Pending');
INSERT INTO orders_status VALUES ( '2', '1', 'Processing');
INSERT INTO orders_status VALUES ( '3', '1', 'Delivered');
INSERT INTO orders_status VALUES ( '4', '1', 'Update');

INSERT INTO orders_status VALUES ( '1', '2', '等待中');
INSERT INTO orders_status VALUES ( '2', '2', '处理中');
INSERT INTO orders_status VALUES ( '3', '2', '已发货');
INSERT INTO orders_status VALUES ( '4', '2', '已更新');

INSERT INTO product_types VALUES (1, '商品 - 普通', 'product', '1', 'Y', '', now(), now());
INSERT INTO product_types VALUES (2, '商品 - 音乐', 'product_music', '1', 'Y', '', now(), now());
INSERT INTO product_types VALUES (3, '文档 - 普通', 'document_general', '3', 'N', '', now(), now());
INSERT INTO product_types VALUES (4, '文档 - 商品', 'document_product', '3', 'Y', '', now(), now());
INSERT INTO product_types VALUES (5, '商品 - 免运费', 'product_free_shipping', '1', 'Y', '', now(), now());

INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (0, '下拉');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (1, '文本');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (2, '单选');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (3, '多选');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (4, '文件');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (5, '只读');

INSERT INTO products_options_values (products_options_values_id, language_id, products_options_values_name) VALUES (0, 1, 'TEXT');
INSERT INTO products_options_values (products_options_values_id, language_id, products_options_values_name) VALUES (0, 2, '文字');

# China/北京
INSERT INTO tax_rates VALUES (1, 1, 1, 1, 3.0, '演示税率', now(), now());
INSERT INTO geo_zones (geo_zone_id,geo_zone_name,geo_zone_description,date_added) VALUES (1,'北京','北京本地税率区',now());
INSERT INTO zones_to_geo_zones (association_id,zone_country_id,zone_id,geo_zone_id,date_added) VALUES (1,44,67,1,now());
INSERT INTO tax_class (tax_class_id, tax_class_title, tax_class_description, date_added) VALUES (1, '附加购物税', '以下商品含非食物、服务等。', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示型号', 'SHOW_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '1', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示重量', 'SHOW_PRODUCT_INFO_WEIGHT', '1', '在商品页面显示重量 0= 否 1= 是', '1', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示属性重量', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '1', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示厂商', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '1', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示购物车中数量', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '1', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示库存数量', 'SHOW_PRODUCT_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', '1', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论计数', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '1', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论按钮', 'SHOW_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '1', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示上市日期', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '1', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示加入日期', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '1', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品网址', 'SHOW_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '1', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '1', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示最低价格文字', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '1', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费图像 - 分类', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在分类中显示免运费图像/文字?', '1', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '1', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '1', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '1', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示型号', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '2', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '2', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示属性重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '2', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示歌手', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', '在商品页面显示歌手名字 0= 否 1= 是', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示音乐类型', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', '在商品页面显示音乐类型 0= 否 1= 是', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示唱片公司', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', '在商品页面显示唱片公司 0= 否 1= 是', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示购物车中数量', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '2', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示库存数量', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', '2', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论计数', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '2', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论按钮', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '2', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示上市日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '2', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示加入日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '2', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '2', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示价格文字最低至', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '2', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费图像 - 分类', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', '2', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '2', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '2', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '2', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论计数', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 Info 0= 否 1= 是', '3', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论按钮', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '3', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示上市日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '3', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示加入日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '3', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品网址', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '3', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '3', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

#admin defaults


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示型号', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '4', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '4', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示属性重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '4', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示厂商', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '4', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示购物车中数量', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '4', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示库存数量', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', '4', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论计数', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '4', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论按钮', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '4', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示上市日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '4', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示加入日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '4', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品网址', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '4', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '4', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示价格文字最低至', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '4', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费图像状态 - 分类', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', '4', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('商品价格缺省税种 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '4', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '4', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '4', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '5', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '5', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示属性重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '5', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示厂商', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '5', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示购物车中数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '5', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示库存数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', '5', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论计数', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '5', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品评论按钮', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '5', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示上市日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', '在商品页面显示上市日期 0= 否 1= 是', '5', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示加入日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '5', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品网址', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '5', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示商品附加图像', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '5', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示价格文字 最低至', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '5', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费图像 - 分类', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', '是否在列表中显示免运费图像/文字?', '5', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '5', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '5', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '5', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());

#insert product type layout settings for meta-tags
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '1', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '1', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '1', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '1', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '1', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '2', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '2', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '2', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '2', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '2', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', '3', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', '3', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 Title 0= 否 1= 是', '3', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', '4', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', '4', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档型号', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示文档型号 0= 否 1= 是', '4', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档价格', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示文档价格 0= 否 1= 是', '4', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 0= 否 1= 是', '4', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '5', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '5', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '5', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '5', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '5', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
### eof: meta tags database updates and changes

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


## Insert the default queries for "all customers" and "all newsletter subscribers"
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '1', 'email', '所有客户', '返回所有客户的姓名和电子邮件地址，用于批量发送电子邮件(例如: 电子商情、优惠券、礼券、短信等)。', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '2', 'email,newsletters', '所有电子商情订阅者', '返回电子商情订阅者的姓名和电子邮件地址。', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '3', 'email,newsletters', '以往客户(超过三个月) (订阅者)', '以前曾经购物，但最近三个月内没有购物的客户订阅者', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '4', 'email,newsletters', '最近三个月的客户(订阅者)', '最近三个月内有购物的电子商情订阅者。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '5', 'email,newsletters', '最近三个月的客户(无论是否订阅)', '所有曾经购物的顾客，不论是否订阅电子商情。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '6', 'email,newsletters', '管理员', '仅当前管理员的电子邮件帐号', 'select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', '');
INSERT INTO query_builder ( query_id , query_category , query_name , query_description , query_string , query_keys_list ) VALUES ( '7', 'email,newsletters', '从未购物的客户', '发给已注册但从未购物的客户', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

#
# end of Query-Builder Setup
#

#
# Dumping data for table get_terms_to_filter
#

INSERT INTO get_terms_to_filter VALUES ('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name');
INSERT INTO get_terms_to_filter VALUES ('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name');
INSERT INTO get_terms_to_filter VALUES ('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

#
# Dumping data for table project_version
#

INSERT INTO project_version (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch1, project_version_patch1_source, project_version_patch2, project_version_patch2_source, project_version_comment, project_version_date_applied) VALUES (1, 'Zen-Cart Main', '1', '5.4', '', '', '', '', 'New Installation', now());
INSERT INTO project_version (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch1, project_version_patch1_source, project_version_patch2, project_version_patch2_source, project_version_comment, project_version_date_applied) VALUES (2, 'Zen-Cart Database', '1', '5.4', '', '', '', '', 'New Installation', now());
INSERT INTO project_version_history (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_comment, project_version_date_applied) VALUES (1, 'Zen-Cart Main', '1', '5.4', '', 'New Installation', now());
INSERT INTO project_version_history (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_comment, project_version_date_applied) VALUES (2, 'Zen-Cart Database', '1', '5.4', '', 'New Installation', now());

##### End of SQL setup for Zen Cart.

