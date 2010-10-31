//<![CDATA[

if (document.images) {
    var codeduc_on = new Image(); codeduc_on.src = "images/banner/codeduc_on.gif";
    var codeduc_off = new Image(); codeduc_off.src = "images/banner/codeduc_off.gif";

    var logosimce_on = new Image(); logosimce_on.src = "images/banner/logosimce_on.gif";
    var logosimce_off = new Image(); logosimce_off.src = "images/banner/logosimce_off.gif";

    var logo_mineduc_on = new Image(); logo_mineduc_on.src = "images/banner/logo_mineduc_on.gif";
    var logo_mineduc_off = new Image(); logo_mineduc_off.src = "images/banner/logo_mineduc_off.gif";

    var logo_asocmuni_on = new Image(); logo_asocmuni_on.src = "images/banner/logo_asocmuni_on.gif";
    var logo_asocmuni_off = new Image(); logo_asocmuni_off.src = "images/banner/logo_asocmuni_off.gif";

    var muni_on = new Image(); muni_on.src = "images/banner/muni_on.gif";
    var muni_off = new Image(); muni_off.src = "images/banner/muni_off.gif";

    var boton_mas_on = new Image(); boton_mas_on.src = "images/botones/b_mas_on.gif";
    var boton_mas_off = new Image(); boton_mas_off.src = "images/botones/b_mas_off.gif";

    var boton_menos_on = new Image(); boton_menos_on.src = "images/botones/b_menos_on.gif";
    var boton_menos_off = new Image(); boton_menos_off.src = "images/botones/b_menos_off.gif";

    var boton_editar_on = new Image(); boton_editar_on.src = "images/botones/b_editar_on.gif";
    var boton_editar_off = new Image(); boton_editar_off.src = "images/botones/b_editar_off.gif";

    var boton_enviar_on = new Image(); boton_enviar_on.src = "images/botones/b_enviar_on.gif";
    var boton_enviar_off = new Image(); boton_enviar_off.src = "images/botones/b_enviar_off.gif";

    var boton_cancelar_on = new Image(); boton_cancelar_on.src = "images/botones/b_cancelar_on.gif";
    var boton_cancelar_off = new Image(); boton_cancelar_off.src = "images/botones/b_cancelar_off.gif";

    var boton_cerrar_on = new Image(); boton_cerrar_on.src = "images/botones/b_cerrar_on.gif";
    var boton_cerrar_off = new Image(); boton_cerrar_off.src = "images/botones/b_cerrar_off.gif";

    var boton_recargar_on = new Image(); boton_recargar_on.src = "images/botones/b_recargar_on.gif";
    var boton_recargar_off = new Image(); boton_recargar_off.src = "images/botones/b_recargar_off.gif";
}

function handleOverBotonMas() {
    if (document.images) document.imgBotonMas.src = boton_mas_on.src;
}

function handleOutBotonMas() {
    if (document.images) document.imgBotonMas.src = boton_mas_off.src;
}

function handleOverBotonMenos() {
    if (document.images) document.imgBotonMenos.src = boton_menos_on.src;
}

function handleOutBotonMenos() {
    if (document.images) document.imgBotonMenos.src = boton_menos_off.src;
}

function handleOverBotonEditar() {
    if (document.images) document.imgBotonEditar.src = boton_editar_on.src;
}

function handleOutBotonEditar() {
    if (document.images) document.imgBotonEditar.src = boton_editar_off.src;
}

function handleOverBotonEnviar() {
    if (document.images) document.imgBotonEnviar.src = boton_enviar_on.src;
}

function handleOutBotonEnviar() {
    if (document.images) document.imgBotonEnviar.src = boton_enviar_off.src;
}

function handleOverBotonCancelar() {
    if (document.images) document.imgBotonCancelar.src = boton_cancelar_on.src;
}

function handleOutBotonCancelar() {
    if (document.images) document.imgBotonCancelar.src = boton_cancelar_off.src;
}

function handleOverBotonCerrar() {
    if (document.images) document.imgBotonCerrar.src = boton_cerrar_on.src;
}

function handleOutBotonCerrar() {
    if (document.images) document.imgBotonCerrar.src = boton_cerrar_off.src;
}

function handleOverBotonRecargar() {
    if (document.images) document.imgBotonRecargar.src = boton_recargar_on.src;
}

