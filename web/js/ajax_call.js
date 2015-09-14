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
          $("#repo-title").html(values[1]);
        $("#usr").html(values[0]);
        $("#fecha").html(values[2]);
      })
      .fail(function() {
        console.log("errr:getFeedback");
      })
    });
    /*$('.rep-button').click(function (event){
        alert("click");
    })*/
    $('.rep-button').click(function(event) {
      var id=$(this).attr("id");
      $.ajax({
        url: '../getReporte',
        type: 'GET',
        data: {param1: id}
      })
      .done(function(data) {
        var text=data.split(",");
          $('#repo-title').html(text[2]);
        $('#repo-body').html(text[3]);
        $('#fecha').html(text[4]);
        $('#usr').html(text[5]);
        switch (parseInt(text[1])) {
          case 1:
            $('#bodyrepo').css('background-color', '#90CAF9');
            break;
            case 2:
              $('#bodyrepo').css('background-color', '#FFF59D');
              break;
              case 3:
                $('#bodyrepo').css('background-color', '#FFAB91');
                break;
          default:

        }
      })
      .fail(function() {
        console.log("err:getReport");
      })


    });
});
