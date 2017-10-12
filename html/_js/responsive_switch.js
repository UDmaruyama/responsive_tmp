//PCのとき
function switch_pc() {
	//テーブル見出し横並び
	var responsiveTbl = $('#maincontent').find('.head_horizon');
	if(responsiveTbl.length){
		responsiveTbl.each(function(){
			var self = $(this);
			if(!self.find('th').length){
				self.find('td').css({
					'border-top':'none'
				});
			}
		});
	}
	if($('#headHorizonStyle').length){
		$('#headHorizonStyle').remove();
	}
}

//SPのとき
function switch_sp() {
	//テーブル見出し横並び
	var responsiveTbl = $('#maincontent').find('.head_horizon');
	if(responsiveTbl.length){
		var headHorizonStyle = '<style type="text/css" id="headHorizonStyle">';
		responsiveTbl.each(function(j){
			var self = $(this);
			var headHorizon = self.find('tr.head');
			var headData = [];
			var countCell = 0;
			if(self.find('th').length){
				headHorizon.find('th').each(function(){
					var thisData = $.trim($(this).text());
					headData.push(thisData);
					countCell++;
				});
				self.find('tr').each(function(){
					var self = $(this);
					var headHorizon = self.hasClass('head');
					if(!headHorizon){
						$.each(headData,function(i){
							if(countCell > i){
								var thisCell = self.children().eq(i);
								thisCell.attr('data-head',this);
								i++;
							}
						});
					}
				});
			}else{
				self.closest('table').addClass('j' + j);
				var tblColor = self.css('background-color');
				headHorizon.find('td').each(function(){
					var thisData = $.trim($(this).text());
					headData.push(thisData);
					countCell++;
				});
				var fontColor = headHorizon.find('td:first-of-type').find('span').css('color');
				if(fontColor){
					headHorizonStyle += '#maincontent .head_horizon.j' + j + ' td.head::before{color: '+ fontColor +';}';
				}
				self.find('tr').each(function(){
					var self = $(this);
					var headHorizon = self.hasClass('head');
					if(!headHorizon){
						$.each(headData,function(i){
							if(countCell > i){
								var thisCell = self.find('td').eq(i);
								thisCell.attr('data-head',this);
								if(tblColor!='transparent'&&i!=0){
									thisCell.css({
										'border-top-width':'1px',
										'border-top-style':'solid',
										'border-top-color':tblColor
									});
								}
								i++;
							}
						});
					}
				});
			}
			j++;
		});
		headHorizonStyle += '</style>';
		$('head').append(headHorizonStyle);
	}
}