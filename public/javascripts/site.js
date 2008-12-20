// add Accept:text/javascript header to jQuery ajax requests
// $.ajaxSetup({'beforeSend':function(xhr){xhr.setRequestHeader("Accept","text/javascript")}})

$(document).ready(function(){
  
  $('#ship select.trigger, #ship input.trigger')
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
  
  $('a.delete').livequery('click',function(){
    var url = $(this).attr('href').split('/');
    var deleteUrl = '/' + url[1] + '/' + url[2];
    alert('are you sure you want to remove this?')
    $.post(deleteUrl,{ _method: "DELETE" });
    $(this).parents('tr').hide();
    return false;
  });
  
});

function response(responseText){
  alert(responseText)
}

