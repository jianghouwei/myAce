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
<%@ include file="../../system/admin/common.jsp"%>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="row">
				<div class="col-xs-12">
					<div class="hr hr-18 dotted hr-double"></div>
					<table id="userinfo-table"
						class="table table-striped table-bordered table-hover">
					</table>
				</div>
			</div>
		</div>
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<div id="modal-table" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content"></div>
			<!-- /.modal-dialog -->
		</div>
	</div>
</body>
<script type="text/javascript">
	jQuery(function($) {
		//initiate dataTables plugin
<<<<<<< HEAD
		$('#userinfo-table')
				.dataTable(
						{
							bAutoWidth : false,
							"aoColumns" : [ {
								"bSortable" : false
							}, null, null, null, null, null, {
								"bSortable" : false
							} ],
							"bFilter" : false, //
							"bSort" : false, //是否启动各个字段的排序功能   
							"bRetrieve" : true,
							"bDestroy" : true,
							"bServerSide" : true,
							"renderer" : "bootstrap",
							'sPaginationType' : 'full_numbers',
							"sAjaxSource" : "sys/getUserPage.json",
							/* "fnServerParams" : function(aoData) { //查询条件
								aoData.push({
									"name" : "userName",
									"value" : "admin"
								});
							}, */
							"language" : {
								"lengthMenu" : "_MENU_ 条记录每页",
								"zeroRecords" : "没有找到记录",
								"info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 ) 从 _START_ 到 _END_ /共 _TOTAL_ 条数据 ",
								"infoEmpty" : "无记录",
								"infoFiltered" : "(从 _MAX_ 条记录过滤)",
								"paginate" : {
									"last" : "尾页",
									"first" : "首页",
									"previous" : "上一页",
									"next" : "下一页"
								}
							},
							//服务
							"fnServerData" : function(sSource, aoData,
									fnCallback) {
								$.ajax({
									"dataType" : 'json',
									"type" : "post",
									"url" : sSource,
									"data" : aoData,
									"success" : fnCallback
								});
							},
							//展示字段
							"aoColumns" : [
									{
										"sTitle" : "id",
										"sDefaultContent" : "",
										"sClass" : "center",
										"sWidth" : "8%",
										"mDataProp" : "id"
									},
									{
										"sTitle" : "登录名",
										"sDefaultContent" : "",
										"sClass" : "center",
										"sWidth" : "7%",
										"mDataProp" : "userName"
									},
									{
										"sTitle" : "昵称",
										"sDefaultContent" : "",
										"sClass" : "center",
										"sWidth" : "7%",
										"mDataProp" : "nikeName"
									},
									{
										"sTitle" : "手机",
										"sDefaultContent" : "",
										"sClass" : "center",
										"sWidth" : "7%",
										"mDataProp" : "phone"
									},
									{
										"sTitle" : "生日",
										"sDefaultContent" : "",
										"sClass" : "center",
										"sWidth" : "7%",
										"mDataProp" : "birthday",
										"mRender" : function(data, type, full) {
											if(data !=null){
												return moment(data).format('YYYY-MM-DD')
											}else{
												return null;
											}
											
											//return new Date(data);
										}
									},
									{
										"sTitle" : "创建日期",
										"sDefaultContent" : "",
										"sWidth" : "7%",
										"sClass" : "center",
										"mDataProp" : "joined"
									},
									{
										"sTitle" : "操作",
										"sDefaultContent" : "",
										"sWidth" : "7%",
										"sClass" : "center",
										"mRender" : function(data, type, full) {
											var html = '<div class="hidden-sm hidden-xs action-buttons">'
													+ '<a class="blue tooltip-info" data-toggle="modal" data-rel="tooltip" role="button" title="查看" href="#modal-table"><i class="ace-icon fa fa-search-plus bigger-130"></i></a>'
													+ '<a class="green tooltip-info" data-toggle="modal" role="button" href="userinfo/goEdit.do?id='+full.id+'" data-rel="tooltip" data-target="#modal-table" title="编辑" ><i class="ace-icon fa fa-pencil bigger-130"></i></a>'
													+ '<a class="red tooltip-info" data-toggle="modal" role="button" href="#modal-table" data-rel="tooltip" title="删除" ><i class="ace-icon fa fa-trash-o bigger-130"></i></a></div>';
											return html;
										}
									} ],
							select : {
								style : 'multi'
							}
						});

	});
</script>


</html>