<%-- 
    Document   : index
    Created on : 10/06/2015, 10:24:11 AM
    Author     : S-S
--%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            canvas
            {
                border: 1px solid gray;
            }
        </style>
        <link rel="stylesheet" href="styles.css" type="text/css" media="screen">
        <script src="jquery.min.js"></script>
        <script src="menuhints.js" defer=""></script>
        <script src="RGraph.common.core.js"></script>
    </head>
    <body onload = "appendSubmitButton()">
        <%
            out.println("ASDF: " + request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath());
        %>
        <br>
        <h5>Click to select which image to move.<br>
            Then move the mouse to desired drop location<br>
            and click again to drop the image there.</h5>
        <img src ="./354-rally-driver2.jpg">
        <button id="more">Add Image</button>
        <button id="save">Save Image</button>
        <button id="showStates">Show States</button>
        <button id="clear">Clear All</button>
        <br>
        <canvas height="800" width="1000" id="cvs1">[No canvas support]</canvas>
        <form action ="ReceiveImageData" id ="coordinates" method = "POST" onSubmit="writeCoordinates()">
            <br>
            <!-- <canvas height="800" width="1000" id="cvs2">[No canvas support]</canvas> -->
            <script>
                var canvas1 = document.getElementById("cvs1");
                //var canvas2 = document.getElementById("cvs2");

                var contexts = [];
                contexts.push(canvas1.getContext('2d'));

                //contexts.push(canvas2.getContext('2d'));

                function writeCoordinates() {

                    //Get form containing coordinates
                    var coord = document.getElementById("coordinates");

                    //Clear form
                    while (coord.hasChildNodes()) {
                        coord.removeChild(coord.firstChild);
                    }

                    //Add all coordinates from states to form as hidden inputs
                    for (var i = 0; i < states.length; i++) {
                        //alert("State: " + i + "(" + states[i].x + "," + states[i].y + ")");
                        var node = document.createElement("input");
                        //node.setAttribute("type", "hidden");
                        node.setAttribute("value", states[i].x + "," + states[i].y + ".");
                        node.setAttribute("name", "c");
                        document.getElementById("coordinates").appendChild(node); // add to end of your document                    
                    }

                    var btn = document.createElement("BUTTON");        // Create a <button> element
                    var t = document.createTextNode("enviar");       // Create a text node
                    btn.appendChild(t);                                // Append the text to <button>
                    btn.setAttribute("type", "submit");
                    document.getElementById("coordinates").appendChild(btn);
                }

                function appendSubmitButton() {
                    var btn = document.createElement("BUTTON");        // Create a <button> element
                    var t = document.createTextNode("enviar");       // Create a text node
                    btn.appendChild(t);
                    btn.setAttribute("type", "submit");
                    document.getElementById("coordinates").appendChild(btn);
                }
                function clearCanvas() {
                    clearAll();
                    states = [];
                }
                function clearAll() {
                    //Clear both canvas first
                    canvas1.width = canvas1.width

                    //canvas2.width = canvas2.width
                }

                canvas1.onclick = function(e) {
                    handleClick(e, 1);
                };
                /*
                 canvas2.onclick = function(e) {
                 handleClick(e, 2);
                 };*/
                // 
                function handleClick(e, contextIndex) {
                    e.stopPropagation();

                    var mouseX = parseInt(e.clientX - e.target.offsetLeft);
                    var mouseY = parseInt(e.clientY - e.target.offsetTop);

                    clearAll();

                    for (var i = 0; i < states.length; i++) {

                        var state = states[i];

                        if (state.dragging) {
                            state.dragging = false;
                            state.draw();
                            continue;
                        }

                        if (state.contextIndex == contextIndex && mouseX > state.x && mouseX < state.x + state.width && mouseY > state.y && mouseY < state.y + state.height) {
                            state.dragging = true;
                            state.offsetX = mouseX - state.x;
                            state.offsetY = mouseY - state.y;
                            state.contextIndex = contextIndex;
                        }

                        state.draw();

                    }
                }

                canvas1.onmousemove = function(e) {
                    handleMousemove(e, 1);
                }
                /*
                 canvas2.onmousemove = function(e) {
                 handleMousemove(e, 2);
                 }*/
                //
                function handleMousemove(e, contextIndex) {
                    e.stopPropagation();

                    var mouseX = parseInt(e.clientX - e.target.offsetLeft);
                    var mouseY = parseInt(e.clientY - e.target.offsetTop);

                    clearAll();

                    for (var i = 0; i < states.length; i++) {

                        var state = states[i];

                        if (state.dragging) {
                            state.x = mouseX - state.offsetX;
                            state.y = mouseY - state.offsetY;
                            state.contextIndex = contextIndex;
                        }
                        state.draw();
                    }
                }

                var states = [];

                var img = new Image();
                /*
                img.onload = function() {
                    states.push(addState(0, 0, img));
                    var n = document.createElement("input");
                    //n.value = 0 + "," + 0 + ".";
                    //node.setAttribute("type", "hidden");
                    n.setAttribute("value", "" + 0 + "," + 0 + ".");
                    n.setAttribute("name", "c");
                    n.setAttribute("type", "hidden");
                    document.getElementById("coordinates").appendChild(n);



                }
                */
                img.src = "./354-rally-driver2.jpg";

                function addState(x, y, image) {
                    state = {}
                    state.dragging = false;
                    state.contextIndex = 1;
                    state.image = image;
                    state.x = x;
                    state.y = y;
                    state.width = image.width;
                    state.height = image.height;
                    state.offsetX = 0;
                    state.offsetY = 0;
                    state.draw = function() {
                        var context = contexts[this.contextIndex - 1];
                        if (this.dragging) {
                            context.strokeStyle = 'red';
                            context.strokeRect(this.x, this.y, this.width + 5, this.height + 5)
                        }
                        context.drawImage(this.image, this.x, this.y);
                    }
                    state.draw();
                    return (state);
                }

                $("#more").click(function() {
                    states.push(addState(Math.floor((Math.random() * 250) + 1) + Math.floor((Math.random() * 10) + 1), 10, img));
                });
                $("#clear").click(function() {
                    clearCanvas();
                });


                $("#showStates").click(function() {

                    //Get form containing coordinates
                    var coord = document.getElementById("coordinates");

                    //Clear form
                    while (coord.hasChildNodes()) {
                        coord.removeChild(coord.firstChild);
                    }

                    //Add all coordinates from states to form as hidden inputs
                    for (var i = 0; i < states.length; i++) {
                        alert("State: " + i + "(" + states[i].x + "," + states[i].y + ")");
                        var node = document.createElement("input");
                        //node.setAttribute("type", "hidden");
                        node.setAttribute("value", states[i].x + "," + states[i].y + ".");
                        node.setAttribute("name", "c");
                        document.getElementById("coordinates").appendChild(node); // add to end of your document                    
                    }

                    var btn = document.createElement("BUTTON");        // Create a <button> element
                    var t = document.createTextNode("enviar");       // Create a text node
                    btn.appendChild(t);                                // Append the text to <button>
                    btn.setAttribute("type", "submit");
                    document.getElementById("coordinates").appendChild(btn);
                });


                <%
                    if (request.getSession().getAttribute("coordinates") != null) {
                        System.out.println("params received");
                        LinkedList<String> coordinates = (LinkedList<String>) request.getSession().getAttribute("coordinates");

                        for (String pair : coordinates) {

                            String[] position = pair.split(Pattern.quote(","));
                            out.println("states.push(addState("
                                    + position[0]
                                    + ","
                                    + position[1]
                                    + ", img));");
                        }
                    } else {
                        System.out.println("params not received");
                    }

                %>
            </script>         


        </form>

    </body>

</html>