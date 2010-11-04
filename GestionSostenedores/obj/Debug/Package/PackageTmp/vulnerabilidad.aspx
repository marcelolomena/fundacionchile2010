<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vulnerabilidad.aspx.cs" Inherits="GestionSostenedores.vulnerabilidad" %>
<script id="vulnerabilidad" type="text/javascript">
//<![CDATA[
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
              url: "/vulnerabilidad.aspx/ObtenerVulnerabilidad",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  if(objJson.vulnerabilidad.length>0){
                      $("#VULNERABILIDAD_ALUMNOUPRIORITARIO").attr('value', objJson.vulnerabilidad[0]["VULNERABILIDAD_ALUMNOUPRIORITARIO"]);
                      $("#VULNERABILIDAD_INDICEVULNERABILIDAD").attr('value', objJson.vulnerabilidad[0]["VULNERABILIDAD_INDICEVULNERABILIDAD"]);
                  }
              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });
        }

        $("#frmVulnerabilidadNueva").validate({
            rules: {
            
                VULNERABILIDAD_ALUMNOUPRIORITARIO: {required: true, number:true},
                VULNERABILIDAD_INDICEVULNERABILIDAD: {required: true, number:true}

            },
            messages: {
                VULNERABILIDAD_ALUMNOUPRIORITARIO: "ingrese un número",
                VULNERABILIDAD_INDICEVULNERABILIDAD: "ingrese un número", 
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
                GuardarVulnerabilidad(codest);
            }
        });

    });
//]]> 
</script>
<form id="frmVulnerabilidadNueva">
    <div class="fondo_dimensionamiento">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <th colspan="2" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Vulnerabilidad</b></th>
            </tr>
            <tr>
                <td>Total Alumnos Prioritarios a la fecha</td>
                <td><input type="text" name="VULNERABILIDAD_ALUMNOUPRIORITARIO" id="VULNERABILIDAD_ALUMNOUPRIORITARIO" size="3" value=""/></td>
             </tr>
             <tr>   
                <td>Índice de vulnerabilidad</td>
                <td><input type="text" name="VULNERABILIDAD_INDICEVULNERABILIDAD" id="VULNERABILIDAD_INDICEVULNERABILIDAD" size="3" value=""/></td>
            </tr>
        </table>
     </div>

     <p style="text-align:center">
        <input type="submit" value="ENVIAR" />
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla4','#formulario4')" />
     </p>
</form>
