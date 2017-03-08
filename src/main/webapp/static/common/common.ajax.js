/**
 * 返回提示信息后台给定
 * 
 * @param url
 * @param params
 *            参数
 * @param type
 * @param dataType
 */
function commitAjaxSetMsg(url, param, tableId) {
	var _type = "post";
	var _dataType = "json";
	$.ajax({
		url : url,
		data : param,
		dataType : _dataType,
		type : _type,
		success : function(data) {
			if (data.status == "ok") {
				$('#modal-table').modal('hide');// modal 隐藏
				$('#' + tableId).dataTable().fnDraw(false);
				alertSufMsg(data.msg);
			} else {
				alertErrorMsg();
			}
		}
	})
}


/**
 * 返回提示信息系统默认
 * 
 * @param url
 * @param params
 *            参数
 * @param type
 * @param dataType
 */
function commitAjax(url, param, tableId) {
	var _type = "post";
	var _dataType = "json";
	$.ajax({
		url : url,
		data : param,
		dataType : _dataType,
		type : _type,
		success : function(data) {
			if (data.status == "ok") {
				//$('#modal-table').modal('hide');// modal 隐藏
				//$('#modal-table').modal('destroy');// modal 隐藏
				$('#' + tableId).dataTable().fnDraw(false);
				alertSufMsg();
			} else {
				alertErrorMsg();
			}
		}
	})
}


/**
 * 删除并且刷新列表数据
 * 
 * @param url
 * @param params
 *            参数
 * @param type
 * @param dataType
 */
function doDelById(url,tableId) {
	var _type = "post";
	var _dataType = "json";
	$.ajax({
		url : url,
		type : _type,
		success : function(data) {
			if (data.status == "ok") {
				$('#' + tableId).dataTable().fnDraw(false);
				alertSufMsg(data.msg);
			} else {
				alertErrorMsg();
			}
		}
	})
}


/**
 * 查询-- 刷新列表
 * 
 * @param url
 * @param params
 *            参数
 * @param type
 * @param dataType
 */
function queryOfParam(tableId) {
	$('#' + tableId).dataTable().fnDraw(false);
}

/**
 * 模拟A标签提交
 * @param url
 */
function queryOfId(url){
	window.location.href = url +"&random"+ Math.random();
}


