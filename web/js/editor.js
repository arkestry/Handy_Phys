/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
  

   $('#summernote').summernote({
        minHeight: null,
        minWidth: null,
        focus: false,
        color: 'black',
        fontcolor: 'black',
        fontNames:['Arial','Courier', 'Times', 'Roboto Condensed', 'Verdana', 'Serif'],
        toolbar:[
            ['Style', [ 'bold', 'italic', 'underline', 'fontsize', 'strikethrough', 'clear' ]],
            ['Color', [ 'color']],
            ['Font', ['fontname' ,'superscript', 'subscript']],
            ['Parrafo', ['ul', 'ol', 'paragraph']],
            ['Insertar', ['picture', 'link', 'table', 'hr']],
            ['Otros', ['undo', 'redo', 'help']]
        ],
        onImageUpload: function(files) {
                sendFile(files[0]);
            }
        });
        function sendFile(file) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "../servlets/summernote",
                cache: false,
                contentType: false,
                processData: false,
                success: function(url) {
                     $('#summernote').summernote('insertImage', url);
                }
            });
        }
});