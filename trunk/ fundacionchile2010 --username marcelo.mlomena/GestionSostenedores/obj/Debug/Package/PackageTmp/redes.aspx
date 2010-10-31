<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="redes.aspx.cs" Inherits="GestionSostenedores.redes" %>
<script id="redes" type="text/javascript">
        <%
            Response.Write("var codusu='" + Request["codusu"] + "';");
        %>
$(document).ready(function () {
    $("input:button, input:submit").button();

        var jsonStr = "{codusu:'" + codusu + "'}";
          $.ajax({
              type: "POST",
              url: "/redes.aspx/ObtenerRedes",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  //$("#redes").attr('value', objJson.redes[0]["REDES"]);

              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });

        $("#frmRedesNueva").validate({
            rules: {
            
                redes: {required: true}

            },
            messages: {
                redes: "ingrese un texto"
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
                GuardarRedes(codusu);
            }
        });

});
</script>
<form id="frmRedesNueva">
<div class="fondo_dimensionamiento">
    <table border="0" cellspacing="0" cellpadding="0">
                <tr>
            <th style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Redes</b></th>
            </tr>
      <tr>
  		<td><textarea id="redes" name="redes" rows="10" cols="80"></textarea></td>
      </tr>
    </table>
</div>
<p style="text-align:center">
   <input type="submit" value="ENVIAR" />
   <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla9','#formulario9')" />
</p>
</form>