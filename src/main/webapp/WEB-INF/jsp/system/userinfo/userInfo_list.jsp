<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<%@ include file="../../system/admin/common.jsp"%>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-header">系统管理/用户管理</div>
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<div class="clearfix">
						<div class="pull-right tableTools-container"></div>
					</div>
					<div class="alert alert-info">
						<button class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
						</button>
						<i class="ace-icon fa fa-hand-o-right"></i> 请阅！！！！
					</div>
					<div class="table-header"></div>
					<div>
						<table id="userinfo-table"
							class="table table-striped table-bordered table-hover">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- basic scripts -->
<script type="text/javascript">
	jQuery(function($) {
		$('#userinfo-table').dataTable({
			"bFilter" : false, //
			"bSort" : false, //是否启动各个字段的排序功能   
			"bLengthChange" : true,//
			"sPaginationType" : "bootstrap",
			"sAjaxSource" : "sys/userinfo.json",
			"bRetrieve" : false,
			"bDestroy" : true,
			"fnServerParams" : function(aoData) { //查询条件
				aoData.push({
					"name" : "appId",
					"value" : $("#price_appId").val()
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
				"mDataProp" : "countTime",
				"sTitle" : "日期",
				"sDefaultContent" : "",
				"sWidth" : "7%",
				"sClass" : "center",
				"mRender" : function(data, type, full) {
					return new Date(data).toString('yyyy-MM-dd');
				}
			}, {
				"sTitle" : "应用名称",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "8%",
				"mDataProp" : "appName"
			}, {
				"sTitle" : "计费值(估值)",
				"sDefaultContent" : "",
				"sClass" : "center",
				"sWidth" : "7%",
				"mDataProp" : "feesReckon"
			} ]
		});
	});
</script>
</html>