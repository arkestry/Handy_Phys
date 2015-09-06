$(document).ready(function(){
    $('button').click(function(event) {
       var id=$(this).attr('value');
        $.ajax({
        url: '../getFeedback',
        type: 'GET',
        data: {param1: id}
      })
      .done(function(data) {
        console.log("success");
        alert(data);
      })
      .fail(function() {
        console.log("error");
      })
        
    });
});

