<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal-header no-padding" id="userInfoAdd">
	<div class="table-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">
			<span class="white">&times;</span>
		</button>
		用户新增
	</div>
	<div class="modal-body no-padding">
		<div class="row">
			<form class="form-horizontal" role="form">
				<input type="hidden" id="id" name="id" />
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1">昵称</label>
					<div class="col-sm-9">
						<input type="text" id="nikeName" name="nikeName" placeholder="昵称"
							class="col-xs-10 col-sm-5" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1">手机</label>
					<div class="col-sm-9">
						<input type="text" id="phone" name="phone" placeholder="手机"
							class="col-xs-10 col-sm-5" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1">生日</label>
					<div class="col-sm-9">
						<span class="input-icon input-icon-right"> <input
							class="form-control date-picker input-large" id="birthday"
							name="birthday" type="text" data-date-format="yyyy-mm-dd" /> <i
							class="ace-icon fa fa-calendar"></i>
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal-footer no-margin-top">
		<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
			<i class="ace-icon fa fa-times"></i> 关闭
		</button>
		<button class="btn btn-sm btn-success pull-right" onclick="addSave();">
			<i class="ace-icon fa fa-floppy-o"></i>保存
		</button>
	</div>
</div>
<script type="text/javascript">
<!--
	$('.date-picker').datepicker({
		autoclose : true,
		todayHighlight : true
	})
	//-->
	$(function() {
		//$.jGrowl();
	});
	//编辑保存
	function addSave() {
		var param = new Object();
		param.id = $('#id').val();
		param.nikeName = $("#nikeName").val();
		param.phone = $("#phone").val();
		param.birthday = $("#birthday").val();
		commitAjaxSetMsg("userinfo/doEdit.json", param, "userinfo-table");
	}
</script>
<!-- /.modal-content -->
