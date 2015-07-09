/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
  

   $('#summernote').summernote({
       minHeight: null,
       minWidth: null,
       focus: true,
       fontNames:['Arial','Courier', 'Times', 'Roboto Condensed', 'Verdana', 'Serif'],
       toolbar:[
           ['Style', [ 'bold', 'italic', 'underline', 'fontsize', 'clear' ]],
           ['Font', ['fontname' ,'superscript', 'color', 'subscript']],
           ['Parrafo', ['ul', 'ol', 'paragraph']],
           ['Insertar', ['picture', 'link', 'table', 'hr']],
           ['Otros', ['undo', 'redo', 'help']]
       ]
   }); 
});