<meta charset="utf-8" />
<title>MyAceAdmin</title>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!------------------------ BASE CSS START ----------------->
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="static/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="static/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet" href="static/css/jquery-ui.min.css" />
<link rel="stylesheet" href="static/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="static/css/ui.jqgrid.min.css" />
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
<!------------------------------------ BASE CSS END --------------------------------------->
<link rel="stylesheet" href="static/css/fullcalendar.min.css" />
<link rel="stylesheet" href="plugins/jgrowl/jquery.jgrowl.css"
	type="text/css" />
<link rel="stylesheet"
	href="plugins/toastmessage/css/jquery.toastmessage.css" />


<!------------------------------- basic scripts start ----------------------->
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
<script src="static/js/bootstrap-datepicker.min.js"></script>
<script src="static/js/jquery.jqGrid.min.js"></script>
<script src="static/js/grid.locale-cn.js"></script>

<!-- ace scripts -->
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<!-- page specific plugin scripts -->
<script src="static/js/jquery.dataTables.min.js"></script>
<script src="static/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="static/js/dataTables.buttons.min.js"></script>
<script src="static/js/buttons.flash.min.js"></script>
<script src="static/js/buttons.html5.min.js"></script>
<script src="static/js/buttons.print.min.js"></script>
<script src="static/js/buttons.colVis.min.js"></script>
<script src="static/js/dataTables.select.min.js"></script>
<script src="static/js/moment.min.js"></script>


<!------------------------------- basic scripts end ----------------------->
<script src="static/js/jquery-ui.custom.min.js"></script>
<script src="static/js/jquery.ui.touch-punch.min.js"></script>
<script src="static/js/moment.min.js"></script>
<script src="static/js/fullcalendar.min.js"></script>
<script src="static/js/bootbox.js"></script>
<script src="plugins/jgrowl/jquery.jgrowl.js"></script>
<!-- <script src="plugins/toastmessage/jquery.toastmessage.js"></script> -->
<script src="static/common/common.tip.js"></script>
<script src="static/common/common.ajax.js"></script>

<script src="plugins/zDrag/zDrag.js"></script>
<script src="plugins/zDrag/zDialog.js"></script>

<div id="modal-table" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content"></div>
		<!-- /.modal-dialog -->
	</div>
</div>
