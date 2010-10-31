<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dimensionamiento.aspx.cs" Inherits="GestionSostenedores.dimensionamiento" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 
   Response.AddHeader("pragma", "no-cache");
   Response.CacheControl = "Private";
   Response.Expires = 0;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>Gesti&oacute;n de Sostenedores</title>
<style type="text/css" media="all">
#b_riesgo { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
#b_verde { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
#b_luminaria { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
#b_comisaria { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
#b_botillerias { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
#b_emergencia { background:url('images/b_coordenadas.gif') no-repeat; border:none; width:22px; height:22px }
</style>
<link href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css"/>
<link href="css/screen2.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/tabla.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=es&region=CL"></script>
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.mouse.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.draggable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.resizable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.dialog.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.tabs.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.button.min.js"></script>
<script type="text/javascript" src="Scripts/funciones.min.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.tables.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.functions.js" ></script>
<script type="text/javascript" src="Scripts/ui.datepicker-es.js"></script>
<script type="text/javascript" src="Scripts/jsPopup.js"></script>
<script id="dimensionamiento" type="text/javascript">
    <%
        Response.Write("var codusu='" + Session["codusu"] +  "';\n" );  
        Response.Write("var codins='" + Session["codins"] +  "';\n" ); 
    %>
    var rid = 0;
    function openDialog(id) {
      rid = id;
      $("#dialog").dialog('open');
    }
    $(function() {
		$("#dialog").dialog({
			bgiframe: true,
			resizable: true,
            draggable: true,
            autoOpen: false,
			height:140,
			modal: true,
			overlay: {
				backgroundColor: '#000',
				opacity: 0.5
			},
			buttons: {
				'Eliminar': function() {
				    EliminarEstablecimiento(rid,codins);
                    $(this).dialog('close');
				},
				'Cancelar': function() {
				    $(this).dialog('close');
				}
			}
		});
    });


    $(document).ready(function () {

              $('body').append(
                $('<div>').attr('id', 'loading').append(
                    $('<img>').attr('src', 'images/ajax-loader.gif').attr('alt', 'Loading...')
                  ).css({
                    position: 'absolute',
                    display: 'none'
                  })
                );

              // Reposicionado de la imagen
              $(document).mousemove(function(e){
                $('#loading').css({left: e.pageX + 10, top: e.pageY + 15});
              });


                $('#loading').bind('ajaxStart', function () {
                    $(this).show();
                }).bind('ajaxStop', function () {
                    $(this).hide();
                });

        $("#tabs").tabs({ selected: -1 }).addClass('ui-tabs-vertical ui-helper-clearfix');
        $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
        $('#tabs').bind('tabsshow', function (event, ui) {
            var tabSelected = "#tab" + ui.index + "Selected";
            $(tabSelected).html("isClicked");
        });
        $('#tabs').bind('tabsselect', function (event, ui) {
            var callMethod;
            var jsonStr;
            var method;
            var type;
            var dtype;
            var tabSelected = "#tab" + ui.index + "Selected";
            //alert($(tabSelected).text()); 
            if ( ($(tabSelected).text() == "") || ($(tabSelected).text() == "isClicked")) {
                switch (ui.index) {
                    case 0:
                        jsonStr ="accion=edit&codusu=" + codusu;
                        method ="GET";
                        dtype="html";
                        type="application/x-www-form-urlencoded";
                        callMethod = "institucion.aspx";
                        $("tabla1").hide();
                        $("#formulario1").show();
                        break;
                    case 1:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 2:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 3:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 4:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 5:
                        jsonStr ="accion=edit&codusu=" + codusu;
                        method ="GET";
                        dtype="html";
                        type="application/x-www-form-urlencoded";
                        callMethod = "finanzas.aspx";
                        $("tabla6").hide();
                        $("#formulario6").show();
                        break;
                    case 6:
                        jsonStr ="accion=edit&codusu=" + codusu;
                        method ="GET";
                        dtype="html";
                        type="application/x-www-form-urlencoded";
                        callMethod = "planificacion.aspx";
                        $("tabla7").hide();
                        $("#formulario7").show();
                        break;
                    case 7:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 8:
                        jsonStr ="accion=edit&codusu=" + codusu;
                        method ="GET";
                        dtype="html";
                        type="application/x-www-form-urlencoded";
                        callMethod = "redes.aspx";
                        $("tabla9").hide();
                        $("#formulario9").show();
                        break;
                    case 9:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                    case 10:
                        jsonStr ="codusu=" + codusu;
                        method ="GET";
                        dtype="html";
                        type="application/x-www-form-urlencoded";
                        callMethod = "demografia.aspx";
                        $("tabla11").hide();
                        $("#formulario11").show();
                        break;
                    case 11:
                        jsonStr= "{codusu:'" + codusu + "'}"
                        method ="POST";
                        dtype="json";
                        type="application/json; charset=utf-8";
                        callMethod = "dimensionamiento.aspx/ObtenerEstablecimientos";
                        break;
                }

                $.ajax({
                    type: method,
                    url: callMethod,
                    data: jsonStr,
                    contentType: type,
                    dataType: dtype,
                    async: true,
                    success: function (msg) {
                        switch (ui.index) {
                            case 0:
                                $("#formulario1").html(msg);
                                break;
                            case 1:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="";
                                if(objJson.establecimientos.length>0){
                                    strTabla="<table><thead><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th colspan='3'>&nbsp;</th></thead></tr>";
                                    strTabla+="<tbody>";
                                    $.each(objJson.establecimientos, function(i,establecimiento){
                                        strTabla += "<tr>";
                                        strTabla += "<td>";
                                        strTabla += (i+1).toString();
                                        strTabla += "</td>";
                                        strTabla += "<td>";
                                        strTabla += establecimiento.MAGNITUD_NOMBRE;
                                        strTabla += "</td>";
                                        strTabla += "<td>";
                                        strTabla += establecimiento.MAGNITUD_DIRECCION;
                                        strTabla += "</td>";
                                        strTabla += "<td><a href=\"javascript:llamarPagina('#tabla2','#formulario2','establecimiento.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                        strTabla += "<td><a href=\"javascript:openDialog('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                        strTabla += "<td><a href=\"javascript:llamarPagina('#tabla2','#formulario2','establecimiento.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                        strTabla += "</tr>";
                                    });
                                    strTabla+="</tbody>";
                                    strTabla+= "</table>";
                                } else {
                                    strTabla="<table>";
                                    strTabla+="<tr>";
                                    strTabla+="<td>Agregar Establecimiento<td>";
                                    strTabla+= "<td><a href=\"javascript:llamarPagina('#tabla2','#formulario2','establecimiento.aspx?accion=add')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla+="</tr>";
                                }

                                $("#tabla2").empty();
                                $("#tabla2").append(strTabla);
                                break;
                            case 2:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla3','#formulario3','eficiencia.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla3','#formulario3','eficiencia.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla3").empty();
                                $("#tabla3").append(strTabla);
                                break;
                            case 3:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla4','#formulario4','vulnerabilidad.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla4','#formulario4','vulnerabilidad.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla4").empty();
                                $("#tabla4").append(strTabla);
                                break;
                            case 4:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla5','#formulario5','resultados.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla5','#formulario5','resultados.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla5").empty();
                                $("#tabla5").append(strTabla);
                                break;
                            case 5:
                                $("#formulario6").html(msg);
                                break;
                            case 6:
                                $("#formulario7").html(msg);
                                break;
                            case 7:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla8','#formulario8','proyectos.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla5','#formulario5','resultados.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla8").empty();
                                $("#tabla8").append(strTabla);
                                break;
                            case 8:
                                $("#formulario9").html(msg);
                                break;
                            case 9:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla10','#formulario10','espacial.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla3','#formulario3','espacial.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla10").empty();
                                $("#tabla10").append(strTabla);
                                break;
                            case 10:
                                $("#formulario11").html(msg);
                                break;
                            case 11:
                                var objJson = JSON.parse(msg.d);
                                var strTabla="<table><tr><th>Nº</th><th>Establecimiento</th><th>Direci&oacute;n</th><th colspan='3'>&nbsp;</th></tr>";
                                $.each(objJson.establecimientos, function(i,establecimiento){
                                    strTabla += "<tr>";
                                    strTabla += "<td>";
                                    strTabla += (i+1).toString();
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_NOMBRE;
                                    strTabla += "</td>";
                                    strTabla += "<td>";
                                    strTabla += establecimiento.MAGNITUD_DIRECCION;
                                    strTabla += "</td>";
                                    strTabla += "<td><a href=\"javascript:llamarPagina('#tabla12','#formulario12','infraestructura.aspx?accion=edit&codest=" + establecimiento.CODEST + "')\" onmouseover=\"handleOverBotonEditar();return true;\" onmouseout=\"handleOutBotonEditar();return true;\"><img name=\"imgBotonEditar\" width=\"32\" height=\"31\" border=\"0\" alt=\"editar\" src=\"../images/botones/b_editar_off.gif\"/></a></td>";
                                    //strTabla += "<td><a href=\"javascript:EliminarEstablecimiento('" + establecimiento.CODEST + "');\" onmouseover=\"handleOverBotonMenos();return true;\" onmouseout=\"handleOutBotonMenos();return true;\"><img name=\"imgBotonMenos\" width=\"32\" height=\"31\" border=\"0\" alt=\"menos\" src=\"../images/botones/b_menos_off.gif\" /></a></td>";
                                    //strTabla += "<td><a href=\"javascript:llamarPagina('#tabla12','#formulario12','infraestructura.aspx?accion=add&codest=" + establecimiento.CODEST + "')\" onmouseout=\"handleOutBotonMas();return true;\"><img name=\"imgBotonMas\" width=\"32\" height=\"31\" border=\"0\" alt=\"mas\" src=\"../images/botones/b_mas_off.gif\" /></a></td>";
                                    strTabla += "</tr>";
                                });
                                strTabla += "</table>";
                                $("#tabla12").empty();
                                $("#tabla12").append(strTabla);
                                break;
                        }
                    },error: function (msg) {
                        alert(msg);
                    }
                });
            }
        });

    });

