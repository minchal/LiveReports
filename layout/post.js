
$(function() {
	$('#post-media-add').click(addMediaInput);
	
	$('#post-form').ajaxForm({
		success: function() {
			$('#post-media').html('');
			$('#post-content').val('');
			refreshLive();
		},
		
		error: function(x, e) {
			alert('error ' + x.status + ', ' + e);
		}
	});
});

function addMediaInput() {
	$('#post-media').append(
		'<div class="input-media">'+
		'	<select name="type[]">'+
		'		<option value="img">Obrazek</option>'+
		'		<option value="yt">YouTube</option>'+
		'	</select>'+
		'	<input type="text" name="param[]" />'+
		'</div>'
	);
};
