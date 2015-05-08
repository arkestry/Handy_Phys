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
    $('#homeLeft').mouseenter(function(){ //Home izquierda
        
        $('#homeLeft').animate({opacity: '1'}, 300);
    });
    $('#homeLeft').mouseleave(function(){
         $('#homeLeft').animate({opacity: '0.5'}, 300);
    }); 
    $('#homeCenter').mouseenter(function(){ //Home centro
        
        $('#homeCenter').animate({opacity: '1'}, 300);
    });
    $('#homeCenter').mouseleave(function(){
         $('#homeCenter').animate({opacity: '0.5'}, 300);
    });
    $('#homeRight').mouseenter(function(){ //Home derecha
        
        $('#homeRight').animate({opacity: '1'}, 300);
    });
    $('#homeRight').mouseleave(function(){
         $('#homeRight').animate({opacity: '0.5'}, 300);
    });
    
    $('.zigma').animate({width: '36px', height: '36px', top: '0.6em', left: '5em'},1500); //zigma animation
    
    function mostrar(menu){
    $(menu).slideToggle(800);
    }
    $('#dropdownMenu1').click(function(){
       $('#filtroArt').fadeToggle(500); 
    });

});

