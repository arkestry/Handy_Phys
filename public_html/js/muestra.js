/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#muestrame').on('click',function(){
        $('nav').toggleClass('mostrar');
});
function mostrar(menu){
    if(menu.style.display === "none"){
        menu.style.display = "inline";
    }else{
        menu.style.display = "none";
    }
    
}
