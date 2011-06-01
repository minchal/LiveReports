
var counterStart = 60;
var counter = counterStart;
var reportId;
var chatFrom;

$(function() {
	reportId = $('#live-refresh').data('id');
	chatFrom = $('.chat-item').last().data('id');
	
	if (!chatFrom) chatFrom = 0;
	
	$('#live-refresh').click(function(){
		refreshLive();
	});
	
	if ($('#live-refresh').length) {
		setInterval(function() {
			if (counter > 0) {
				$('#live-time').text(counter + 'sek.');
				counter--;
			} else {
				refreshLive();
			}
		}, 1000);
		
		setInterval(refreshChat, 5000);
	}
	
	// post
	$('#post-media-add').click(addMediaInput);
	
	$('#post-form').ajaxForm({
		success: function() {
			$('#post-media').html('');
			$('#post-content').val('');
			refreshLive();
		},
		error: errorAlert
	});
	
	// chat
	$('#chat-form').ajaxForm({
		beforeSerialize: function() {
			if ($('#chat-content').val() == '') {
				alert('Podaj treść!');
				return false;
			}
		},
		success: function() {
			$('#chat-content').val('');
			refreshChat();
		},
		error: errorAlert
	});
	
	$('#chat').scrollTop($('#chat .chat-item').last().position().top);
});

function refreshLive() {
	counter = counterStart;
	
	var from = $('.item').first().data('time');
	
	$.ajax({
		url: "/entry/"+reportId+"/" + from + ".xml",
		error: errorAlert,
		success: function(responseXML){
			$('entry', responseXML).each(parseEntry);
		}
	});
};

function parseEntry() {
	var entry = {
		id:      $('id', this).text(),
		content: $('content', this).text(),
		date:    new Date($('date', this).text()),
	};
	
	$.ajax({
		url: "/medium/"+entry.id+".xml",
		error: errorAlert,
		success: function(responseXML) {
			var html = '<div class="item" data-time="' + Math.round(entry.date.getTime()/1000) + '">';
			html += '<p>' + entry.content + '</p>';
			
			if ($('medium', responseXML).length > 0) {
				html += '<ul class="item-media">';
				
				$('medium', responseXML).each(function() {
					var type = parseInt($('mtype', this).text());
					var data = $('data', this).text();
					
					switch (type) {
						case 1:
							html += '<li><a href="'+data+'"><img src="'+data+'" width="150px" /></a></li>';
							break;
						case 2:
							html += '<li><a href="http://www.youtube.com/watch?v='+data+'"><img src="http://i3.ytimg.com/vi/'+data+'/default.jpg" /></a></li>';
					}
				});
				
				html += '</ul>';
			}
			
			html += '<p class="item-time">' + dateFormat(entry.date) + '</p>';
			html += '</div>';
			
			var first = $('.item').first();
			var itemHtml = $(html);
			
			if (first.length > 0) {
				first.before(itemHtml);
			} else {
				$('#content').append(itemHtml);
			}
			
			itemHtml.hide().slideDown();
		}
	});
}

var mediumNum = 0;

function addMediaInput() {
	$('#post-media').append(
		'<div class="input-media">'+
		'	<select name="medium['+mediumNum+'][type]">'+
		'		<option value="1">Obrazek</option>'+
		'		<option value="2">YouTube</option>'+
		'	</select>'+
		'	<input type="text" name="medium['+mediumNum+'][data]" />'+
		'</div>'
	);
	
	mediumNum++;
};

function refreshChat() {
	$.ajax({
		url: "/chat/"+reportId+"/" + chatFrom + ".xml",
		error: errorAlert,
		success: function(responseXML){
			$('entry', responseXML).each(function() {
				var html = '<div class="chat-item">';
				html += '<span class="chat-user">'+$('user email', this).text()+'</span>: ';
				html += $('content', this).text();
				html += '</div>';
				
				$('#chat').append(html);
				
				var to = $('.chat-item').last().position().top;
				$('#chat').animate({scrollTop: to}, 300);
				
				chatFrom = $('id', this).text();
			});
		}
	});
};

function errorAlert(x,e) {
	alert(x.status+","+e);
}

// %H:%M %Z (%d.%m.%Y)
function dateFormat(d) {
	return zeroPad(d.getHours()) + ':' + zeroPad(d.getMinutes()) + ' ('+zeroPad(d.getDate())+'.'+zeroPad(d.getMonth())+'.'+d.getFullYear()+')';
}

function zeroPad(int) {
	return int < 10 ? '0'+int : int;
}
