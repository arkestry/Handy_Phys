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
        $('.mostrarSeccion').slideToggle(1000);
    });
    $('#btnAdd').click(function(){ //Blacklist
       $('#formuAdd').fadeToggle(300); 
    }); //finblacklist
    $('.zigma').animate({width: '36px', height: '36px', top: '0.5em', left: '2em'},1000); //zigma animation
    $('.log').click(function(){
       $('.keys').slideToggle('fast'); 
    });
    $('#btnPaSubir').click(function(){
        $('#subirExamen').slideToggle(500);
    });
    $('#dropdownMenu1').click(function(){
       $('#filtroArt').fadeToggle(500); 
    });
    $('#menuNo').hover(function(){
       $('.cajaNo').fadeToggle(500);
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
  
    
           
});


  function mostrar(menu){
    $(menu).slideToggle(800);
    }
var entero = 2  ;
function cantidad(){
    
    var todo = document.getElementById("todo");
    var modelo = "<section> <br><hr><section><label>Titulo del reactivo: </label><input type='text' size='35' name='titPregunta"+entero+"'> </section><section><label>Cuerpo:</label><br><textarea name='cuerPregunta"+entero+"' class='areaTexto' rows='5' placeholder='Escriba aquí'></textarea></section><section><label>Respuestas: </label><br><input type='radio' name='respPregunta"+entero+"'> a) <input type='text' size='20'><input type='radio' name='respPregunta"+entero+"'> b) <input type='text' size='20'><br><br><input type='radio' name='respPregunta"+entero+"'> c) <input type='text' size='20'><input type='radio' name='respPregunta"+entero+"'> d) <input type='text' size='20'><br><br></section><section><label>La respuesta correcta: </label><select name='correcta' style='color: #141414'><option>a</option><option>b</option><option>c</option><option>d</option></select></section><br><hr></section>";
    todo.innerHTML += modelo;
    entero++;
}