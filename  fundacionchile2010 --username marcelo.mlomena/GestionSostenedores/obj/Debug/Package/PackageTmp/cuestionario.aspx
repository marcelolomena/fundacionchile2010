<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuestionario.aspx.cs" Inherits="GestionSostenedores.cuestionario_alumnos" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n de Sostenedores</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />

<!-- Confirm CSS files -->
<link href='css/confirm.css' rel='stylesheet' type='text/css' media='screen' />
<!-- jAlert files -->

<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css"/>
<!-- CustomLightBox -->

<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.form.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type='text/javascript' src='Scripts/jquery.simplemodal.js'></script>
<script type='text/javascript' src='Scripts/confirm.js'></script>
<script type="text/javascript" src="Scripts/jquery.alerts.js" ></script>
<script type="text/javascript" src="Scripts/instrumento.js" ></script>

  <script type="text/javascript">

    <%
        Response.Write("var codfor='" + Session["codfor"] +  "';\n" );  
    %>

      $(document).ready(function () {
                var inst="";
              // Insertamos la imagen
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

              if(codfor=="A"){
                  inst="<p>Este cuestionario está estructurado en dos secciones principales (A) y (B). Ambas partes se componen de distintos ítems expresados como afirmaciones. Se espera que usted responda conforme a su grado o nivel de acuerdo con estas afirmaciones. Al estar seguro de la alternativa que mejor lo representa, debe marcar con una “X” en el casillero que corresponda.</p><p>En la primera parte (A) se busca conocer y evaluar el grado de satisfacción, participación y conocimiento que usted tiene frente al rol institucional del equipo que conforma la figura del sostenedor y en relación a diversas temáticas organizacionales que son propias de la gestión de este.</p><p>Para ello, encontrará casilleros de respuesta que dan cuenta de una escala de evaluación del 1 (mínimo) al 7 (máximo). En caso de no tener información respecto del ítem consultado, no dude en marcar la alternativa N/A (No Aplica), para efectos de este estudio constituye un dato relevante.</p>";
                 
              } else if(codfor=="B"){
                    inst="<p>En esta segunda parte (B) solicitamos su opinión y el nivel de acuerdo que tiene con las afirmaciones que a continuación se plantean en relación a los distintos sistemas de gestión instalados. Es posible que usted encuentre afirmaciones similares a las de la primera parte, sin embargo considere que la intención de esta sección es distinta.</p><p>Para ello, debe marcar el casillero que corresponde a su opinión de acuerdo a la escala siguiente:</p>0 = No se observa instalado<p>1 = Se observa esporádicamente</p><p>2 = Se observa frecuentemente</p><p>3 = Se observa totalmente instalado</p><p>N/S = No sabe (No dispone de información para responder).</p>";
              }
              $("#instrucciones").html(inst).fadeIn('fast');
 
              ObtenerInstrumento();
        });

            function ObtenerInstrumento() {
                // Eventos globales
                $('#loading').bind('ajaxStart', function () {
                    $(this).show();
                }).bind('ajaxStop', function () {
                    $(this).hide();
                });

                var jsonStr = "{codfor:'" + codfor  + "'}";

                $.ajax({
                    type: "POST",
                    url: "/cuestionario.aspx/ObtenerInstrumento",
                    data: jsonStr,
                    contentType: "application/json",
                    dataType: "json",
                    timeout: 10000,
                    success: function (response) {
                        var objJson = JSON.parse(response.d);
                        llenar(objJson,codfor);
                    },/*success*/
                    error: function (msg) {
                        jAlert("intentelo mas tarde","Error");
                    },
                    complete: function(objeto, exito){
                    }
                });
            }

        function GuardarInstrumento() {
                // Eventos globales
                $('#loading').bind('ajaxStart', function () {
                    $(this).show();
                }).bind('ajaxStop', function () {
                    $(this).hide();
                });

                var params = $('form[id$=formulario]').serialize();
                var jsonStr = "{qs:'" + params + "',codfor:'" + codfor + "'}";

                $.ajax({
                    type: "POST",
                    url: "/cuestionario.aspx/GuardarInstrumento",
                    data: jsonStr,
                    contentType: "application/json",
                    dataType: "json",
                    timeout: 10000,
                    success: function (response) {
                        var objJson = JSON.parse(response.d);
                        llenar(objJson,codfor);

                    },
                    error: function (msg) {
                        jAlert("intentelo mas tarde","Error");
                    }
                });
       }

</script>

</head>

<body>
<div id="container">
<uc1:encabezado ID="cabecita" runat="server"/>

<div id="internas">
  <h1><strong>Instrumento Piloto de Autoevaluación Gestión Sostenedores
Fuente: <div id="rol"></div></strong></h1>
  <p>Una organizaci&oacute;n que desea  progresar, debe conocer sus fortalezas y debilidades, para reafirmar las  primeras y superar gradualmente las &uacute;ltimas.</p>
  <p>La finalidad del presente  cuestionario es facilitar el auto conocimiento de su gesti&oacute;n, recogiendo su  opini&oacute;n y recogiendo las opiniones de la comunidad educativa, de modo de  generar informaci&oacute;n que facilite la elaboraci&oacute;n de planes de mejoramiento, que  permitan optimizar la calidad de la gesti&oacute;n y de la educaci&oacute;n que est&aacute;  proporcionando. </p>
  <p>El trabajo que le solicitamos  al responder este cuestionario es muy importante para esta instituci&oacute;n, ya que  s&oacute;lo usted puede comunicar lo que piensa y siente de ella.</p>
  <p>El cuestionario es an&oacute;nimo. Le  solicitamos que no se reste a esta iniciativa y que responda la totalidad del  instrumento. En este cuestionario no hay respuestas correctas ni incorrectas;  se trata de obtener su opini&oacute;n sincera y responsable.</p>
  <h3><strong>INSTRUCCIONES:</strong></h3>
  <div id="instrucciones"></div>
  <form id="formulario">
    
 <div id="bloques">   
    </div>

    <div class="bottom_formularios">&nbsp;</div>
    <div id='confirm-dialog'>
    <p id="boton_enviar" style="text-align:center"><input id="btnEnviar" name="confirm" class="confirm" type="button" value="GUARDAR" /></p>
    </div>
    
  </form>

 <div style="clear:both;">&nbsp;</div>
  <!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>

        <!-- modal content -->
		<div id='confirm'>
			<div class='header'><span>Confirmaci&oacute;n</span></div>
			<div class='message'></div>
			<div class='buttons'>
				<div class='no simplemodal-close'>No</div><div class='yes'>Yes</div>
			</div>
		</div>
		<!-- preload the images -->
		<div style='display:none'>
			<img src='images/confirm/header.gif' alt='' />
			<img src='images/confirm/button.gif' alt='' />
		</div>


<!--#include virtual="/include/footer.html"-->
</div>
</body>

</html>
