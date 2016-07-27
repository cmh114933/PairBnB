$(document).ready(function(){
	
	$('#tag_tag').on("input",function(event){
		var input = $(this).serialize();

		console.log("ds");
		$.ajax({
			type: 'POST',
			url: '/fetch_tags',
			data: input,
			success: function(data){
			}
		})
	});

	$($('#search #new_listing #listing_locations')).on("input",function(event){
		var input = $(this).serialize();

		console.log("ds");
		$.ajax({
			type: 'POST',
			url: '/like_results',
			data: input,
			success: function(data){
			}
		})
	});

	$('#advance').click(function(){
		$('#search').toggle()
	})
})
