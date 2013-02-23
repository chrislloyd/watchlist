$(function(){

	$('a.new').click(function(){
    
    	$('body').addClass('modal');
    	document.getElementById("film_title").focus();

    });

    $('div.overlay').click(function(){
    
    	$('body').removeClass('modal');
    
    });

	$('div.status').click(function(){
    
    	$(this).toggleClass('watched');
    
    });

 	$("form.edit_film").bind("keypress", function(e) {
            if (e.keyCode == 13) return false;
    });

    $('input#film_title').on('keyup', function(e){
			
		var text = $(this).val();

	    if (text.length == 0) {
	        $('input.submit').removeClass('save');
	    } else {
	        $('input.submit').addClass('save');
	    }

	});

	$('select').on('change', function() {

        $('input.submit').addClass('save');



        var empty = false;
        $('select').each(function() {
            if ($(this).val() == '') {
                empty = true;
            }
        });

        if (empty) {
            $('div.alert').addClass('show');
        } else {
            $('div.alert').removeClass('show');
        }


	});

	$('input.submit').click(function() {
	        
	    $(this).parents('form').submit();
	
	});

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