<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="infraestructura.aspx.cs" Inherits="GestionSostenedores.infraestructura" %>
<script id="demo" type="text/javascript">
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
              url: "/infraestructura.aspx/ObtenerInfraestructura",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                    if(objJson.infraestructura.length>0){
                      $("#INFRAESTRUCTURA_SUPERFICIE_TOTAL").attr('value', objJson.infraestructura[0]["INFRAESTRUCTURA_SUPERFICIE_TOTAL"]);
                      $("#INFRAESTRUCTURA_SALAS_TOTAL").attr('value', objJson.infraestructura[0]["INFRAESTRUCTURA_SALAS_TOTAL"]);
                      $("#INFRAESTRUCTURA_SUPERFICIE_UTIL").attr('value', objJson.infraestructura[0]["INFRAESTRUCTURA_SUPERFICIE_UTIL"]);
                      $("#INFRAESTRUCTURA_SALAS_UTIL").attr('value', objJson.infraestructura[0]["INFRAESTRUCTURA_SALAS_UTIL"]);

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_LABORATORIO_CIENCIA"]=="0"){
                       $("#INFRAESTRUCTURA_LABORATORIO_CIENCIA option[value='0']").attr('selected','selected');
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_LABORATORIO_CIENCIA"]=="1"){
                       $("#INFRAESTRUCTURA_LABORATORIO_CIENCIA option[value='1']").attr('selected','selected');
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_LABORATORIO_COMPUTACION"]=="0"){
                       $("#INFRAESTRUCTURA_LABORATORIO_COMPUTACION option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_LABORATORIO_COMPUTACION"]=="1"){
                       $("#INFRAESTRUCTURA_LABORATORIO_COMPUTACION option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_SALA_PROFESORES"]=="0"){
                       $("#INFRAESTRUCTURA_SALA_PROFESORES option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_SALA_PROFESORES"]=="1"){
                       $("#INFRAESTRUCTURA_SALA_PROFESORES option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_GIMNACIO"]=="0"){
                       $("#INFRAESTRUCTURA_GIMNACIO option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_GIMNACIO"]=="1"){
                       $("#INFRAESTRUCTURA_GIMNACIO option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_MULTICANCHA"]=="0"){
                       $("#INFRAESTRUCTURA_MULTICANCHA option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_MULTICANCHA"]=="1"){
                       $("#INFRAESTRUCTURA_MULTICANCHA option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_IMPLEMENTOS"]=="0"){
                       $("#INFRAESTRUCTURA_IMPLEMENTOS option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_IMPLEMENTOS"]=="1"){
                       $("#INFRAESTRUCTURA_IMPLEMENTOS option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_CASINO"]=="0"){
                       $("#INFRAESTRUCTURA_CASINO option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_CASINO"]=="1"){
                       $("#INFRAESTRUCTURA_CASINO option[value='1']").attr('selected',true);
                      }

                      if(objJson.infraestructura[0]["INFRAESTRUCTURA_QUIOSCO"]=="0"){
                       $("#INFRAESTRUCTURA_QUIOSCO option[value='0']").attr('selected',true);
                      } else if(objJson.infraestructura[0]["INFRAESTRUCTURA_QUIOSCO"]=="1"){
                       $("#INFRAESTRUCTURA_QUIOSCO option[value='1']").attr('selected',true);
                      }
                  }

              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });
        }

        $("#frmInfraestructuraNueva").validate({
            rules: {
            
                INFRAESTRUCTURA_SUPERFICIE_UTIL: {required: true, number:true},
                INFRAESTRUCTURA_SUPERFICIE_TOTAL: {required: true, number:true},
                INFRAESTRUCTURA_SALAS_UTIL: {required: true, number:true},
                INFRAESTRUCTURA_SALAS_TOTAL: {required: true, number:true}

            },
            messages: {
                INFRAESTRUCTURA_SUPERFICIE_UTIL: "ingrese un número",
                INFRAESTRUCTURA_SUPERFICIE_TOTAL: "ingrese un número", 
                INFRAESTRUCTURA_SALAS_UTIL: "ingrese un número",
                INFRAESTRUCTURA_SALAS_TOTAL: "ingrese un número"
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
                GuardarInfraestructura(codest);
            }
        });

    });
//]]> 
</script>
<form id="frmInfraestructuraNueva">
    <div class="fondo_dimensionamiento">

        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <th colspan="6" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Infraestructura del establecimiento</b></th>
            </tr>
            <tr>
                <th>Superficie m<sup>2</sup> útiles</th>
                <td><input type="text" name="INFRAESTRUCTURA_SUPERFICIE_UTIL" id="INFRAESTRUCTURA_SUPERFICIE_UTIL" size="3" value=""/></td>
                
                <th>Superficie m<sup>2</sup> totales</th>
                <td><input type="text" name="INFRAESTRUCTURA_SUPERFICIE_TOTAL" id="INFRAESTRUCTURA_SUPERFICIE_TOTAL" size="3" value=""/></td>
                
            </tr>
            <tr>
                <th>Cantidad de Salas utilizadas</th>
                <td><input type="text" name="INFRAESTRUCTURA_SALAS_UTIL" id="INFRAESTRUCTURA_SALAS_UTIL" size="3" value=""/></td>
                
                <th>Cantidad de Salas Total</th>
                <td><input type="text" name="INFRAESTRUCTURA_SALAS_TOTAL" id="INFRAESTRUCTURA_SALAS_TOTAL" size="3" value=""/></td>
                
            </tr>
            <tr>

                <th >Salas de Profesores</th>
                <td>
                <select name="INFRAESTRUCTURA_SALA_PROFESORES" id="INFRAESTRUCTURA_SALA_PROFESORES">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select>
                </td>
                
                <th>Laboratorio Ciencias</th>
                <td>
                <select name="INFRAESTRUCTURA_LABORATORIO_CIENCIA" id="INFRAESTRUCTURA_LABORATORIO_CIENCIA">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select>
                </td>
                
            </tr>
            <tr>
                <th>Laboratorio Computaci&oacute;n</th>
                <td>
                <select name="INFRAESTRUCTURA_LABORATORIO_COMPUTACION" id="INFRAESTRUCTURA_LABORATORIO_COMPUTACION">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select>
                </td>
                
                <th>Gimnasio</th>
                <td><select name="INFRAESTRUCTURA_GIMNACIO" id="INFRAESTRUCTURA_GIMNACIO">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select>
                </td>
                
            </tr>
            <tr>
                <th>Multicancha</th>
                <td><select name="INFRAESTRUCTURA_MULTICANCHA" id="INFRAESTRUCTURA_MULTICANCHA">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select></td>
                
                <th>Implementos suficientes</th>
                <td><select name="INFRAESTRUCTURA_IMPLEMENTOS" id="INFRAESTRUCTURA_IMPLEMENTOS">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select></td>
                
          </tr>
            <tr>
                <th>Casino</th>
                <td><select name="INFRAESTRUCTURA_CASINO" id="INFRAESTRUCTURA_CASINO">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select></td>
                
                <th>Quiosco</th>
                <td><select name="INFRAESTRUCTURA_QUIOSCO" id="INFRAESTRUCTURA_QUIOSCO">
                  <option value="0">No</option>
                  <option value="1">S&iacute;</option>
                </select></td>
                
            </tr>
        </table>
     </div>

     <p style="text-align:center">
        <input type="submit" value="ENVIAR" />
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla12','#formulario12')" />
     </p>
</form>