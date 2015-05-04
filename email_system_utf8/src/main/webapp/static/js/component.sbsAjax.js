/*
 * Version:  v1.0
 * Website:  http://www.19lou.com
 * Author:  gaoli
 * Recently: gaoli (2010-6-26)
 */

(function($){
	$.extend({
		sbsAjax:function(id,options){
			//clearWinTips
			if($.clearWinTips){
				$.clearWinTips();
			}
			//init
			var obj = $(id),
				obj_disabled = obj.hasClass("disabled"),
				obj_text = obj.text(),
				opt_success = options.success,
				opt_hold = options.hold || false,
				btn_toggle = function(){
					obj.filter(".confirm_btn , .options_btn").toggleClass("disabled_small");
					obj.filter(".submit_btn,.reply_btn,.option_btn").toggleClass("disabled_big");
				};
			if(!obj_disabled){
				obj.addClass("disabled");

				loadTime = setTimeout(function(){
					obj.find("span").text("?á????").prepend("<span class='loading'>loading</span>");
				},3000);

				btn_toggle();
				defaults = {
					success:function(data){
						clearTimeout(loadTime);
						opt_success(data);
						btn_toggle();
						if(!opt_hold || !data.success){
							obj.removeClass("disabled");
						}
						obj.find("span").text(obj_text);
					}
				};
				if(!options.contentType){
					defaults.contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
				};
				options = $.extend({},options,defaults);
				//ajax
				$.ajax(options);
			}
		}
	});
})(jQuery);