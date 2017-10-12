(function($){
	
	$(function(){

		//ブレイクポイントが変わったときに処理を実行する
		$('#wrp').after('<div id="bpt"></div>');
		var breakPointTrigger = $('#bpt');
		
		function getMediaMode(){
			if(breakPointTrigger.is(':visible')){
				return 'moblie';
			}else{
				return 'pc';
			}
		}

		var currentMediaMode, previousMediaMode;
		var timer = false;
		
		$(window)
			.on('resize.mediaMode',function(){
				if (timer !== false) {
					clearTimeout(timer);
				}
				timer = setTimeout(function() {
					currentMediaMode = getMediaMode();
					if(currentMediaMode !== previousMediaMode){
						$(window).trigger('mediaModeChange', currentMediaMode);
						previousMediaMode = currentMediaMode;
					}
				}, 200);
			})
			.on('mediaModeChange', function(e, mediaMode){
				//PCのとき
				if(mediaMode == 'pc'){
					switch_pc();
				}
				//SPのとき
				if(mediaMode == 'moblie'){
					switch_sp();
				}
			})
			.trigger('resize.mediaMode');

	});

})(jQuery);