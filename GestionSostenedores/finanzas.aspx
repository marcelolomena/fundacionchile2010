<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finanzas.aspx.cs" Inherits="GestionSostenedores.finanzas" %>
<script id="finanzas" type="text/javascript">
//<![CDATA[
        <%
            Response.Write("var codusu='" + Request["codusu"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>
    $(document).ready(function () {
        $("input:button, input:submit").button();
        if(accion=='edit'){

         var jsonStr = "{codusu:'" + codusu + "'}";

          $.ajax({
              type: "POST",
              url: "/finanzas.aspx/ObtenerFinanzas",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);

                  $("#FINANZAS_PRESUPUESTO").attr('value', objJson.finanzas[0]["FINANZAS_PRESUPUESTO"]);
                  $("#FINANZAS_SEP").attr('value', objJson.finanzas[0]["FINANZAS_SEP"]);
                  $("#FINANZAS_FONDOMEJORAMIENTO").attr('value', objJson.finanzas[0]["FINANZAS_FONDOMEJORAMIENTO"]);
                  $("#FINANZAS_COSTOALUMNO").attr('value', objJson.finanzas[0]["FINANZAS_COSTOALUMNO"]);
                  $("#FINANZAS_ALUMNOBECADO").attr('value', objJson.finanzas[0]["FINANZAS_ALUMNOBECADO"]);
                  $("#FINANZAS_OTROINGRESO").attr('value', objJson.finanzas[0]["FINANZAS_OTROINGRESO"]);

              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });
        }

        $("#frmFinanzasNueva").validate({
            rules: {
            
                FINANZAS_PRESUPUESTO: {required: true, number:true},
                FINANZAS_SEP: {required: true, number:true}, 
                FINANZAS_FONDOMEJORAMIENTO: {required: true, number:true},
                FINANZAS_COSTOALUMNO: {required: true, number:true},  
                FINANZAS_ALUMNOBECADO: {required: true, number:true},
                FINANZAS_OTROINGRESO: {required: true, number:true}  

            },
            messages: {
                FINANZAS_PRESUPUESTO: "ingrese un número",
                FINANZAS_SEP: "ingrese un número", 
                FINANZAS_FONDOMEJORAMIENTO: "ingrese un número",
                FINANZAS_COSTOALUMNO: "ingrese un número",  
                FINANZAS_ALUMNOBECADO: "ingrese un número",
                FINANZAS_OTROINGRESO: "ingrese un número"
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
                GuardarFinanzas(codusu);
            }
        });

    });
//]]> 
</script>


<form id="frmFinanzasNueva">
    <div class="fondo_dimensionamiento">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Finanzas Institución Sostenedora</b></th>
            </tr>
            <tr>
                <th>Presupuesto Anual</th>
                <td><input type="text" name="FINANZAS_PRESUPUESTO" id="FINANZAS_PRESUPUESTO" size="3" value=""/></td>
                
                <th>SEP</th>
                <td><input type="text" name="FINANZAS_SEP" id="FINANZAS_SEP" size="3" value=""/></td>
                
            </tr>
            <tr>
                <th>Fondo Mejoramiento</th>
                <td><input type="text" name="FINANZAS_FONDOMEJORAMIENTO" id="FINANZAS_FONDOMEJORAMIENTO" size="3" value=""/></td>
                
                <th>Costo por alumno</th>
                <td><input type="text" name="FINANZAS_COSTOALUMNO" id="FINANZAS_COSTOALUMNO" size="3" value=""/></td>
                
            </tr>
            <tr>
                <th>Alumnos becados</th>
                <td><input type="text" name="FINANZAS_ALUMNOBECADO" id="FINANZAS_ALUMNOBECADO" size="3" value=""/></td>
                
                <th>Otros Ingresos</th>
                <td><input type="text" name="FINANZAS_OTROINGRESO" id="FINANZAS_OTROINGRESO" size="3" value=""/></td>
                
            </tr>
        </table>
     </div>
     <p style="text-align:center">
        <input type="submit" value="ENVIAR" />
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla6','#formulario6')" />
     </p>
</form>