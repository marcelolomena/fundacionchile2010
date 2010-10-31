function goMostrarPopup(tipo, objJson, txt, strDato, nTime, nWidth, nHeight, tag) {
    crearPopup(txt,tag);
    llenarPopup(tipo,objJson, txt, strDato, nTime, nWidth, nHeight);
}

function crearPopup(txt,tag) {
    var strDiv = '';
    strDiv += '<div id="div' + txt + '" style="border: solid 2px gray;display: none; background-color: #f3f3f3; width: 95%; height: 95%; position: absolute; vertical-align: middle; text-align: center; margin: 10px; top: 15px; left: 10px;">';
    strDiv += '   <div id="div' + txt + 'Head">';
    strDiv += '       <table class="textoNegro10" width="100%">';
    strDiv += '           <tr>';
    strDiv += '               <td style="width: 15%;heigth:100px; text-align: right;">';
    strDiv += '               <span id="cerrar" style="margin: 2px; padding: 2px; background-color: White;';
    strDiv += '                border: solid gray 1px; text-align: center; font-family: Verdana, Arial; color: gray;';
    strDiv += '                font-size: small; font-weight: bold; cursor: pointer;" onclick="goCerrarPopup(\'' + txt + '\')">';
    strDiv += '                Cerrar [X] </span>';
    strDiv += '               </td>';
    strDiv += '           </tr>';
    strDiv += '       </table>';
    strDiv += '   </div>';
    strDiv += '   <div id="mapa" style="width:400px;height:270px;">';
    strDiv += '   </div>';
    strDiv += '</div>';

    $(tag).append(strDiv);
}

function goCerrarPopup(txt, nTime) {
    $('#div' + txt).hide(nTime, function () {
        $('#div' + txt + 'Form').html('');
    });
    $('#div' + txt).remove();
}

function llenarPopup(tipo,objJson, txt, strDato, nTime, nWidth, nHeight) {

    var wscr = $(window).width();
    var hscr = $(window).height();

    var nLeft = (wscr - nWidth) / 2;
    var nTop = (hscr - nHeight) / 2;
    var myLatlng;
    var myOptions;
    var map;
    var image = '../images/maps/bank.png';
    var punto;
    var marcador;

    $('#div' + txt).show(nTime, function () {
        $('#div' + txt).css('width', nWidth);
        $('#div' + txt).css('height', nHeight);
        $('#div' + txt).css('top', nTop);
        $('#div' + txt).css('left', nLeft);
        $("#div" + txt).draggable({ handle: $("#div" + txt + "Head") });
        $("#div" + txt + "Head").css({ cursor: 'move' });

        for (var i = 0; i < objJson.length; i++) {
            if (tipo == 'riesgo') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["RIESGO_LAT"]), parseFloat(objJson[i]["RIESGO_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["RIESGO_LAT"]), parseFloat(objJson[i]["RIESGO_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    });
                }
            } else if (tipo == 'verde') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["VERDE_LAT"]), parseFloat(objJson[i]["VERDE_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["VERDE_LAT"]), parseFloat(objJson[i]["VERDE_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    });                    
                }
            } else if (tipo == 'luminaria') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["LUMINARIA_LAT"]), parseFloat(objJson[i]["LUMINARIA_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["LUMINARIA_LAT"]), parseFloat(objJson[i]["LUMINARIA_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    }); 
                }
            } else if (tipo == 'comisaria') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["COMISARIA_LAT"]), parseFloat(objJson[i]["COMISARIA_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["COMISARIA_LAT"]), parseFloat(objJson[i]["COMISARIA_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    }); 
                }
            } else if (tipo == 'botilleria') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["BOTILLERIA_LAT"]), parseFloat(objJson[i]["BOTILLERIA_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["BOTILLERIA_LAT"]), parseFloat(objJson[i]["BOTILLERIA_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    }); 
                }
            } else if (tipo == 'emergencia') {
                if (i == 0) {
                    myLatlng = new google.maps.LatLng(parseFloat(objJson[i]["EMERGENCIA_LAT"]), parseFloat(objJson[i]["EMERGENCIA_LON"]));
                    myOptions = {
                        zoom: 8,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("mapa"), myOptions);
                } else {
                    punto = new google.maps.LatLng(parseFloat(objJson[i]["EMERGENCIA_LAT"]), parseFloat(objJson[i]["EMERGENCIA_LON"]));
                    marcador = new google.maps.Marker({
                        position: punto,
                        map: map,
                        icon: image
                    });
                }
            }
        }
    });
}

function goMostrarPopupLoad(txt, strUrl, nTime, nWidth, nHeight, tag) {
    crearPopupLoad(txt, nTime,tag);
    llenarPopupLoad(txt, strUrl, nTime, nWidth, nHeight);
}

function crearPopupLoad(txt, strUrl,tag) {

    var strDiv = '';
    strDiv += '<div id="div' + txt + '" style="border: solid 2px gray;display: none; background-color: #f3f3f3; width: 95%; height: 95%; position: absolute; vertical-align: middle; text-align: center; margin: 10px; top: 15px; left: 10px;">';
    strDiv += '   <div id="div' + txt + 'Head">';
    strDiv += '       <table class="textoNegro10" width="100%">';
    strDiv += '           <tr>';
    strDiv += '               <td style="width: 15%;heigth:100px; text-align: right;">';
    strDiv += '               <span id="cerrar" style="margin: 2px; padding: 2px; background-color: White;';
    strDiv += '                border: solid gray 1px; text-align: center; font-family: Verdana, Arial; color: gray;';
    strDiv += '                font-size: small; font-weight: bold; cursor: pointer;" onclick="goCerrarPopup(\'' + txt + '\')">';
    strDiv += '                Cerrar [X] </span>';
    strDiv += '               </td>';
    strDiv += '           </tr>';
    strDiv += '           <tr>';
    strDiv += '              <td>';
    strDiv += '              <iframe id="iframe' + txt + '" style="border:solid 1px #aaa;" scrolling="auto" frameborder="0"></iframe>';
    strDiv += '              </td>';
    strDiv += '           </tr>';
    strDiv += '       </table>';
    strDiv += '   </div>';
    strDiv += '   <div id="div' + txt + 'Form">';
    strDiv += '   </div>';
    strDiv += '</div>';
    $(tag).append(strDiv);
}

function llenarPopupLoad(txt, strUrl, nTime, nWidth, nHeight) {
    var nTop = eval(($(document).height() - nHeight) / 2);
    var nLeft = eval(($(document).width() - nWidth) / 2);
    $('#div' + txt).show(nTime, function () {
        $('#div' + txt).css('width', nWidth);
        $('#div' + txt).css('height', nHeight);
        $('#div' + txt).css('top', nTop);
        $('#div' + txt).css('left', nLeft);
        $("#div" + txt).draggable({ handle: $("#div" + txt + "Head") });
        $("#div" + txt + "Head").css({ cursor: 'move' });
        $("#iframe" + txt).attr("width", "98%");
        $("#iframe" + txt).attr("height", "98%");
        $("#iframe" + txt).css("min-height", eval(nHeight - 40) + "px");
        $("#iframe" + txt).attr("src", strUrl);

    });
}