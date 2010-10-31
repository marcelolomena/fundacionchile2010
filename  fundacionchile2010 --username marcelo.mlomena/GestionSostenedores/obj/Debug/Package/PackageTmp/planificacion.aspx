<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planificacion.aspx.cs" Inherits="GestionSostenedores.planificacion" %>
<script id="planificacion" type="text/javascript">
        <%
            Response.Write("var codusu='" + Request["codusu"] + "';");
        %>
$(document).ready(function () {
        $("input:button, input:submit").button();

        var jsonStr = "{codusu:'" + codusu + "'}";
          $.ajax({
              type: "POST",
              url: "/planificacion.aspx/ObtenerPlanificacion",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  $("#mision").attr('value', objJson.planificacion[0]["MISION"]);
                  $("#vision").attr('value', objJson.planificacion[0]["VISION"]);
                  $("#objetivos").attr('value', objJson.planificacion[0]["OBJETIVOS"]);

              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });



        $("#frmPlanificacionNueva").validate({
            rules: {
            
                mision: {required: true},
                vision: {required: true},
                objetivos: {required: true}

            },
            messages: {
                mision: "ingrese un texto",
                vision: "ingrese un texto", 
                objetivos: "ingrese un texto"
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
                GuardarPlanificacion(codusu);
            }
        });
});
</script>
<form id="frmPlanificacionNueva">
   <div class="fondo_dimensionamiento">
       <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <th style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Misión</b></th>
            </tr>
         <tr>
            <td><textarea name="mision" id="mision" rows="10" cols="80"></textarea></td>
         </tr>

            <tr>
            <th style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Visión</b></th>
            </tr>
         <tr>
            <td><textarea name="vision" id="vision" rows="10" cols="80"></textarea></td>
         </tr>

            <tr>
            <th style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Objetivos</b></th>
            </tr>

         <tr>
            <td><textarea name="objetivos" id="objetivos" rows="10" cols="80"></textarea></td>
         </tr>
       </table>
    </div>
   
	<p style="text-align:center">
		   <input type="submit" value="ENVIAR" />
		   <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla7','#formulario7')" />
	</p>
</form>