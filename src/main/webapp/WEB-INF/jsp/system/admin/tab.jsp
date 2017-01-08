<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	System.out.print("path");
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="plugins/tab/js/framework.js"></script>
<link href="plugins/tab/css/import_basic.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" />
<script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
</head>
<style>
</style>
<body>
	<div id="tab_menu" style="height: 30px;"></div>
	<div style="width: 100%;">
		<div id="page" style="width: 100%; height: 100%;" >
		</div>
	</div>
</body>
<script type="text/javascript">
	var tab;
	$(function() {
	tab = new TabView({
			containerId : 'tab_menu',
			pageid : 'page',
			cid : 'tab1',
			position : "top"
		});
		tab.add({
			id : 'home',
			title : "主页",
			url : "home",
			isClosed : false
		});

	});
	function tabAddHandler(mid, mtitle, murl) {
		tab.update({
			id : mid,
			title : mtitle,
			url : murl,
			isClosed : true
		});
		tab.add({
			id : mid,
			title : mtitle,
			url : murl,
			isClosed : true
		});
		tab.activate(mid);
	}
	function cmainFrameT() {
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		var dheightT = document.documentElement.scrollHeight;
		var height = Math.max(bheightT, dheightT);
		hmainT.style.height = (height*2) + 'px';
	}
	cmainFrameT();
	window.onresize = function() {
		cmainFrameT();
	};
</script>
</html>

