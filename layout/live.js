
var counterStart = 20;
var counter = counterStart;

$(function() {
	$('#live-refresh').click(function(){
		refreshLive();
	});
	
	setInterval(function() {
		if (counter > 0) {
			$('#live-time').text(counter + 'sek.');
			counter--;
		} else {
			refreshLive();
		}
	}, 1000);
});

function refreshLive() {
	counter = counterStart;
	
	var from = $('.item').first().data('time');
	
	$.ajax({
		url: "" + from,
		success: function(){
			//var html = '<div class="item">'+item+'</div>';
			//$('.item').first().before(html);
		}
	});
};
