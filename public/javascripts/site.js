// add Accept:text/javascript header to jQuery ajax requests
// $.ajaxSetup({'beforeSend':function(xhr){xhr.setRequestHeader("Accept","text/javascript")}})

$(document).ready(function(){
  
  // Basically all this makes the form auto update itself, so that all the various changes are immediately visible
  $('#info form .trigger')
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
    confirm('Are you sure you want to remove this?');
    $.post(deleteUrl,{ _method: "DELETE" });
    $(this).parents('tr').hide();
    return false;
  });
  
  $('a.editLink').click(function(){
    var parent = $(this).parents('div:first');
    parent.find('div.edit').toggle();
  });
  
  // Fancy effects for the thumbnails
  $('ul a')
    .css({opacity:0.5})
    .hover(
      function(){
       $(this).stop().fadeTo('fast', 1.0);
      },
      function(){
       $(this).stop().fadeTo('slow', 0.5);
      }
    );  
  
  // Just calls the progress bar function when the page is loaded 
  // progressBar();
  $('input#start').click(function(){   
    progressBar();    
    return false;   
  });

});

function response(responseText){
  alert(responseText)
}     

// The progress bar for the uploads  
function progressBar(){
  var size = $('span#size').text();  
  var $uploadForm = $('form'); 
  url = $uploadForm.attr('action') + '.js';  
  // alert(url)
  if(size && size >= 0){      
    $uploadForm.ajaxSubmit({ 
      url:    url,
      target: '#count'
    });  
  }else{
    // Redirects the page when the upload has finished 
    window.location = "/uploads"
  }
}

