(function($){
	
	$(function(){

		//FCで游書体を使用する場合
		$('body').css({fontWeight:500});

		//spmenu
		var headerObj = $('#wrp_hdr');
		var menuBtn = $('#btn_menu a');
		var spMenu = $('#sp_menu');
		var menuTxtObj = menuBtn.find('.txt');
		var menuTxt = menuTxtObj.text();
		var closeTxt = 'CLOSE';
		$(window).on('load',function(){
			menuBtn.on('click',function(){
				var spMenuInr = spMenu.find('.toggle_menu');
				if(!menuBtn.hasClass('active')){
					menuBtn.addClass('active');
					spMenu.addClass('active').css({
						top: headerObj.outerHeight()
					});
					menuTxtObj.text(closeTxt);
					spMenuInr.css({
						maxHeight: spMenuInr.find('.inr_toggle_menu').outerHeight()
					});
				}else{
					$.when(
						spMenuInr.css({
							maxHeight: 0
						})
					).done(function(){
						menuBtn.removeClass('active');
						spMenu.removeClass('active');
						menuTxtObj.text(menuTxt);
					});
				}
			});
			spMenu.on('click',function(){
				menuBtn.trigger('click');
			});
		});

		//fc only
		var spmenuSub = spMenu.find('ul').find('ul');
		if(spmenuSub.length){
			spmenuSub.each(function(){
				var self = $(this);
				var firstLiA = self.find('li:first-child a').attr('href');
				self.prev().attr('href', firstLiA);
			});
		}

	});

})(jQuery);