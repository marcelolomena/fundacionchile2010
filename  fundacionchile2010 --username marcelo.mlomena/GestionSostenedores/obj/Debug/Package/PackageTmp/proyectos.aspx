<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proyectos.aspx.cs" Inherits="GestionSostenedores.proyectos" %>
<script id="planificacion" type="text/javascript">
        <%
            Response.Write("var codest='" + Request["codest"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>
$(document).ready(function () {
        $("input:button, input:submit").button();
        if(accion=='edit'){
        var jsonStr = "{codest:'" + codest + "'}";
          $.ajax({
              type: "POST",
              url: "/proyectos.aspx/ObtenerProyectos",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  if(objJson.proyectos.length>0){
                    $("#proyecto").attr('value', objJson.proyectos[0]["PROYECTOS_INNOVADORES"]);
                  }
              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });
          }


        $("#frmProyectosNueva").validate({
            rules: {
                mision: {required: true}
            },
            messages: {
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
                GuardarProyectos(codest);
            }
        });
});
</script>
<form id="frmProyectosNueva">
<div class="fondo_dimensionamiento">
   <table border="0" cellspacing="0" cellpadding="0">
               <tr>
            <th style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Proyectos Innovadores</b></th>
            </tr>
    <tr>
	 		<td><textarea id="proyecto" name="proyecto" rows="10" cols="80"></textarea></td>
    </tr>
   </table>
</div>
<p style="text-align:center">
   <input type="submit" value="ENVIAR" />
   <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla8','#formulario8')" />
</p>
</form>