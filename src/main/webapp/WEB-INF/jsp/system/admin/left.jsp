<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar" class="sidebar responsive ace-save-state">
	<script type="text/javascript">
		try {
			ace.settings.loadState('sidebar')
		} catch (e) {
		}
		//class="active open" active
		function siMenu(id, fid) {
			//alert(id+fid);
			/* if (id != mid) {
				$("#" + mid).removeClass();
				mid = id;
			}
			if (fid != fmid) {
				$("#" + fmid).removeClass();
				fmid = fid;
			} */
			$(".active").removeClass();
			$("#" + fid).attr("class", "active open");
			$("#" + id).attr("class", "active");
			//top.mainFrame.tabAddHandler(id, name, url);
		}
	</script>
	<!-- 快捷菜单栏  -->
	<!-- <div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>
		</div>
		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div> -->
	<!-- /.sidebar-shortcuts -->
	<ul class="nav nav-list">
		<li><a href="index.html"> 
		      <i class="menu-icon fa fa-tachometer"></i> 
		      <span class="menu-text">首页</span></a> 
		<b class="arrow"></b>
		</li>
		<c:set var="index" value="0" scope="request" /><!-- 自增序号，注意scope-->  
		<c:set var="level" value="0" scope="request" /><!-- 记录树的层次，注意scope-->
		<c:import url="menu_tree.jsp" />
	</ul>
	<!-- /.nav-list -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon"
			class="ace-icon fa fa-angle-double-left ace-save-state"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	<script type="text/javascript">
		
	</script>
</div>