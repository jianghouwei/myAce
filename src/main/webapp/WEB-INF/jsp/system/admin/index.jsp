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
		<!-- 菜单 -->
		<%@ include file="left.jsp"%>
		<div class="main-content">
			<div class="main-content-inner">
				<iframe name="mainFrame" id="mainFrame" ></iframe>
			</div>
		</div>
		<div class="footer">
			<!-- 底部  -->
			<%@ include file="floor.jsp"%>
		</div>
	</div>
</body>
</html>