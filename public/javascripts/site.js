// add Accept:text/javascript header to jQuery ajax requests
// $.ajaxSetup({'beforeSend':function(xhr){xhr.setRequestHeader("Accept","text/javascript")}})

$(document).ready(function(){
  
  $('select.trigger, input.trigger')
    .livequery('change', function(){ 
      var $form = $('#info form');
      var url = $form.attr('action') + '.js'
      $form.ajaxSubmit({ 
        url:    url,
        target: '#info'
      });
    });
  $('#info form').livequery('submit',function() {
    var url = $(this).attr('action') + '.js';
    $(this).ajaxSubmit({ 
      url:    url,
      target: '#info'
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
  
  $('a.editLink').click(function(){
    var parent = $(this).parents('div:first');
    parent.find('div.edit').toggle();
  });
  
  $('ul a')
    .css({opacity:0.5})
    .hover(
      function(){
       $(this).fadeTo('fast', 1.0);
      },
      function(){
       $(this).fadeTo('slow', 0.5);
      }
    );
  
});

function response(responseText){
  alert(responseText)
}

