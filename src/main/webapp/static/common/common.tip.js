/*//   
// Sample 2：需要用户手动关闭
$.jGrowl("Stick this!", {
	sticky : true
});
// Sample 3：增加标题
$.jGrowl("A message with a header", {
	header : 'Important'
});
// Sample 4：指定在10秒后自动消失
$.jGrowl("A message that will live a little longer.", {
	life : 10000
});
// Sample 5：消失后有回调事件
$.jGrowl("A message ",
				{
					beforeClose : function(e, m) {
						alert('About to close this notification!');
					},
					animateOpen : {
						height : 'show'
					}
				});*/

/**
 * 成功提示
 */
function alertSufMsg() {
	$.jGrowl("操作成功", {
		life : 3000,
		position : "bottom-right"
	});
}
/**
 * 失败通用提示
 * 3秒后消失
 */
function alertErrorMsg() {
	$.jGrowl("操作失败", {
		life : 3000,
		position : "bottom-right"
	});
}
/**
 * 返回指定输出内容
 * 默认显示时间3毫秒
 * @param msg
 */
function alertMsg(msg) {
	$.jGrowl(msg, {
		life : 3000,
		position : "bottom-right"
	});
}

/**
 * 操作提示
 */
function jgrowlAlertMsg(msg) {
	$.jGrowl(msg, {
		life : 50000,
		position : "bottom-right"
	});
};


function showStickySuccessToast() {
	$().toastmessage('showToast', {
		text : 'Success Dialog which is sticky',
		sticky : true,
		position : 'top-right',
		type : 'success',
		closeText : '',
		close : function() {
			console.log("toast is closed ...");
		}
	});

}
