<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="GestionSostenedores.registro" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n Escolar de Calidad</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.mouse.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.draggable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.resizable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.button.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.dialog.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/jquery.functions.js" ></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/jsPopup.js"></script>
<script id="institucion" type="text/javascript">
    <%
        Response.Write("var codins='" + Session["codins"] +  "';\n" );  
    %>
    $(document).ready(function () {

$("#region").change(function () {
    var region_id = $('#region').val();
    var jsonStr = "{codreg:'" + region_id + "'}";
    var comunas = "";
    $.ajax({
        type: "POST",
        url: "/institucion.aspx/ObtenerComunaPorRegion",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);

            $.each(objJson.comunas, function (i, com) {
                comunas += "<option value=\"" + com.CODCOM + "\">" + com.NOMCOM + "</option>";
            });
            $("#CODCOM").html(comunas);
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
});

$("#dependencia").change(function () {
    var dependencia_id = $('#dependencia').val();
    var comuna_id = $('#CODCOM').val();
    var jsonStr = "{coddep:'" + dependencia_id + "',codcom:'" + comuna_id + "'}";
    var sostenedores = "";

    $.ajax({
        type: "POST",
        url: "/institucion.aspx/ObtenerSostenedores",
        data: jsonStr,
        contentType: "application/json",
        dataType: "json",
        timeout: 10000,
        success: function (response) {
            var objJson = JSON.parse(response.d);
            if (objJson.sostenedores.length > 0) {
                $.each(objJson.sostenedores, function (i, sos) {
                    sostenedores += "<option value=\"" + sos.CODINS + "\">" + sos.IDENTIFICACION_NOMBRE + "</option>";
                });
            }
            $("#sostenedor").html(sostenedores);
        },
        error: function (msg) {
            //jAlert("intentelo mas tarde", "Error");
        }
    });
});
});
</script>
</head>

<body>
<uc1:encabezado ID="cabecita" runat="server"/>

<div id="registro">
  <h1><strong>Se&ntilde;or(a) Sostenedor(a) </strong><br />
  Bienvenido/a al sistema de mejoramiento continuo</h1>

 <div id="col_02">

<div id="tblUsuariosSys" style="display:none;">
    <table id="tblUsr" class="tablesorter">
    <thead>
    <tr>
    <th>Nº</th>
    <th>nombre</th>
    <th>apellido</th>
    <th colspan="3"><a id="recargar"  onmouseover="handleOverBotonRecargar();return true;" onmouseout="handleOutBotonRecargar();return true;"><img name="imgBotonRecargar" width="32" height="31" border="0" alt="editar" src="../images/botones/b_recargar_off.gif"/></a></th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    </table>
    <div id="pager" class="pager">
        <form>
        <img src="../images/botones/first.png" class="first" alt=""/>
        <img src="../images/botones/prev.png" class="prev" alt=""/>
        <input type="text" class="pagedisplay" size="1"/> 
        <img src="../images/botones/next.png" class="next" alt=""/>
        <img src="../images/botones/last.png" class="last" alt=""/>

        <img src="../images/botones/last.png" class="last" alt=""/>
        <select class="pagesize"> 
			<option selected="selected"  value="10">10</option> 
			<option value="20">20</option> 
			<option value="30">30</option> 
			<option  value="40">40</option> 
		</select> 
        
        </form>
    </div>
</div>

  <div id="formulario">
    <form id="frmregistro" onsubmit="IrRegistro($('#sostenedor').val(), false); return false;">
  	<h2>Registro a Nuevos Sostenedores:</h2>
    <div class="fondo">
        <p><label for="region">Regi&oacute;n:</label>
        <select name="region" id="region">
        <option value="1">Tarapacá</option>   
        <option value="2">Antofagasta</option>
        <option value="3">Atacama</option>    
        <option value="4">Coquimbo</option>   
        <option value="5">Valparaíso</option> 
        <option value="6">Libertador General Bernardo O'Higgins</option>
        <option value="7">Maule</option>      
        <option value="8">Biobío</option>     
        <option value="9">La Araucanía</option>
        <option value="10">Los Lagos</option>
        <option value="11">Aisén del General Carlos Ibáñez del Campo</option> 
        <option value="12">Magallanes y de la Antártica Chilena</option>      
        <option value="13">Región Metropolitana de Santiago</option>          
        <option value="14">De los Ríos</option>                              
        <option value="15">Arica Parinacota</option>                          
        </select>
        </p>
        <p><label for="comuna">Comuna:</label><select name="CODCOM" id="CODCOM"></select></p>
        <p><label for="dependencia">Dependencia:</label>
        <select name="dependencia" id="dependencia">
        <option value="1">Corporación Municipal</option>
        <option value="2">Departamento de Educación Municipal</option>
        <option value="3">Particular Subvencionado</option>
        <option value="4">Particular Pagado</option>
        <option value="5">Corporación Privada</option>
        </select>
        </p>
        <p><label for="sostenedor">Sostenedor:</label><select name="sostenedor" id="sostenedor"></select></p>
    </div>
    <p id="boton_inscribirse"><input type="submit" value="INSCRIBIRSE EN EL SISTEMA" /></p>
  </form>
  </div>
  </div>
</div>

<!--#include virtual="/include/footer.html"-->

</body>
</html>
