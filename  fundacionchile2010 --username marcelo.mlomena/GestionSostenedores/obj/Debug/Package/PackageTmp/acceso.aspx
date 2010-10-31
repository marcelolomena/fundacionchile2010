<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acceso.aspx.cs" Inherits="GestionSostenedores.acceso" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n Escolar de Calidad</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<!-- jAlert files -->
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.alerts.js" ></script>
<script type="text/javascript" src="Scripts/jquery.functions.js" ></script>
	<script type="text/javascript">
	    $(document).ready(function () {

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

            $("#formulario").validate({
                rules: {
                    email: {required: true, email:true},
                    password: {required: true}

                },
                messages: {
                    email: "ingrese un e-mail",
                    password: "ingrese su clave", 
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
                    ValidaIngreso();
                }
            });
	    });
</script>
</head>

<body>
<uc1:encabezado ID="cabecita" runat="server"/>

<div id="registro">
  <h1><strong>Se&ntilde;or(a) Sostenedor(a) </strong><br />
  Bienvenido/a al sistema de mejoramiento continuo</h1>
  <form id="formulario">
      <div id="col_01">
  	    <h2>Acceso a Sostenedores Registrados:</h2>
  	    <div class="fondo">
            <p><label for="email">email:</label><input id="email" name="email" type="text" /><br/></p><br/>
            <p><label for="password">Contrase&ntilde;a:</label><input name="password" id="password" type="password" maxlength="20"/><br/><span><strong><a href="#">&iquest;Olvid&oacute; la clave?</a></strong></span></p>
        </div>
  	    <p id="boton_ingresar"><input type="submit" class="button" value="INGRESAR" /></p>
      </div>
  </form>
  
</div>

<!--#include virtual="/include/footer.html"-->

</body>
</html>
