/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('#muestrame').click(function(){
        $('nav').toggleClass('mostrar');
    });
    $('nav').mouseleave(function(){
        $('nav').toggleClass('mostrar');
    });
    $('.mostrarLink').click(function(){
        $('.mostrarSeccion').slideToggle(300);
    });
    $('#btnAdd').click(function(){ //Blacklist
       $('#formuAdd').fadeToggle(300);
    }); //finblacklist

    $('.log').click(function(){
       $('.keys').slideToggle('fast');
    });
    $('#btnPaSubir').click(function(){
        $('#subirExamen').slideToggle(500);
    });
    $('#dropdownMenu1').click(function(){
       $('#filtroArt').fadeToggle(500);
    });
    $('#menuNo').click(function(){
       $('.cajaNo').fadeIn(500);
    });
    $('#menuNo').mouseleave(function(){
       $('.cajaNo').fadeOut(500);
    });
    //valoraciones
    $('span[name = s1]').hover(function(){
        $(this).closest('#s1').toggleClass("glyphicon-star-empty glyphicon-star");
        $(this).closest('#s1').click(function(){
            $('input[name = valor]').attr('value', '1');
            $(this).closest('form').submit();
       });
    });
    $('span[name = s2]').hover(function(){
       $(this).closest('#s2').toggleClass("glyphicon-star-empty glyphicon-star");
        $(this).closest('#s2').click(function(){
            $('input[name = valor]').attr('value', '2');
            $(this).closest('form').submit();
       });
    });
    $('span[name = s3]').hover(function(){
       $(this).closest('#s3').toggleClass("glyphicon-star-empty glyphicon-star");
        $(this).closest('#s3').click(function(){
            $('input[name = valor]').attr('value', '3');
            $(this).closest('form').submit();
       });
    });
    $('span[name = s4]').hover(function(){
       $(this).closest('#s4').toggleClass("glyphicon-star-empty glyphicon-star");
        $(this).closest('#s4').click(function(){
            $('input[name = valor]').attr('value', '4');
            $(this).closest('form').submit();
       });
    });
    $('span[name = s5]').hover(function(){
       $(this).closest('#s5').toggleClass("glyphicon-star-empty glyphicon-star");
        $(this).closest('#s5').click(function(){
            $('input[name = valor]').attr('value', '5');
            $(this).closest('form').submit();
       });
    });
    /*$('.rp-gravedad-alta').click(function(event) {
      $('#bodyrepo').css('background-color', 'value');
    });*/
    });
  //fin valoraciones

  function mostrar(menu){
    $(menu).slideToggle(800);
    }
var entero = 1  ;
function cantidad(){ //Crear simulador de examen
    entero++;
    var modelo = " <section class='col-md-12 container'><hr>  <h2>Pregunta "+entero+"</h2><section class='col-md-4'><label><h3>Pregunta:</h3><textarea style='color: #141414' name='pregunta"+entero+"' class='areaTexto' rows='5' placeholder='Empezar a escribir...'></textarea></label></section><section class='col-md-4'> <h3><label>Respuestas: </label></h3><label>A) <input style='color: #141414' name='respuesta"+entero+".a' type='text' size='20'></label><label>B) <input style='color: #141414' name='respuesta"+entero+".b' type='text' size='20'></label><br><br><label>C) <input style='color: #141414' name='respuesta"+entero+".c' type='text' size='20'></label> <label>D) <input style='color: #141414' name='respuesta"+entero+".d' type='text' size='20'></label><br><br></section><section class='col-md-4'><h3><label>La respuesta correcta es: </label></h3><select class='form-control-static' name='correcta"+entero+"' style='color: #141414; position: relative; top: -3.2em; left: 20em'><option value='a'>A)</option><option value='b'>B)</option><option value='c'>C)</option><option value='d'>D)</option></select></section><br><hr></section> <section id='sig'></section>";
   $('#sig').html(modelo);
   $('#sig').attr('id', 'p'+entero);
   }
//fin simulador