function handleOutBotonRecargar() {
    if (document.images) document.imgBotonRecargar.src = boton_recargar_off.src;
}

function handleOverCodeduc() {
    if (document.images) document.imgCodeduc.src = codeduc_on.src;
}

function handleOutCodeduc() {
    if (document.images) document.imgCodeduc.src = codeduc_off.src;
}

function handleOverSimce() {
    if (document.images) document.imgSimce.src = logosimce_on.src;
}

function handleOutSimce() {
    if (document.images) document.imgSimce.src = logosimce_off.src;
}

function handleOverMineduc() {
    if (document.images) document.imgMineduc.src = logo_mineduc_on.src;
}

function handleOutMineduc() {
    if (document.images) document.imgMineduc.src = logo_mineduc_off.src;
}

function handleOverMunitel() {
    if (document.images) document.imgMunitel.src = logo_asocmuni_on.src;
}

function handleOutMunitel() {
    if (document.images) document.imgMunitel.src = logo_asocmuni_off.src;
}

function handleOverMaipu() {
    if (document.images) document.imgMaipu.src = muni_on.src;
}

function handleOutMaipu() {
    if (document.images) document.imgMaipu.src = muni_off.src;
}

function Browser() {

  var ua, s, i;

  this.isIE    = false;  
  this.isOP    = false;  
  this.isNS    = false;  
  this.version = null;

  ua = navigator.userAgent;

  s = "Opera";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isOP = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  s = "Netscape6/";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  s = "Gecko";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = 6.1;
    return;
  }

  s = "MSIE";
  if ((i = ua.indexOf(s))) {
    this.isIE = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }
}

var browser = new Browser();
var activeButton = null;

function buttonClick(event, menuId) {

  var button;

  if (browser.isIE)
    button = window.event.srcElement;
  else
    button = event.currentTarget;

  button.blur();

  if (button.menu == null) {
    button.menu = document.getElementById(menuId);
    if (button.menu.isInitialized == null)
      menuInit(button.menu);
  }

  if (button.onmouseout == null)
    button.onmouseout = buttonOrMenuMouseout;


  if (button == activeButton)
    return false;

  if (activeButton != null)
    resetButton(activeButton);

  if (button != activeButton) {
    depressButton(button);
    activeButton = button;
  }
  else
    activeButton = null;

  return false;
}

function buttonMouseover(event, menuId) {

  var button;

  if (activeButton == null) {
    buttonClick(event, menuId);
    return;
  }

  if (browser.isIE)
    button = window.event.srcElement;
  else
    button = event.currentTarget;


  if (activeButton != null && activeButton != button)
    buttonClick(event, menuId);
}

function depressButton(button) {

  var x, y;

  button.className += " menuButtonActive";

  if (button.onmouseout == null)
    button.onmouseout = buttonOrMenuMouseout;
  if (button.menu.onmouseout == null)
    button.menu.onmouseout = buttonOrMenuMouseout;

  x = getPageOffsetLeft(button);
  y = getPageOffsetTop(button) + button.offsetHeight;



  if (browser.isIE) {
    x += button.offsetParent.clientLeft;
    y += button.offsetParent.clientTop;
  }

  button.menu.style.left = x + "px";
  button.menu.style.top  = y + "px";
  button.menu.style.visibility = "visible";



  if (button.menu.iframeEl != null)
  {
    button.menu.iframeEl.style.left = button.menu.style.left;
    button.menu.iframeEl.style.top  = button.menu.style.top;
    button.menu.iframeEl.style.width  = button.menu.offsetWidth + "px";
    button.menu.iframeEl.style.height = button.menu.offsetHeight + "px";
    button.menu.iframeEl.style.display = "";
  }
}

function resetButton(button) {


  removeClassName(button, "menuButtonActive");



  if (button.menu != null) {
    closeSubMenu(button.menu);
    button.menu.style.visibility = "hidden";



    if (button.menu.iframeEl != null)
      button.menu.iframeEl.style.display = "none";
  }
}

function menuMouseover(event) {
  var menu;

  if (browser.isIE)
    menu = getContainerWith(window.event.srcElement, "DIV", "menu");
  else
    menu = event.currentTarget;

  if (menu.activeItem != null)
    closeSubMenu(menu);
}

