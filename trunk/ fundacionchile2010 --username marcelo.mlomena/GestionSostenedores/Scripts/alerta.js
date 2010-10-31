function MostrarPopupUsr(txt, nTime, nWidth, nHeight, tag, codins) {
    alert(codins);
    var strDiv = '';
    var wscr = $(window).width();
    var hscr = $(window).height();
    var nLeft = (wscr - nWidth) / 2;
    var nTop = (hscr - nHeight) / 2;

    var strDiv = '';
    strDiv += '<div id="div' + txt + '" style="border: solid 2px gray;display: none; background-color: #ffffff; width: 95%; height: 95%; position: absolute; vertical-align: middle; text-align: center; margin: 10px; top: 15px; left: 10px;">';
    strDiv += '   <div id="div' + txt + 'Head" style="background-image: url(images/title.gif); ">';
    strDiv += '       <table width="100%">';
    strDiv += '           <tr>';
    strDiv += '              <td style="width: 15%;heigth:100px; text-align: right;">';
    strDiv += '                <input style="cursor: pointer;" title="Minimizar" type="image" src="images/SingleDown.gif" id="btnDown' + txt + '" onclick="goMin(\'' + txt + '\',' + nWidth + ');return false">';
    strDiv += '                <input style="cursor: pointer;" title="Restaurar" type="image" src="images/SingleUp.gif" id="btnUp' + txt + '" onclick="goMax(\'' + txt + '\',' + nWidth + ',' + nHeight + ');return false">';
    strDiv += '                <input style="cursor: pointer;" title="Cerrar" type="image" src="images/SingleClose.gif" id="btnClose' + txt + '" onclick="goClose(\'' + txt + '\');return false">';
    strDiv += '              </td>';
    strDiv += '           </tr>';
    strDiv += '       </table>';
    strDiv += '   </div>';
    strDiv += '   <div id="div' + txt + 'Form">';

    strDiv += '  <div id=\"internas\" style=\"padding:5px;\">';
    strDiv += '  <h1><strong>Agregar un nuevo usuario</strong></h1>';
    strDiv += '    <form id=\"frmusuario\">'; 
    strDiv += '    <input type="hidden" name="codins" value"' + codins +'">';
    strDiv += '      <div class=\"fondo_formularios\">';
    strDiv += '        <p>Ingrese todos los campos: </p>';
    strDiv += '        <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">';
    strDiv += '          <tr>';
    strDiv += '           <th>Actor</th>';
    strDiv += '            <td><select name=\"actor\" id=\"actor\">';
    strDiv += '                <option value=\"1\">Alumno</option>';
    strDiv += '               <option value=\"2\">Apoderado</option>';
    strDiv += '               <option value=\"3\">Asistente</option>';
    strDiv += '               <option value=\"4\">Director</option>';
    strDiv += '                <option value=\"5\">Docente</option>';
    strDiv += '                <option value=\"6\">Jefe técnico</option>';
    strDiv += '                <option value=\"7\">Sostenedor</option>';
    strDiv += '              </select>';
    strDiv += '            </td>';
    strDiv += '          </tr>';
    strDiv += '          <tr>';
    strDiv += '            <th>Nombre</th>';
    strDiv += '           <td><input name=\"nombre\" type=\"text\" id=\"nombre\" size=\"50\" /></td>';
    strDiv += '          </tr>';
    strDiv += '        <tr>';
    strDiv += '          <th>Apellido</th>';
    strDiv += '          <td><input name=\"apellido\" type=\"text\" id=\"apellido\" size=\"50\" /></td>';
    strDiv += '       </tr>';
    strDiv += '        <tr>';
    strDiv += '          <th>e-mail</th>';
    strDiv += '          <td><input name=\"email\" type=\"text\" id=\"email\" size=\"50\" /></td>';
    strDiv += '        </tr>';
    strDiv += '       <tr>';
    strDiv += '         <th>Clave</th>';
    strDiv += '         <td><input name=\"clave_1\" type=\"password\" id=\"clave_1\" size=\"20\" /></td>';
    strDiv += '        </tr>';
    strDiv += '        <tr>';
    strDiv += '          <th>Repetir Clave</th>';
    strDiv += '          <td><input name=\"clave_2\" type=\"password\" id=\"clave_2\" size=\"20\" /></td>';
    strDiv += '        </tr>';
    strDiv += '      </table>';
    strDiv += '      </div>';
    strDiv += '      <div class=\"bottom_formularios\"></div>';
    strDiv += '    <p id=\"boton_enviar\" style=\"text-align:center\"><input type=\"submit\" value=\"ENVIAR\" /></p>';
    strDiv += '  </form>';
    strDiv += ' <div style=\"clear:both;\">&nbsp;</div>';
    strDiv += '  <div style=\"clear:both;\">&nbsp;</div>';
    strDiv += '</div>';

    strDiv += '   </div>';
    strDiv += '</div>';
    $(tag).append(strDiv);

    $('#div' + txt).show(nTime, function () {
        $('#div' + txt).css('width', nWidth);
        $('#div' + txt).css('height', nHeight);
        $('#div' + txt).css('top', nTop);
        $('#div' + txt).css('left', nLeft);
        $("#div" + txt).draggable({ handle: $("#div" + txt + "Head") });
        $("#div" + txt + "Head").css({ cursor: 'move' });
    });
}

