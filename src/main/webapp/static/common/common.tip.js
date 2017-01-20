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
 * 操作提示
 */
function jgrowlAlertMsg(msg) {
	$.jGrowl(msg, {
		life : 50000,
		position : "bottom-right"
	});
	alert(11111111);
};
/**
 * Sample 1：提示后自动消息
 * 
 * @param n1
 * @param n2
 */
function jgrowlmsg(msg) {
	$.jGrowl(msg);
};
/**
 * Sample 4：指定时间后关闭 毫秒级
 */
function jgrowlTimeMsg(msg, time) {
	$.jGrowl(msg, {
		life : time
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
