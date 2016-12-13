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
			<div class="page-header">
				<h1>
					jqGrid <small> <i class="ace-icon fa fa-angle-double-right"></i>
						Dynamic tables and grids using jqGrid plugin
					</small>
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- 提示 -->
					<div class="alert alert-info">
						<button class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
						</button>

						<i class="ace-icon fa fa-hand-o-right"></i> 请阅！！！！
					</div>
					<table id="grid-table"></table>
					<div id="grid-pager"></div>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
</body>
<!-- basic scripts -->
<script type="text/javascript">
	var grid_data = [ {
		id : "1",
		name : "Desktop Computer",
		note : "note",
		stock : "Yes",
		ship : "FedEx",
		sdate : "2007-12-03"
	} ];

	jQuery(function($) {
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";
		var parent_column = $(grid_selector).closest('[class*="col-"]');
		$(window).on('resize.jqGrid', function() {
			$(grid_selector).jqGrid('setGridWidth', parent_column.width());
		})
		$(document).on(
				'settings.ace.jqGrid',
				function(ev, event_name, collapsed) {
					if (event_name === 'sidebar_collapsed'
							|| event_name === 'main_container_fixed') {
						setTimeout(function() {
							$(grid_selector).jqGrid('setGridWidth',
									parent_column.width());
						}, 20);
					}
				})

		$(window).on('resize.jqGrid', function() {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid('setGridWidth', parent_width);
		})
		$('# a[data-toggle="tab"]').on(
				'shown.bs.tab',
				function(e) {
					if ($(e.target).attr('href') == '#mygrid') {
						var parent_width = $(grid_selector)
								.closest('.tab-pane').width();
						$(grid_selector).jqGrid('setGridWidth', parent_width);
					}
				})
		jQuery(grid_selector).jqGrid(
				{
					data : grid_data,
					datatype : "local",
					height : "auto",
					colNames : [ 'ID', 'Last Sales', 'Name', 'Stock',
							'Ship via', 'Notes', '操作' ],
					colModel : [ {
						name : 'id',
						index : 'id',
						width : 60,
						sorttype : "int"
					}, {
						name : 'sdate',
						index : 'sdate',
						width : 90
					}, {
						name : 'name',
						index : 'name',
						width : 150
					},{
						name : 'stock',
						index : 'stock',
						width : 70
					}, {
						name : 'ship',
						index : 'ship',
						width : 90
					}, {
						name : 'note',
						index : 'note',
						width : 80,
						sortable : false,
						editable : true,
						edittype : "textarea",
						editoptions : {
							rows : "2",
							cols : "10"
						}
					}, {
						name : 'myac',
						index : '',
						width : 120,
						fixed : true,
						sortable : false,
						resize : false,
						formatter : 'actions',
						formatoptions : {
							keys : true,
							//删除
							delOptions : {
								recreateForm : true,
								beforeShowForm : beforeDeleteCallback
							},
							//编辑
							editOptions : {
								recreateForm : true,
								beforeShowForm : beforeEditCallback
							},
							//查看
							editOptions : {
								recreateForm : true,
								beforeShowForm : beforeEditCallback
							}
						}
					} ],

					viewrecords : true,
					rowNum : 10,
					rowList : [ 10, 20, 30 ],
					pager : pager_selector,
					altRows : true,
					multiselect : true,
					multiboxonly : true,
					loadComplete : function() {
						var table = this;
						setTimeout(function() {
							styleCheckbox(table);
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
					editurl : "./dummy.php",
					caption : "jqGrid with inline editing"
				});

		$(window).triggerHandler('resize.jqGrid');
		function aceSwitch(cellvalue, options, cell) {
			setTimeout(function() {
				$(cell).find('input[type=checkbox]').addClass(
						'ace ace-switch ace-switch-5').after(
						'<span class="lbl"></span>');
			}, 0);
		}
		function pickDate(cellvalue, options, cell) {
			setTimeout(function() {
				$(cell).find('input[type=text]').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true
				});
			}, 0);
		}

		jQuery(grid_selector).jqGrid(
				'navGrid',pager_selector,
				{
					edit : true,
					editicon : 'ace-icon fa fa-pencil blue',
					add : true,
					addicon : 'ace-icon fa fa-plus-circle purple',
					del : true,
					delicon : 'ace-icon fa fa-trash-o red',
					search : true,
					searchicon : 'ace-icon fa fa-search orange',
					refresh : true,
					refreshicon : 'ace-icon fa fa-refresh green',
					view : true,
					viewicon : 'ace-icon fa fa-search-plus grey',
				},
				{
					recreateForm : true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find(
								'.ui-jqdialog-titlebar').wrapInner(
								'<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//new record form
					//width: 700,
					closeAfterAdd : true,
					recreateForm : true,
					viewPagerButtons : false,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find(
								'.ui-jqdialog-titlebar').wrapInner(
								'<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					recreateForm : true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						if (form.data('styled'))
							return false;

						form.closest('.ui-jqdialog').find(
								'.ui-jqdialog-titlebar').wrapInner(
								'<div class="widget-header" />')
						style_delete_form(form);

						form.data('styled', true);
					},
					onClick : function(e) {
					}
				},
				{
					recreateForm : true,
					afterShowSearch : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title')
								.wrap('<div class="widget-header" />')
						style_search_form(form);
					},
					afterRedraw : function() {
						style_search_filters($(this));
					},
					multipleSearch : true,
				},
				{
					recreateForm : true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title')
								.wrap('<div class="widget-header" />')
					}
				})

		function style_edit_form(form) {
			form.find('input[name=sdate]').datepicker({
				format : 'yyyy-mm-dd',
				autoclose : true
			})

			form.find('input[name=stock]').addClass(
					'ace ace-switch ace-switch-5').after(
					'<span class="lbl"></span>');
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-primary').prepend(
					'<i class="ace-icon fa fa-check"></i>');
			buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

			buttons = form.next().find('.navButton a');
			buttons.find('.ui-icon').hide();
			buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
			buttons.eq(1)
					.append('<i class="ace-icon fa fa-chevron-right"></i>');
		}

		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm btn-white btn-round').find(
					'[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend(
					'<i class="ace-icon fa fa-trash-o"></i>');
			buttons.eq(1).addClass('btn-default').prepend(
					'<i class="ace-icon fa fa-times"></i>')
		}

		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}
		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass(
					'btn btn-sm btn-info').find('.ui-icon').attr('class',
					'ace-icon fa fa-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass(
					'btn btn-sm btn-inverse').find('.ui-icon').attr('class',
					'ace-icon fa fa-comment-o');
			buttons.find('.EditButton a[id*="_search"]').addClass(
					'btn btn-sm btn-purple').find('.ui-icon').attr('class',
					'ace-icon fa fa-search');
		}
		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if (form.data('styled'))
				return false;
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
			style_delete_form(form);
			form.data('styled', true);
		}

		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
		function styleCheckbox(table) {
			$(table).find('input:checkbox').addClass('ace').wrap('<label />')
					.after('<span class="lbl align-top" />')

			$('.ui-jqgrid-labels th[id*="_cb"]:first-child').find(
					'input.cbox[type=checkbox]').addClass('ace').wrap(
					'<label />').after('<span class="lbl align-top" />');
		}
		function updateActionIcons(table) {
		}

		function updatePagerIcons(table) {
			var replacement = {
				'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
				'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
				'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
				'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
					.each(
							function() {
								var icon = $(this);
								var $class = $.trim(icon.attr('class').replace(
										'ui-icon', ''));

								if ($class in replacement)
									icon.attr('class', 'ui-icon '
											+ replacement[$class]);
							})
		}
		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({
				container : 'body'
			});
			$(table).find('.ui-pg-div').tooltip({
				container : 'body'
			});
		}
		$(document).one('ajaxloadstart.page', function(e) {
			$.jgrid.gridDestroy(grid_selector);
			$('.ui-jqdialog').remove();
		});
	});
</script>
</html>