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

  $("input#film_title").bind("keypress", function(e) {
    var text = $(this).val();
    var keycode = (e.keyCode || e.which);
      if (keycode == 13) {
        if (text.length == 0) {
            return false;
        }
      }
    });

    $("form.edit_film").bind("keypress", function(e) {
      if (e.keyCode == 13) return false;
    });

    $('input#film_title').on('keyup', function(e){

    var text = $(this).val();

    if (text.length == 0) {
      $('input.submit').removeClass('save');
      $('div.alert.title').addClass('show');
    } else {
      $('div.alert.title').removeClass('show');
      $('input.submit').addClass('save');
    }
  });

  $('select').on('change', function() {
    var text = $('input#film_title').val();

    if (text.length > 0) {
      $('input.submit').addClass('save');

      var empty = false;
      $('select').each(function() {
        if ($(this).val() == '') {
          empty = true;
        }
      });

      if (empty) {
        $('div.alert.date').addClass('show');
      } else {
        $('div.alert.date').removeClass('show');
      }

    } else {
      var empty = false;
      $('select').each(function() {
        if ($(this).val() == '') {
          empty = true;
        }
      });

      if (empty) {
        $('div.alert.date').addClass('show');
      } else {
        $('div.alert.date').removeClass('show');
      }
    }
  });

  $('input.submit').click(function() {
    $(this).parents('form').submit();
  });

  $('a.logout').click(function(){

    $('ul.confirm').addClass('show');
    $('a.logout').hide();

    $('a.no').click(function(){
      $('ul.confirm').removeClass('show');
      $('a.logout').show();
    });

  });

  $('a.delete').click(function(){

    $('ul.confirm').addClass('show');
    $('a.delete').hide();

    $('a.no').click(function(){
      $('ul.confirm').removeClass('show');
      $('a.delete').show();
    });

  });

  var csrfToken = $('meta[name="csrf-token"]').attr('content');

  $('ul.content').sortable({
    items:'.film',
    handle:'.text',
    axis:'x + y',
    cursor: 'move',
    update: function(){
      $.ajax({
        type: 'post',
        beforeSend: function(xhr) {
          xhr.setRequestHeader('X-CSRF-Token', csrfToken)
        },
        data: $(this).sortable('serialize'),
        dataType: 'script',
        url: '/films/sort'
      });
    }
  });

});
