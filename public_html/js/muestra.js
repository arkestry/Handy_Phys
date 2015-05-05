/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('#muestrame').click(function(){
        $('nav').toggleClass('mostrar'); 
    });
    $('.mostrarLink').click(function(){
        $('.mostrarSeccion').slideToggle(1000);
    });
});

function mostrar(menu){
    if(menu.style.display === "none"){
        menu.style.display = "inline";
    }else{
        menu.style.display = "none";
    }
    
}
