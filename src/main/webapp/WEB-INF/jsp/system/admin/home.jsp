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
<html>
<head>
<base href="<%=basePath%>">
<%@ include file="../../system/admin/common.jsp"%>
</head>
<body>
	<div class="main-content-inner">
		<div class="page-content">
			<div class="page-header">
				<h1>
					日程管理
				</h1>
			</div>
			<!-- /.page-header -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-sm-9">
							<div class="space"></div>
							<div id="calendar"></div>
						</div>
						<div class="col-sm-3">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4>标签</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding">
										<div id="external-events">
											<div class="external-event label-danger"
												data-class="label-danger">
												<i class="ace-icon fa fa-arrows"></i>重要且紧急
											</div>
											<div class="external-event label-purple"
												data-class="label-purple">
												<i class="ace-icon fa fa-arrows"></i>紧急不重要
											</div>
											<div class="external-event label-yellow"
												data-class="label-yellow">
												<i class="ace-icon fa fa-arrows"></i>重要不紧急
											</div>
											<div class="external-event label-grey"
												data-class="label-grey">
												<i class="ace-icon fa fa-arrows"></i>不紧急不重要
											</div>
											<label> <input type="checkbox"
												class="ace ace-checkbox" id="drop-remove" /> <span
												class="lbl"> 使用后移除标签</span>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
			<!-- /.col -->
		</div>
	</div>
	<!-- /.row -->
	<!-- /.page-content -->

</body>
<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {

		/*-----------------------------------------------------------------*/
		$('#external-events div.external-event').each(function() {
			var eventObject = {
				title : $.trim($(this).text())
			};
			$(this).data('eventObject', eventObject);
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});
		});
		/* initialize the calendar
		-----------------------------------------------------------------*/
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var calendar = $('#calendar')
				.fullCalendar(
						{
							//isRTL: true,
							//firstDay: 1,// >> change first day of week 
							buttonText : {
								today : '本月',
								month : '月',
								week : '周',
								day : '日',
								prev : '上一月',
								next : '下一月'
							},
							today : [ "今天" ],
							firstDay : 1,
							monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月",
									"七月", "八月", "九月", "十月", "十一月", "十二月" ],
							monthNamesShort : [ "一月", "二月", "三月", "四月", "五月",
									"六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
							dayNames : [ "周日", "周一", "周二", "周三", "周四", "周五",
									"周六" ],
							dayNamesShort : [ "周日", "周一", "周二", "周三", "周四",
									"周五", "周六" ],
							buttonHtml : {
								prev : '<i class="ace-icon fa fa-chevron-left"></i>',
								next : '<i class="ace-icon fa fa-chevron-right"></i>'
							},
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay'
							},
							events : [
									{
										title : 'All Day Event',
										start : new Date(y, m, 1),
										className : 'label-important'
									},
									{
										title : 'Long Event',
										start : moment().subtract(5, 'days')
												.format('YYYY-MM-DD'),
										end : moment().subtract(1, 'days')
												.format('YYYY-MM-DD'),
										className : 'label-success'
									}, {
										title : 'Some Event',
										start : new Date(y, m, d - 3, 16, 0),
										allDay : false,
										className : 'label-info'
									} ],

							/**eventResize: function(event, delta, revertFunc) {

								alert(event.title + " end is now " + event.end.format());

								if (!confirm("is this okay?")) {
									revertFunc();
								}

							},*/

							editable : true,
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');
								var $extraEventClass = $(this).attr(
										'data-class');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = false;
								if ($extraEventClass)
									copiedEventObject['className'] = [ $extraEventClass ];

								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);
								if ($('#drop-remove').is(':checked')) {
									$(this).remove();
								}
							},
							selectable : true,
							selectHelper : true,
							select : function(start, end, allDay) {

								bootbox.prompt("New Event Title:", function(
										title) {
									if (title !== null) {
										calendar.fullCalendar('renderEvent', {
											title : title,
											start : start,
											end : end,
											allDay : allDay,
											className : 'label-info'
										}, true // make the event "stick"
										);
									}
								});

								calendar.fullCalendar('unselect');
							},
							eventClick : function(calEvent, jsEvent, view) {

								//display a modal
								var modal = '<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';

								var modal = $(modal).appendTo('body');
								modal.find('form').on(
										'submit',
										function(ev) {
											ev.preventDefault();

											calEvent.title = $(this).find(
													"input[type=text]").val();
											calendar.fullCalendar(
													'updateEvent', calEvent);
											modal.modal("hide");
										});
								modal
										.find('button[data-action=delete]')
										.on(
												'click',
												function() {
													calendar
															.fullCalendar(
																	'removeEvents',
																	function(ev) {
																		return (ev._id == calEvent._id);
																	})
													modal.modal("hide");
												});

								modal.modal('show').on('hidden', function() {
									modal.remove();
								});

								//console.log(calEvent.id);
								//console.log(jsEvent);
								//console.log(view);

								// change the border color just for fun
								//$(this).css('border-color', 'red');

							}

						});

	})
</script>
</html>