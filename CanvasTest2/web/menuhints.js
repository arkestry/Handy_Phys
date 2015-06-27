MenuHints={};function menuMouseover(e,span)
{e=RGraph.FixEventObject(e);MenuHints.Show(e,span);}
function menuMouseout(e)
{e=RGraph.FixEventObject(e);MenuHints.Hide();}
MenuHints.Show=function(e)
{var tgt=e.target;var tagName=tgt.tagName.toLowerCase();var id=tgt.innerHTML.replace(/<[^>]+>/g,'').toLowerCase();var height=tgt.offsetHeight;var width=tgt.offsetWidth;var divXY=MenuHints.getXY(tgt);var text=tgt.getAttribute('data-tooltip')
var div=$('<div class="navigationMenuhint">').css({left:0,padding:'9px',backgroundColor:'rgba(0,0,0,1)',color:'white',textAlign:'center',position:'absolute',fontWeight:'bold',fontFamily:'Arial',fontSize:'90%',boxShadow:'0px 0px 3px gray',borderRadius:'2px',zIndex:999}).html(text).appendTo($('body')).get(0);document.body.__menuhint__=div;div.style.width=div.offsetWidth+'px';var img=$('<img>').attr({src:'/images/menu-hover-pointer.png',width:7,height:14}).css({position:'absolute',left:'-7px',top:'0px'}).appendTo(div).get(0);var xy=RGraph.getCanvasXY(tgt);var offset=parseInt(tgt.getAttribute('data-offset'));div.style.left=xy[0]+tgt.offsetWidth+15+'px'
div.style.top=xy[1]+(tgt.offsetHeight/2)-(div.offsetHeight/2)+'px'
img.style.top=(div.offsetHeight/2)-7.5+'px';clearTimeout(MenuHints.hidetimer);if(!MenuHints.div){MenuHints.Fadein(div)}else{MenuHints.div.style.opacity=0;MenuHints.div.style.display='none';MenuHints.div=null;div.style.opacity=1;}
if(div.addEventListener){div.addEventListener('mouseover',function(e)
{clearTimeout(MenuHints.hidetimer);});div.addEventListener('mousemove',function(e)
{clearTimeout(MenuHints.hidetimer);});div.addEventListener('mouseout',function(e)
{setTimeout(function()
{MenuHints.Fadeout();},1000);});document.body.addEventListener('click',function()
{MenuHints.Hide(true);},false);}else if(div.attachEvent){div.attachEvent('onmouseover',function(e){clearTimeout(MenuHints.hidetimer);});div.attachEvent('onmousemove',function(e){clearTimeout(MenuHints.hidetimer);});div.attachEvent('onmouseout',function(e){MenuHints.Fadeout();});}
MenuHints.div=div;}
MenuHints.Hide=function()
{if(arguments[0]===true){$(document.body.__menuhint__).hide();$(document.body.__menuhint__).remove();}else{MenuHints.hidetimer=setTimeout(function()
{MenuHints.Fadeout(MenuHints.div);},arguments[0]||500);}}
MenuHints.Fadein=function(div)
{div.style.opacity=1;MenuHints.fading=false;}
MenuHints.Fadeout=function()
{$(MenuHints.div).fadeOut(150);}
MenuHints.getXY=function(obj)
{var x=0;var y=0;var el=obj;do{x+=el.offsetLeft;y+=el.offsetTop;el=el.offsetParent;}while(el&&el.tagName.toLowerCase()!='body');var paddingLeft=obj.style.paddingLeft?parseInt(obj.style.paddingLeft):0;var paddingTop=obj.style.paddingTop?parseInt(obj.style.paddingTop):0;var borderLeft=obj.style.borderLeftWidth?parseInt(obj.style.borderLeftWidth):0;var borderTop=obj.style.borderTopWidth?parseInt(obj.style.borderTopWidth):0;if(navigator.userAgent.indexOf('Firefox')>0){x+=parseInt(document.body.style.borderLeftWidth)||0;y+=parseInt(document.body.style.borderTopWidth)||0;}
return[x+paddingLeft+borderLeft,y+paddingTop+borderTop];}
window.addEventListener('resize',function(e)
{if(MenuHints.div){$(MenuHints.div).hide();$(MenuHints.div).remove();}},false)
