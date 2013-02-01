<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: time_out.php 19537 2011-09-20 17:14:44Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart中文版安装 - 超时');
  define('TEXT_MAIN','<h2>出错</h2><h3>抱歉，出现错误。</h3>
<p>安装程序需要启动PHP session以完成安装。</p>
<p><strong>显示本页的原因有:</strong>
<ul>
<li><h3>出现超时</h3>如果您显示安装页面超过20分钟，上个页面输入的信息将无效。这样的话，请重新安装一次。<br />
<br />
不要空置安装进程过久，通常安装只需要5分钟。<br /><br /></li>
<li><h3>服务器无法保存session文件。</h3>如果您还未设置"cache"目录为可写，请现在就设置，安装才能继续。具体参见<a href="../docs/index.html" target="_blank">安装指南</a>。<br /><br /></li>
<li><h3>服务器的PHP sessions也许不工作。</h3>要使用Zen Cart中文版，需要PHP的"session"功能，也可能是服务器的设置问题。同时，如果您的浏览器关闭了session cookies，您也不能使用PHP session，请在浏览器/防火墙中关闭禁止cookie的工具。<br /><br />请联系主机商确认您网站的PHP sessions已正确设置。<br /><br /></li>
</ul>
</p>');
  define('START_INSTALL', '开始安装');
