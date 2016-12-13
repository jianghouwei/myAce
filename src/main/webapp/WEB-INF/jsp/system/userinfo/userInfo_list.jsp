<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<%-- <%@ include file="../../system/admin/common.jsp"%> --%>
</head>
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="static/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="static/css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="static/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<link rel="stylesheet" href="static/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="static/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
		<![endif]-->
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<!-- <div class="page-header"></div> -->
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<table id="userinfo-table"
						class="table table-striped table-bordered table-hover">

					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="static/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="static/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document.write("<script src='static/js/jquery.mobile.custom.min.js'>"
				+ "<"+"/script>");
</script>
<script src="static/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="static/js/jquery.dataTables.min.js"></script>
<script src="static/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="static/js/dataTables.buttons.min.js"></script>
<script src="static/js/buttons.flash.min.js"></script>
<script src="static/js/buttons.html5.min.js"></script>
<script src="static/js/buttons.print.min.js"></script>
<script src="static/js/buttons.colVis.min.js"></script>
<script src="static/js/dataTables.select.min.js"></script>

<!-- ace scripts -->
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		//initiate dataTables plugin
		$('#userinfo-table').dataTable({
			bAutoWidth : false,
			"aoColumns" : [ {
				"bSortable" : false
			}, null, null, null, null, null, {
				"bSortable" : false
			} ],
			"bFilter" : false, //
			"bSort" : false, //是否启动各个字段的排序功能   
			"bRetrieve" : false,
			"bDestroy" : true,
			"bServerSide" : true,
			"renderer":"bootstrap",
			"sAjaxSource" : "sys/getUserPage.json",
			"fnServerParams" : function(aoData) { //查询条件
				aoData.push({
					"name" : "userName",
					"value" : "admin"
				});
			},
			//服务
			"fnServerData" : function(sSource, aoData, fnCallback) {
				$.ajax({
					"dataType" : 'json',
					"type" : "post",
					"url" : sSource,
					"data" : aoData,
					"success" : fnCallback
				});
			},
			//展示字段
			"aoColumns" : [ {
				"sTitle" : "id",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "8%",
				"mDataProp" : "id"
			}, {
				"sTitle" : "登录名",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "7%",
				"mDataProp" : "userName"
			}, {
				"sTitle" : "昵称",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "7%",
				"mDataProp" : "nikeName"
			}, {
				"sTitle" : "手机",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "7%",
				"mDataProp" : "phone"
			}, {
				"sTitle" : "生日",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "7%",
				"mDataProp" : "birthday",
				"mRender" : function(data, type, full) {
					return new Date(data).toString('yyyy-MM-dd');
				}
			}, {
				"sTitle" : "创建日期",
				"sDefaultContent" : "",
				"sWidth" : "7%",
				"sClass" : "center",
				"mDataProp" : "joined"
			} ],
			select : {
				style : 'multi'
			}
		});
	});
	/* 	$(document).ready(function() {
	 $("#userinfo").dataTable({
	 //"bFilter" : false, //
	 "sPaginationType" : "full_numbers", //一共两种样式 另一种为two_button // 是datatables默认
	 "bSort" : false, //是否启动各个字段的排序功能   
	 //"bLengthChange" : true,//
	 "sPaginationType" : "bootstrap",
	 "sAjaxSource" : "sys/getUserPage.json",
	 "aLengthMenu" : [ 20, 40, 60 ], //更改显示记录数选项 
	 //"bRetrieve" : false,
	 //"bDestroy" : true,
	 //"processing" : true,
	 "serverSide" : true,
	 "bPaginate" : true,// 分页按钮
	 "fnServerParams" : function(aoData) { //查询条件
	 aoData.push({
	 "name" : "userName",
	 "value" : "admin"
	 });
	 },
	 //服务
	 "fnServerData" : function(sSource, aoData, fnCallback) {
	 $.ajax({
	 "dataType" : 'json',
	 "type" : "post",
	 "url" : sSource,
	 "data" : aoData,
	 "success" : fnCallback
	 });
	 },
	 //展示字段
	 "aoColumns" : [ {
	 "sTitle" : "id",
	 "sDefaultContent" : "",
	 "sClass" : "center",
	 "sWidth" : "8%",
	 "mDataProp" : "id"
	 }, {
	 "sTitle" : "登录名",
	 "sDefaultContent" : "",
	 "sClass" : "center",
	 "sWidth" : "7%",
	 "mDataProp" : "userName"
	 }, {
	 "sTitle" : "昵称",
	 "sDefaultContent" : "",
	 "sClass" : "center",
	 "sWidth" : "7%",
	 "mDataProp" : "nikeName"
	 }, {
	 "sTitle" : "手机",
	 "sDefaultContent" : "",
	 "sClass" : "center",
	 "sWidth" : "7%",
	 "mDataProp" : "phone"
	 }, {
	 "sTitle" : "生日",
	 "sDefaultContent" : "",
	 "sClass" : "center",
	 "sWidth" : "7%",
	 "mDataProp" : "birthday"
	 "mRender" : function(data, type, full) {
	 return new Date(data).toString('yyyy-MM-dd');
	 } 
	 }, {
	 "sTitle" : "创建日期",
	 "sDefaultContent" : "",
	 "sWidth" : "7%",
	 "sClass" : "center",
	 "mDataProp" : "joined"
	 } ]
	 }); 
	 });*/
</script>
</html>