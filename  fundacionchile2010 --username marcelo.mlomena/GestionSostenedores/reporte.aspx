<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reporte.aspx.cs" Inherits="GestionSostenedores.reporte" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n Escolar de Calidad</title>
<link href="css/tablesorter.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="Scripts/highcharts.js"></script>
<script type="text/javascript" src="Scripts/modules/exporting.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/graficos.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript">
        <%
            Response.Write("var codfor='" + Request["codfor"] + "';");
            Response.Write("var codins='" + Request["codins"] + "';");
        %>
        var chart;
        $(document).ready(function () {

        $("#btn_actualizar").click(function(){
            var idTipo=$("#tipo").val();
            var idForma=$("#forma").val();

            if(idTipo=='A'){

                if( $("#dimension").is(':visible') ){
                    $("#dimension").fadeOut("slow");
                }

                if( $("#mejoria").is(':visible') ){
                    $("#mejoria").fadeOut("slow");
                }

                $("#area").show("slow", function(){
                    ReporteArea(idForma,codins);
                });
            }else if(idTipo=='D'){
                if( $("#area").is(':visible') ){
                    $("#area").fadeOut("slow");
                }

                if( $("#mejoria").is(':visible') ){
                    $("#mejoria").fadeOut("slow");
                }

                $("#dimension").show("slow", function(){
                    ReporteDimension(idForma,codins);
                });
            }

        });

        $("#btn_mejoria").click(function(){
            if( $("#dimension").is(':visible') ){
                $("#dimension").fadeOut("slow");
            }else if( $("#area").is(':visible') ){
                $("#area").fadeOut("slow");
            }
            $("#mejoria").show("slow", function(){
                    ReporteMejoria(codins);
            });
        });

        $("#btn_cartesiano").click(function(){
            var codTipo=$("#tipo").val();

            if( $("#dimension").is(':visible') ){
                $("#dimension").fadeOut("slow");
            }else if( $("#area").is(':visible') ){
                $("#area").fadeOut("slow");
            }else if( $("#mejoria").is(':visible') ){
                $("#mejoria").fadeOut("slow");
            }

            if(codTipo=='A'){
                ReporteAreaCartesiano(codins);
            }else{
                ReporteDimensionCartesiano(codins);
            }

        });

        $('body').append(
                $('<div>').attr('id', 'loading').append(
                    $('<img>').attr('src', 'images/ajax-loader.gif').attr('alt', 'Loading...')
                  ).css({
                      position: 'absolute',
                      display: 'none'
                  })
                );

        // Reposicionado de la imagen
        $(document).mousemove(function (e) {
            $('#loading').css({ left: e.pageX + 10, top: e.pageY + 15 });
        });
        
        $.tablesorter.addWidget({
          id: "zebraHover",
          format: function(table){
             $(table.tBodies[0].rows).css({
                'cursor' : 'pointer'
             });
             $(table.tBodies[0].rows).hover(function(){
                ($(this).get(0).className == 'hover') ? xvoid = '': xclassName = $(this).get(0).className;
                $(this).removeClass('odd').removeClass('even').addClass('hover');
                },
             function(){
                   $(this).removeClass('hover').addClass(xclassName);
                }); // end .hover()
          } 
        });

        $("table").tablesorter({
               sortMultiSortKey: 'ctrlKey', widthFixed: true, widgets: ['zebra', 'zebraHover'] 
        });

        ReporteArea(codfor);
    });
</script>
</head>
<body>
<div id="internas" style="padding:5px;">
    <div id="grafico" style="width: 100%; height: 400px"></div>
    <br />
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th>Forma</th>
          <td>
            <select name="forma" id="forma">
              <option value="A">A</option>
              <option value="B">B</option>
            </select>
          </td>
          <th>Tipo</th>
          <td>
            <select name="tipo" id="tipo">
              <option value="A">Área</option>
              <option value="D">Dimensión</option>
            </select>
          </td>
          <th colspan="2"><input type="button" value="Actualizar" id="btn_actualizar"/></th>
          <th colspan="2"><input type="button" value="Mejoría" id="btn_mejoria"/></th>
          <th colspan="2"><input type="button" value="Cartesiano" id="btn_cartesiano"/></th>
        </tr>
    </table>
    <div id="area">
                <table id="areaTBL" cellspacing="1" border ="1" class="tablesorter">
                <thead>
                <tr>
                <th>Actor</th>
                <th>Liderazgo estrategico educativo</th>
                <th>Procesos curriculares<br/> y competencias profesionales</th>
                <th>Recursos finacieros<br/> y servicios de apoyo</th>
                <th>Resultados</th>
                <th>Relaciones con la cumunidad</th>
                </tr>
                </thead>
                <tbody></tbody>
                <tfoot></tfoot>
                </table> 
    </div>
    <div id="dimension" style="display:none;">
                <table id="dimensionTBL" cellspacing="1" border ="1" class="tablesorter">
                <thead>
                <tr>
                <th>Actor</th>
                <th>Liderazgo y cambio educativo</th>
                <th>Planificación Estratégica</th>
                <th>Gestión curricular pedagógica</th> 
                <th>Gestión de competencias</th>
                <th>Recursos Financieros</th>
                <th>Servicios de apoyo</th> 
                <th>Orientación e impacto en la comunidad</th>
                <th>Logros educativos</th>
                <th>Efectividad de la gestión</th>
                <th>Participación y atención a la comunidad</th>
                <th>Comunicación y rendición de cuentas</th>
                <th>Redes Institucionales y sociales</th>
                </tr>
                </thead>
                <tbody></tbody>
                <tfoot></tfoot>
                </table>
    </div>
    <div id="mejoria" style="display:none;">
                <table id="mejoriaTBL" cellspacing="1" border ="1" class="tablesorter">
                <thead>
                <tr>
                <th>Actor</th>
                <th>Área 1</th>
                <th>Área 2</th>
                <th>Área 3</th>
                <th>Área 4</th>
                <th>Área 5</th>
                <th>Área 6</th>
                </tr>
                </thead>
                <tbody></tbody>
                <tfoot></tfoot>
                </table> 
    </div>
</div>
</body>
</html>