</script>
<style type="text/css"> 
	
/* Pestañas verticales 
----------------------------------*/
.ui-tabs-vertical { width: 55em; }
.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-selected { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
</style> 
</head>
<body>
<div id="dialog" title="Advertencia">
	<p>¿Desea eliminar este establecimiento?</p>
</div>
<div id="tabs">
 <ul>
    <li>
      <a href="#tabs-0">Identificaci&oacute;n</a>
    </li>
    <li>
      <a href="#tabs-1">Magnitud</a>
    </li>
    <li>
      <a href="#tabs-2">Eficiencia</a>
    </li>
    <li>
      <a href="#tabs-3">Vulnerabilidad</a>
    </li>
    <li>
      <a href="#tabs-4">Resultados</a>
    </li>
    <li>
      <a href="#tabs-5">Finanzas</a>
    </li>
    <li>
      <a href="#tabs-6">Planificaci&oacute;n</a>
    </li>
    <li>
      <a href="#tabs-7">Proyectos</a>
    </li>
    <li>
      <a href="#tabs-8">Redes</a>
    </li>
    <li>
      <a href="#tabs-9">Espacial</a>
    </li>
    <li>
      <a href="#tabs-10">Demograf&iacute;a</a>
    </li>
    <li>
      <a href="#tabs-11">Infraestructura</a>
    </li>
 </ul>

 <!--tabs-0-->
 <div id="tabs-0">
    <input type="hidden" id="tab0Selected" />
    <div id="formulario1" style="display:none;"></div>
    <div id="tabla1" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-1-->
 <div id="tabs-1">
    <input type="hidden" id="tab1Selected" />
    <div id="formulario2" style="display:none;"></div>
    <div id="tabla2" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-2-->
 <div id="tabs-2">
    <input type="hidden" id="tab2Selected" />
    <div id="formulario3" style="display:none;"></div>
    <div id="tabla3" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-3-->
 <div id="tabs-3">
    <input type="hidden" id="tab3Selected" />
    <div id="formulario4" style="display:none;"></div>
    <div id="tabla4" class="fondo_dimensionamiento"></div>
 </div>

 <!--tabs-4-->
  <div id="tabs-4">
    <input type="hidden" id="tab4Selected" />
    <div id="formulario5" style="display:none;"></div>
    <div id="tabla5" class="fondo_dimensionamiento"></div>
 </div>

 <!--tabs-5-->
 <div id="tabs-5">
    <input type="hidden" id="tab5Selected" />
    <div id="formulario6" style="display:none;"></div>
    <div id="tabla6" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-6-->
 <div id="tabs-6">
    <input type="hidden" id="tab6Selected" />
    <div id="formulario7" style="display:none;"></div>
    <div id="tabla7" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-7-->
 <div id="tabs-7">
    <input type="hidden" id="tab7Selected" />
    <div id="formulario8" style="display:none;"></div>
    <div id="tabla8" class="fondo_dimensionamiento"></div>
 </div>

 <!--tabs-8-->
 <div id="tabs-8">
    <input type="hidden" id="tab8Selected" />
    <div id="formulario9" style="display:none;"></div>
    <div id="tabla9" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-9-->
 <div id="tabs-9">
    <input type="hidden" id="tab9Selected" />
    <div id="formulario10" style="display:none;"></div>
    <div id="tabla10" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-10-->
 <div id="tabs-10">
    <input type="hidden" id="tab10Selected" />
    <div id="formulario11" style="display:none;"></div>
    <div id="tabla11" class="fondo_dimensionamiento"></div>
 </div>

  <!--tabs-11-->
 <div id="tabs-11">
    <input type="hidden" id="tab11Selected" />
    <div id="formulario12" style="display:none;"></div>
    <div id="tabla12" class="fondo_dimensionamiento"></div>
 </div>
</div>
</body>
</html>
