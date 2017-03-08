<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<form class="form-horizontal" role="form">
		<input type="hidden" id="id" name="id" value="${userInfo.id}" />
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right"
				for="form-field-1">昵称</label>
			<div class="col-sm-9">
				<input type="text" id="nikeName" name="nikeName" placeholder="昵称"
					class="col-xs-10 col-sm-5" value="${userInfo.nikeName}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right"
				for="form-field-1">手机</label>
			<div class="col-sm-9">
				<input type="text" id="phone" name="phone" placeholder="手机"
					class="col-xs-10 col-sm-5" value="${userInfo.phone}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right"
				for="form-field-1">生日</label>
			<div class="col-sm-9">
				<span class="input-icon input-icon-right"> <input
					value="${userInfo.birthday}"
					class="form-control date-picker input-large" id="birthday"
					name="birthday" type="text" data-date-format="yyyy-mm-dd" /> <i
					class="ace-icon fa fa-calendar"></i>
				</span>
			</div>
		</div>
		<!-- <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="button">
					<i class="ace-icon fa fa-check bigger-110"></i>提交
				</button>
				&nbsp; &nbsp; &nbsp;
				<button class="btn" type="reset">
					<i class="ace-icon fa fa-undo bigger-110"></i> Reset
				</button>
			</div>
		</div> -->
	</form>
</div>
<script type="text/javascript">
	$(function() {
		//$.jGrowl();
	});
</script>
<!-- /.modal-content -->
