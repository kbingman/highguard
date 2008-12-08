// add Accept:text/javascript header to jQuery ajax requests
$.ajaxSetup({'beforeSend':function(xhr){xhr.setRequestHeader("Accept","text/javascript")}})

$(document).ready(function(){
  // var $form = $('#ship form');

  // $('#ship form input.submit').ajaxSubmit();
  
  $('#ship select, #ship input')
    .livequery('change', function(){ 
      var $form = $('#ship form');
      var url = $form.attr('action') + '.js'
      $form.ajaxSubmit({ 
        url:    url,
        target: '#target'
      });
    });
  $('#ship form').livequery('submit',function() {
    var url = $(this).attr('action') + '.js'
    $(this).ajaxSubmit({ 
      url:    url,
      target: '#target'
    });
    return false;
  });
  //$('#ship form input.submit').ajaxSubmit();
  
});

function response(responseText){
  alert(responseText)
}

