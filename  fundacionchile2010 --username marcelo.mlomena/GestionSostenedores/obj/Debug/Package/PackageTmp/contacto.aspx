<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="GestionSostenedores.contacto" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n Escolar de Calidad</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/funciones.js"></script>
</head>
<body>
<uc1:encabezado ID="cabecita" runat="server"/>
<div id="internas" style="padding:5px;">
  <h1><strong>Cuestionario Alumnos Dimensionado</strong></h1>
  <form id="contacto" method="post" action="formmail.php" onsubmit="return valida_contacto(this);">
    <!--input type="hidden" name="recipient" value="jmosquera_2_no_spam_hotmail.com"-->
    <input type="hidden" name="recipient" value="diegodiazplaza_no_spam_gmail.com">
    <input type="hidden" name="redirect" value="contacto_gracias.php">
    <input type="hidden" name="subject" value="Formulario de Contacto">
    <input type="hidden" name="html_file" value="mailing/contacto.html">
    <div class="fondo_formularios">
      <p>Llene el siguiente formulario de contacto y responderemos a sus inquetuedea a la brevedad posible: </p>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th>* Motivo :</th>
          <td><select name="motivo" id="motivo">
              <option value="0">Seleccione un motivo de contacto</option>
              <option value="Consulta">Consulta</option>
              <option value="Cotizaci&oacute;n">Cotizaci&oacute;n</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>* Nombre :</th>
          <td><input name="nombre" type="text" id="nombre" size="50" /></td>
        </tr>
        <tr>
          <th>* Apellido :</th>
          <td><input name="apellido" type="text" id="apellido" size="50" /></td>
        </tr>
        <tr>
          <th>Direcci&oacute;n :</th>
          <td><input name="direccion" type="text" id="direccion" size="50" /></td>
        </tr>
        <tr>
          <th>Tel&eacute;fono :</th>
          <td><input name="fono" type="text" id="fono" size="20" /></td>
        </tr>
        <tr>
          <th>* e-mail :</th>
          <td><input name="mail" type="text" id="mail" size="50" /></td>
        </tr>
        <tr>
          <th>Empresa :</th>
          <td><input name="empresa" type="text" id="empresa" size="50" /></td>
        </tr>
        <tr>
          <th>* Mensaje :</th>
          <td><textarea name="mensaje" cols="50" rows="5" id="mensaje"></textarea></td>
        </tr>
      </table>
      </div>
      <div class="bottom_formularios"></div>
    
    <p id="boton_enviar" style="text-align:center"><input type="submit" value="ENVIAR" /></p>
    
    
  </form>

 <div style="clear:both;">&nbsp;</div>
<!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>

<!--#include virtual="/include/footer.html"-->

</body>
</html>