function menuItemMouseover(event, menuId) {

  var item, menu, x, y;

  if (browser.isIE)
    item = getContainerWith(window.event.srcElement, "A", "");
  else
    item = event.currentTarget;
  menu = getContainerWith(item, "DIV", "menu");

  if (menu.activeItem != null)
    closeSubMenu(menu);
  menu.activeItem = item;

  item.className += " menuItemHighlight";

  if (item.subMenu == null) {
    item.subMenu = document.getElementById(menuId);
    if (item.subMenu.isInitialized == null)
      menuInit(item.subMenu);
  }

  if (item.subMenu.onmouseout == null)
    item.subMenu.onmouseout = buttonOrMenuMouseout;

  x = getPageOffsetLeft(item) + item.offsetWidth;
  y = getPageOffsetTop(item);

  var maxX, maxY;

  if (browser.isIE) {
    maxX = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft) +
      (document.documentElement.clientWidth != 0 ? document.documentElement.clientWidth : document.body.clientWidth);
    maxY = Math.max(document.documentElement.scrollTop, document.body.scrollTop) +
      (document.documentElement.clientHeight != 0 ? document.documentElement.clientHeight : document.body.clientHeight);
  }
  if (browser.isOP) {
    maxX = document.documentElement.scrollLeft + window.innerWidth;
    maxY = document.documentElement.scrollTop  + window.innerHeight;
  }
  if (browser.isNS) {
    maxX = window.scrollX + window.innerWidth;
    maxY = window.scrollY + window.innerHeight;
  }
  maxX -= item.subMenu.offsetWidth;
  maxY -= item.subMenu.offsetHeight;

  if (x > maxX)
    x = Math.max(0, x - item.offsetWidth - item.subMenu.offsetWidth
      + (menu.offsetWidth - item.offsetWidth));
  y = Math.max(0, Math.min(y, maxY));


  item.subMenu.style.left       = x + "px";
  item.subMenu.style.top        = y + "px";
  item.subMenu.style.visibility = "visible";


  if (item.subMenu.iframeEl != null)
  {
    item.subMenu.iframeEl.style.left    = item.subMenu.style.left;
    item.subMenu.iframeEl.style.top     = item.subMenu.style.top;
    item.subMenu.iframeEl.style.width   = item.subMenu.offsetWidth + "px";
    item.subMenu.iframeEl.style.height  = item.subMenu.offsetHeight + "px";
    item.subMenu.iframeEl.style.display = "";
  }


  if (browser.isIE)
    window.event.cancelBubble = true;
  else
    event.stopPropagation();
}

function closeSubMenu(menu) {

  if (menu == null || menu.activeItem == null)
    return;



  if (menu.activeItem.subMenu != null) {
    closeSubMenu(menu.activeItem.subMenu);
    menu.activeItem.subMenu.style.visibility = "hidden";



    if (menu.activeItem.subMenu.iframeEl != null)
      menu.activeItem.subMenu.iframeEl.style.display = "none";

    menu.activeItem.subMenu = null;
  }


  removeClassName(menu.activeItem, "menuItemHighlight");
  menu.activeItem = null;
}


function buttonOrMenuMouseout(event) {

  var el;

  if (activeButton == null)
    return;

  if (browser.isIE)
    el = window.event.toElement;
  else if (event.relatedTarget != null)
      el = (event.relatedTarget.tagName ? event.relatedTarget : event.relatedTarget.parentNode);


  if (getContainerWith(el, "DIV", "menu") == null) {
    resetButton(activeButton);
    activeButton = null;
  }
}

