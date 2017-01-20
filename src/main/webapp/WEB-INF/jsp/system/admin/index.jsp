<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
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
					var bHeight = document.documentElement.clientHeight;
					var dHeight = document.documentElement.scrollHeight;
					var height = Math.max(bHeight, dHeight);
					iframe.style.height = (height) + 'px';
				} catch (ex) {
				}
			}
			reinitIframe();
			window.onresize = function() {
				reinitIframe();
			};
		</script>
		<!-- 菜单 -->
		<%@ include file="left.jsp"%>
		<div class="main-content">
			<iframe name="mainFrame" id="mainFrame" frameborder="0" src="tab"
				scrolling="no" width="100%" height="100%"></iframe>
			<!-- 返回顶部 -->
			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div>
		<div class="footer">
			<!-- 底部  -->
			<%@ include file="floor.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
	});
</script>
</html>