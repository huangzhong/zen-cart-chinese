<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: finished.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_MAIN',"<h2>恭喜！</h2><h3>您已经成功安装了Zen Cart中文版！</h3><p>
<h2>下一步</h2>基于安全考虑，您需要设置<strong>configure.php</strong>文件的权限，该文件位于<strong>/admin/includes/</strong> 和 <strong>/includes/</strong> 目录下，请设为只读。<br /><br />
另外，您也要删除或改名<strong>/zc_install</strong>目录，这样别人就不能重新安装您的商店而删除您的数据！在删除或改名该目录前，系统会显示警告信息。
<h2>配置</h2>我们建议您先<a href=\"http://www.zen-cart.cn/forum/\">阅读中文社区论坛的<strong>新手上路</strong>栏目</a> ，熟悉如何设置您的商店。<br />
如有任何疑问，请在论坛上提出，我们会耐心解答您的问题。<br /><br /> 
同样<strong>重要</strong>的是，您可以查看<strong>文档</strong><strong><a href=\"../docs\" target=\"_blank\">/docs 目录</a></strong>。
<h2>特别提示</h2>配置您的网站时用到的最重要的工具就是 <strong>开发工具</strong>, 位于 <strong>管理页面的工具菜单</strong>下。您可以用它来搜索几乎所有需要配置和修改的东西，特别是显示在网站上的内容。<br /><br />
您需要熟悉的配置网站的最重要概念就是 <em><strong>模板系统</strong></em>。<a href=\"http://www.zen-cart.cn/forum/\">论坛的新手上路栏目</a>有相关文章。<br /><br />
很高兴您能选择Zen Cart中文版作为您的电子商务解决方案！<br /><br />" . '</p>' .
'<p>点击下面的按钮测试您的商店前台和管理商店设置。</p>');

  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 完成');
  define('STORE', '点击这里转到商店前台');
  define('ADMIN', '点击这里打开管理页面');
