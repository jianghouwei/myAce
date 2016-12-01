<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
</head>
<!-- page specific plugin styles -->
<body class="no-skin">
	<div id="navbar" class="navbar navbar-default ace-save-state">
		<!-- 顶部 -->
		<%@ include file="head.jsp"%>
	</div>
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>
		<script type="text/javascript">
			function reinitIframe() {
				var iframe = document.getElementById("mainFrame");
				try {
					var bHeight = iframe.contentWindow.document.body.scrollHeight;
					var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
					var height = Math.max(bHeight, dHeight);
					iframe.height = height;
					console.log(height);
				} catch (ex) {
				}
			}
			window.setInterval("reinitIframe()", 100);
		</script>
		<!-- 菜单 -->
		<%@ include file="left.jsp"%>
		<div class="main-content">
			<div class="main-content-inner">
				<iframe name="mainFrame" id="mainFrame" 
					frameborder="0" scrolling="no" width="100%" height="100%"
					onload="this.height=100"></iframe>
			</div>
		</div>
		<div class="footer">
			<!-- 底部  -->
			<%@ include file="floor.jsp"%>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
</body>
</html>