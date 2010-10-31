<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="GestionSostenedores.usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="husuarios" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n de Sostenedores</title>
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
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.functions.js" ></script>
<script id="usuario" type="text/javascript">
        <%
            Response.Write("var codins='" + Request["codins"] + "';");
            Response.Write("var codusu='" + Request["codusu"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>

    $(document).ready(function () {

        if(accion='edit'){

	        var jsonStr = "{codusu:'" + codusu + "'}";
	        $.ajax({
	            type: "POST",
	            url: "/usuario.aspx/ObtenerUsuario",
	            data: jsonStr,
	            contentType: "application/json",
	            dataType: "json",
	            timeout: 10000,
	            success: function (response) {
                    var objJson = JSON.parse(response.d);
                    if(objJson.usuario.length>0){
                          $("#nombre").attr('value', objJson.usuario[0]["NOMUSU"]);
                          $("#apellido").attr('value', objJson.usuario[0]["APEPAUSU"]);
                          $("#email").attr('value', objJson.usuario[0]["MAILUSU"]);
                    }
	            },
	            error: function (msg) {
	                //jAlert("intentelo mas tarde", "Error");
	            }
	        });

        }

        $("#frmusuario").validate({
            rules: {
                nombre: {required: true},
                apellido: {required: true},
                email: {required: true,email:true},
                clave_1: {required: true,minlength:4},
                clave_2: {required: true,minlength:4,equalTo:"#clave_1"}
            },
            messages: {
                nombre: "ingrese un nombre",
                apellido: "ingrese el apellido",
                email: "ingrese un e-mail",
                clave_1: {required:"ingrese una clave",minlength:"mínimo 4 caracteres"},
                clave_2: {required:"ingrese una clave",minlength:"mínimo 4 caracteres",equalTo:"debe ser la misma ingresada arriba"}
            },
            errorElement: "div",
            wrapper: "div",  // a wrapper around the error message
            errorPlacement: function(error, element) {
                offset = element.offset();
                error.insertBefore(element);
                error.addClass('message');  // add a class to the wrapper
                error.css('position', 'absolute');
                error.css('left', offset.left + element.outerWidth());
                error.css('top', offset.top);
            },
            submitHandler: function (form) {
                GuardarUsuario(codins);
            }
        });
    });
</script>
</head>
<body>

<div id="internas" style="padding:5px;">
<div id="dialog" title="Advertencia">
</div>
  <h1><strong>Agregar un nuevo usuario</strong></h1>
  <form id="frmusuario">
    <div class="fondo_formularios">
      <p>Ingrese todos los campos: </p>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th>Actor</th>
          <td><select name="actor" id="actor">
              <option value="1">Alumno</option>
              <option value="2">Apoderado</option>
              <option value="3">Asistente</option>
              <option value="4">Director</option>
              <option value="5">Docente</option>
              <option value="6">Jefe técnico</option>
              <option value="7">Sostenedor</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>Nombre</th>
          <td><input name="nombre" type="text" id="nombre" size="50" /></td>
        </tr>
        <tr>
          <th>Apellido</th>
          <td><input name="apellido" type="text" id="apellido" size="50" /></td>
        </tr>
        <tr>
          <th>e-mail</th>
          <td><input name="email" type="text" id="email" size="50" /></td>
        </tr>
        <tr>
          <th>Clave</th>
          <td><input name="clave_1" type="password" id="clave_1" size="20" /></td>
        </tr>
        <tr>
          <th>Repetir Clave</th>
          <td><input name="clave_2" type="password" id="clave_2" size="20" /></td>
        </tr>
      </table>
      </div>
      <div class="bottom_formularios"></div>
    
    <p id="boton_enviar" style="text-align:center"><input type="submit" value="ENVIAR" /></p>

  </form>

 <div style="clear:both;">&nbsp;</div>

  <div style="clear:both;">&nbsp;</div>
</div>


</body>
</html>