function menuInit(menu) {

  var itemList, spanList;
  var textEl, arrowEl;
  var itemWidth;
  var w, dw;
  var i, j;

  if (browser.isIE) {
    menu.style.lineHeight = "2.5ex";
    spanList = menu.getElementsByTagName("SPAN");
    for (i = 0; i < spanList.length; i++)
      if (hasClassName(spanList[i], "menuItemArrow")) {
        spanList[i].style.fontFamily = "Webdings";
        spanList[i].firstChild.nodeValue = "4";
      }
  }

  itemList = menu.getElementsByTagName("A");
  if (itemList.length > 0)
    itemWidth = itemList[0].offsetWidth;
  else
    return;

  for (i = 0; i < itemList.length; i++) {
    spanList = itemList[i].getElementsByTagName("SPAN");
    textEl  = null;
    arrowEl = null;
    for (j = 0; j < spanList.length; j++) {
      if (hasClassName(spanList[j], "menuItemText"))
        textEl = spanList[j];
      if (hasClassName(spanList[j], "menuItemArrow"))
        arrowEl = spanList[j];
    }
    if (textEl != null && arrowEl != null) {
      textEl.style.paddingRight = (itemWidth 
        - (textEl.offsetWidth + arrowEl.offsetWidth)) + "px";

      if (browser.isOP)
        arrowEl.style.marginRight = "0px";
    }
  }


  if (browser.isIE) {
    w = itemList[0].offsetWidth;
    itemList[0].style.width = w + "px";
    dw = itemList[0].offsetWidth - w;
    w -= dw;
    itemList[0].style.width = w + "px";
  }


  if (browser.isIE) {
    var iframeEl = document.createElement("IFRAME");
    iframeEl.frameBorder = 0;
    iframeEl.src = "javascript:false;";
    iframeEl.style.display = "none";
    iframeEl.style.position = "absolute";
    iframeEl.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";
    menu.iframeEl = menu.parentNode.insertBefore(iframeEl, menu);
  }


  menu.isInitialized = true;
}


function getContainerWith(node, tagName, className) {
  while (node != null) {
    if (node.tagName != null && node.tagName == tagName &&
        hasClassName(node, className))
      return node;
    node = node.parentNode;
  }

  return node;
}

function hasClassName(el, name) {

  var i, list;

  list = el.className.split(" ");
  for (i = 0; i < list.length; i++)
    if (list[i] == name)
      return true;

  return false;
}

function removeClassName(el, name) {

  var i, curList, newList;

  if (el.className == null)
    return;


  newList = new Array();
  curList = el.className.split(" ");
  for (i = 0; i < curList.length; i++)
    if (curList[i] != name)
      newList.push(curList[i]);
  el.className = newList.join(" ");
}

function getPageOffsetLeft(el) {

  var x;

  x = el.offsetLeft;
  if (el.offsetParent != null)
    x += getPageOffsetLeft(el.offsetParent);

  return x;
}

function getPageOffsetTop(el) {
  var y;

  y = el.offsetTop;
  if (el.offsetParent != null)
    y += getPageOffsetTop(el.offsetParent);

  return y;
}

function toggle(toggleId, e)
{
if (!e) { e = window.event; }
if (!document.getElementById) { return false; }
var body = document.getElementById(toggleId);
if (!body) { return false; } if (body.style.display == 'none') { body.style.display = 'block'; }
else { body.style.display = 'none' }
if (e) { e.cancelBubble = true; }
if (e.stopPropagation) { e.stopPropagation(); }
}

function verPagina(pag) {
    var str = pag;
    var iframe = "<iframe style='border:solid 1px #aaa;' id='iframepdf' scrolling='auto' frameborder='0'></iframe>";
    $("#iframedivinner2").html(iframe);
    $("#iframedivsup2").css("z-index", "10");
    $("#iframedivsup2").css("width", "" + (((window.innerHeight) ? window.innerWidth : document.body.clientWidth) - 40));
    $("#iframedivsup2").css("height", "" + (((window.innerHeight) ? window.innerHeight : document.body.clientHeight) - 10));
    $("#iframedivsup2").css("min-height", "670px");
    $("#iframedivsup2").show(500, function () {
        $("#iframepdf").attr("width", "100%");
        $("#iframepdf").attr("height", "100%");
        $("#iframepdf").css("min-height", "600px");
        $("#iframepdf").attr("src", str);
    });
}
function verPagina2(pag) {
    var str = pag;
    var iframe = "<iframe style='border:solid 1px #aaa;' id='iframepdf' scrolling='auto' frameborder='0'></iframe>";
    $("#iframedivinner3").html(iframe);
    $("#iframedivsup3").css("z-index", "10");
    $("#iframedivsup3").css("width", "" + (((window.innerHeight) ? window.innerWidth : document.body.clientWidth) - 40));
    $("#iframedivsup3").css("height", "" + (((window.innerHeight) ? window.innerHeight : document.body.clientHeight) - 10));
    $("#iframedivsup3").css("min-height", "670px");
    $("#iframedivsup3").show(500, function () {
        $("#iframepdf").attr("width", "100%");
        $("#iframepdf").attr("height", "100%");
        $("#iframepdf").css("min-height", "600px");
        $("#iframepdf").attr("src", str);
    });

}
//]]>