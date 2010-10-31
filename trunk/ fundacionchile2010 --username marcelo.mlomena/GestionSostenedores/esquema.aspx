<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="esquema.aspx.cs" Inherits="GestionSostenedores.esquema" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n de Sostenedores</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/modal.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.mouse.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.draggable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.resizable.min.js"></script>
<script type="text/javascript" src="Scripts/highcharts.js"></script>
<script type="text/javascript" src="Scripts/graficos.js"></script>
<script type="text/javascript" src="Scripts/jquery.alerts.js"></script>
<script type="text/javascript" src="Scripts/json2.min.js"></script>
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/alerta.js"></script>
<script type="text/javascript" src="Scripts/jsPopup.js"></script>
<script type="text/javascript">
        <%
            Response.Write("var codper='" + Session["codper"] + "';");
            Response.Write("var codins='" + Session["codins"] + "';");
        %>
</script>

  <script type="text/javascript">

      $(document).ready(function () {

          var chart;
          MostrarAlerta("grafico", 10, 600, 450, "#portada");
          ReporteInscritos(codins,"A", "divgraficoForm");

          var ancho = 600;
          var alto = 250;

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
          $(document).mousemove(function (e) {
              $('#loading').css({ left: e.pageX + 10, top: e.pageY + 15 });
          });

          $(window).resize(function () {
              // dimensiones de la ventana del explorer 
              var wscr = $(window).width();
              var hscr = $(window).height();

              // estableciendo dimensiones de fondo
              $('#bgtransparent').css("width", wscr);
              $('#bgtransparent').css("height", hscr);

              // estableciendo tamaño de la ventana modal
              $('#bgmodal').css("width", ancho + 'px');
              $('#bgmodal').css("height", alto + 'px');

              // obtiendo tamaño de la ventana modal
              var wcnt = $('#bgmodal').width();
              var hcnt = $('#bgmodal').height();

              // obtener posicion central
              var mleft = (wscr - wcnt) / 2;
              var mtop = (hscr - hcnt) / 2;

              // estableciendo ventana modal en el centro
              $('#bgmodal').css("left", mleft + 'px');
              $('#bgmodal').css("top", mtop + 'px');
          });

      });

      function modal() {

          var contenidoHTML = '<div class=\"fondo_forma\"><p>Escoger la forma</p><button onclick=\"formaA()\">Forma A</button><button onclick=\"formaB()\">Forma B</button></div>';

          // fondo transparente
          // creamos un div nuevo, con dos atributos
          var bgdiv = $('<div>').attr({
              className: 'bgtransparent',
              id: 'bgtransparent'
          });

          // agregamos nuevo div a la pagina
          $('body').append(bgdiv);

          // obtenemos ancho y alto de la ventana del explorer
          var wscr = $(window).width();
          var hscr = $(window).height();

          //establecemos las dimensiones del fondo
          $('#bgtransparent').css("width", wscr);
          $('#bgtransparent').css("height", hscr);

          // ventana modal
          // creamos otro div para la ventana modal y dos atributos
          var moddiv = $('<div>').attr({
              className: 'bgmodal',
              id: 'bgmodal'
          });

          // agregamos div a la pagina
          $('body').append(moddiv);

          // agregamos contenido HTML a la ventana modal
          $('#bgmodal').append(contenidoHTML);

          // redimensionamos para que se ajuste al centro y mas
          $(window).resize();

      }


      function ValidaEstado() {
          // Eventos globales
          $('#loading').bind('ajaxStart', function () {
              $(this).show();
          }).bind('ajaxStop', function () {
              $(this).hide();
          });

          var jsonStr = "{}";
          var estado = "";

          $.ajax({
              type: "POST",
              url: "/esquema.aspx/ValidaEstado",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  estado = objJson[0]["ESTADO"];
                  
                  if (estado == "P") {
                      modal();

                  } else if (estado == "I") {
                      url = "cuestionario.aspx";
                      $(location).attr('href', url);
                  } else if (estado == "F") {
                      //alert(estado);
                      jAlert("Usted ya respondio todos los instrumentos disponibles", "Finalizado");
                  }


              }, /*success*/
              error: function (msg) {
                  jAlert("intentelo mas tarde", "Error");
              },
              complete: function (objeto, exito) {

              }
          });     // end $.ajax

      }

      function ActualizaForma(codfor) {
          // Eventos globales
          $('#loading').bind('ajaxStart', function () {
              $(this).show();
          }).bind('ajaxStop', function () {
              $(this).hide();
          });

         var jsonStr = "{codfor:'" + codfor + "'}";
          var estado="";

          $.ajax({
              type: "POST",
              url: "/esquema.aspx/ActualizaForma",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  var url = "cuestionario.aspx";
                  $(location).attr('href', url);

              }, /*success*/
              error: function (msg) {
                  jAlert("intentelo mas tarde", "Error");
              },
              complete: function (objeto, exito) {

              }
          });

          return estado;
      }

    function irPagina(id){
                  if (id == 2) {
                      ValidaEstado();
                  } else if (id == 1) {
                      if (codper != 7) { jAlert("usted no es sostenedor"); } else { verPagina2("dimensionamiento.aspx"); }
                  }
    }

    function formaA(){
            // removemos divs creados
            $('#bgmodal').remove();
            $('#bgtransparent').remove();
            ActualizaForma('A');
    }

    function formaB(){
            // removemos divs creados
            $('#bgmodal').remove();
            $('#bgtransparent').remove();
            ActualizaForma('B');
    }

  </script>
</head>

<body>

<uc1:encabezado ID="cabecita" runat="server"/>
<div id="portada">
<div id="dialog" title="Advertencia"/>
<p><img src="images/ciclo-mejoramiento.jpg" alt="Ciclo de Mejoramiento" width="762" height="323" border="0" usemap="#Map" style="border:none; margin:0 20px 0 0; padding:0;" />
<map name="Map" id="Map">
<area shape="circle" coords="107,111,73" href="javascript:irPagina(1);" alt="Dimensionamiento" id="1"/>
<area shape="circle" coords="234,212,73" href="javascript:irPagina(2);" alt="Cuestionario Sostenedores" id="2"/>
</map></p>
  <div style="clear:both;"></div>
  <div style="clear:both;">&nbsp;</div>
  <!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>

<!--#include virtual="/include/footer.html"-->

</body>
</html>
