$(function(){

    $('ul.content').sortable({
	    items:'.film', 
	    handle:'.text', 
	    axis:'x + y', 
	    cursor: 'move', 
	    update: function(){
			$.ajax({
				type: 'post',
				beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: $(this).sortable('serialize'),
				dataType: 'script',
				complete: function(request){
				},
				url: '/films/sort'
			});
	    }

    });


});