/*
$("#btn_frm").click(function () {
    var codFRM = $("#idFRM").val();

    if ($("#divgraficoForm").is(':visible')) {
        $("#divgraficoForm").fadeOut("slow");
    }

    ReporteInscritos(codins, codFRM, "divgraficoForm");

});
*/

function MostrarAlerta(txt, nTime, nWidth, nHeight, tag) {
    var strDiv = '';
    var wscr = $(window).width();
    var hscr = $(window).height();
    var nLeft = (wscr - nWidth) / 2;
    var nTop = (hscr - nHeight) / 2;

    var strDiv = '';
    strDiv += '<div id="div' + txt + '" style="border: solid 2px gray;display: none; background-color: #f3f3f3; width: 95%; height: 95%; position: absolute; vertical-align: middle; text-align: center; margin: 10px; top: 15px; left: 10px;">';
    strDiv += '   <div id="div' + txt + 'Head" style="background-image: url(images/title.gif); ">';
    strDiv += '       <table width="100%">';
    strDiv += '           <tr>';
    strDiv += '              <td style="width: 15%;heigth:100px; text-align: right;">';
    strDiv += '                <input style="cursor: pointer;" title="Minimizar" type="image" src="images/SingleDown.gif" id="btnDown' + txt + '" onclick="goMin(\'' + txt + '\',' + nWidth + ');return false">';
    strDiv += '                <input style="cursor: pointer;" title="Restaurar" type="image" src="images/SingleUp.gif" id="btnUp' + txt + '" onclick="goMax(\'' + txt + '\',' + nWidth + ',' + nHeight + ');return false">';
    strDiv += '                <input style="cursor: pointer;" title="Cerrar" type="image" src="images/SingleClose.gif" id="btnClose' + txt + '" onclick="goClose(\'' + txt + '\');return false">';
    strDiv += '              </td>';
    strDiv += '           </tr>';
    strDiv += '       </table>';
    strDiv += '   </div>';
    strDiv += '   <div id="div' + txt + 'Form">';
    strDiv += '   </div>';
    //strDiv += '<div>';
    //strDiv += '<table><tr>';
    //strDiv += '<td><select name="idFRM" id="idFRM"><option value="A">A</option><option value="B">B</option></select></td>';
    //strDiv += '<td><input type="button" value="Forma" id="btn_frm"/></td>';
    //strDiv += '</tr></table>';
    //strDiv += '</div>';
    strDiv += '</div>';
    $(tag).append(strDiv);

    $('#div' + txt).show(nTime, function () {
        $('#div' + txt).css('width', nWidth);
        $('#div' + txt).css('height', nHeight);
        $('#div' + txt).css('top', nTop);
        $('#div' + txt).css('left', nLeft);
        $("#div" + txt).draggable({ handle: $("#div" + txt + "Head") });
        $("#div" + txt + "Head").css({ cursor: 'move' });
    });
}

function goClose(txt, nTime) {
    $('#div' + txt).hide(nTime, function () {
        $('#div' + txt + 'Form').html('');
    });
    $('#div' + txt).remove();
}

function goMin(txt, nWidth) {
    var nTop = eval($(window).height() - 120);
    var nLeft = 10;
    var nHeight = 30;
    $('#div' + txt).css('width', nWidth);
    $('#div' + txt).css('height', nHeight);
    $('#div' + txt).css('top', nTop);
    $('#div' + txt).css('left', nLeft);
    $('#div' + txt + 'Form').hide();
    $('#btnDown' + txt).hide();
    $('#btnUp' + txt).show();
}

function goMax(txt, nWidth, nHeight) {
    var nTop = eval(($(window).height() - nHeight) / 2);
    var nLeft = eval(($(window).width() - nWidth) / 2);
    $('#div' + txt).css('width', nWidth);
    $('#div' + txt).css('height', nHeight);
    $('#div' + txt).css('top', nTop);
    $('#div' + txt).css('left', nLeft);
    $('#div' + txt + 'Form').show(500);
    $('#btnDown' + txt).show();
    $('#btnUp' + txt).hide();
}

