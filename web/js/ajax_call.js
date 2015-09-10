$(document).ready(function(){
    $('button').click(function(event) {
       var id=$(this).attr('value');
        $.ajax({
        url: '../getFeedback',
        type: 'GET',
        data: {param1: id}
      })
      .done(function(data) {
        var values=data.split(",");
        $("#fdb-text").html(values[1]);
        $("#usr").html(values[0]);
        $("#fecha").html(values[2]);
      })
      .fail(function() {
        console.log("error");
      })
        
    });
});

