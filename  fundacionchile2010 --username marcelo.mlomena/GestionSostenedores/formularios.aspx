<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formularios.aspx.cs" Inherits="GestionSostenedores.formularios" %>
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
<div id="internas">
  <div style="clear:both;">&nbsp;</div>
  <img src="images/pre-acceso.jpg" alt="Acceso" width="762" height="323" border="0" usemap="#Map" style="border:none; margin:0 20px 0 0; padding:0;" />
  <map name="Map" id="Map2">
    <area shape="rect" coords="315,17,457,78" href="acceso.aspx" alt="Acceso" />
  <area shape="rect" coords="102,90,244,153" href="acceso.aspx" alt="Acceso" />
  <area shape="rect" coords="314,115,458,173" href="acceso.aspx" alt="Acceso" />
  <area shape="rect" coords="517,91,660,149" href="acceso.aspx" alt="Acceso" /><area shape="rect" coords="140,177,282,238" href="acceso.aspx" alt="Acceso" />
  <area shape="rect" coords="315,226,454,290" href="acceso.aspx" alt="Acceso" />
  <area shape="rect" coords="487,175,635,238" href="acceso.aspx" alt="Acceso" />
  </map>
  <map name="Map" id="Map"><area shape="rect" coords="315,17,457,78" href="acceso.aspx" alt="Acceso" />
</map>
  <div style="clear:both;">&nbsp;</div>
  <!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>

<!--#include virtual="/include/footer.html"-->
</body>
</html>
