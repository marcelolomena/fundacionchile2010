<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eficiencia.aspx.cs" Inherits="GestionSostenedores.eficiencia" %>
<script id="eficiencia" type="text/javascript">
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
              url: "/eficiencia.aspx/ObtenerEficiencia",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  $.each(objJson.repitencia, function(i,rep){
                    $("#repitencia_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.retiro, function(i,rep){
                    $("#retiro_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.baja, function(i,rep){
                    $("#baja_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.aprobacion, function(i,rep){
                    $("#aprobacion_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.asistencia, function(i,rep){
                    $("#asistencia_200" + (i+5) ).attr('value', rep.TOTAL);
                  });
                  $.each(objJson.egresotp, function(i,rep){
                    $("#egresotp_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.inserciontp, function(i,rep){
                    $("#inserciontp_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.egreso, function(i,rep){
                    $("#egreso_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.ingresoeducacionsuperior, function(i,rep){
                    $("#ingresoeducacionsuperior_200" + (i+5) ).attr('value', rep.TOTAL);
                  });

                  $.each(objJson.postulante, function(i,rep){
                    $("#postulante_200" + (i+5) ).attr('value', rep.TOTAL);
                  });


              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });
        }



        $("#frmEficienciaNueva").validate({
            rules: {
            
                repitencia_2005: {required: true, number:true},
                repitencia_2006: {required: true, number:true}, 
                repitencia_2007: {required: true, number:true},
                repitencia_2008: {required: true, number:true},  
                repitencia_2009: {required: true, number:true},

                retiro_2005: {required: true, number:true},
                retiro_2006: {required: true, number:true}, 
                retiro_2007: {required: true, number:true},
                retiro_2008: {required: true, number:true},  
                retiro_2009: {required: true, number:true},

                baja_2005: {required: true, number:true},
                baja_2006: {required: true, number:true}, 
                baja_2007: {required: true, number:true},
                baja_2008: {required: true, number:true},  
                baja_2009: {required: true, number:true},

                aprobacion_2005: {required: true, number:true},
                aprobacion_2006: {required: true, number:true}, 
                aprobacion_2007: {required: true, number:true},
                aprobacion_2008: {required: true, number:true},  
                aprobacion_2009: {required: true, number:true},

                asistencia_2005: {required: true, number:true},
                asistencia_2006: {required: true, number:true}, 
                asistencia_2007: {required: true, number:true},
                asistencia_2008: {required: true, number:true},  
                asistencia_2009: {required: true, number:true},

                egresotp_2005: {required: true, number:true},
                egresotp_2006: {required: true, number:true}, 
                egresotp_2007: {required: true, number:true},
                egresotp_2008: {required: true, number:true},  
                egresotp_2009: {required: true, number:true},


                inserciontp_2005: {required: true, number:true},
                inserciontp_2006: {required: true, number:true}, 
                inserciontp_2007: {required: true, number:true},
                inserciontp_2008: {required: true, number:true},  
                inserciontp_2009: {required: true, number:true},

                egreso_2005: {required: true, number:true},
                egreso_2006: {required: true, number:true}, 
                egreso_2007: {required: true, number:true},
                egreso_2008: {required: true, number:true},  
                egreso_2009: {required: true, number:true},

                ingresoeducacionsuperior_2005: {required: true, number:true},
                ingresoeducacionsuperior_2006: {required: true, number:true}, 
                ingresoeducacionsuperior_2007: {required: true, number:true},
                ingresoeducacionsuperior_2008: {required: true, number:true},  
                ingresoeducacionsuperior_2009: {required: true, number:true},

                postulante_2005: {required: true, number:true},
                postulante_2006: {required: true, number:true}, 
                postulante_2007: {required: true, number:true},
                postulante_2008: {required: true, number:true},  
                postulante_2009: {required: true, number:true}

            },
            messages: {
                repitencia_2005: "ingrese un número",
                repitencia_2006: "ingrese un número", 
                repitencia_2007: "ingrese un número",
                repitencia_2008: "ingrese un número",  
                repitencia_2009: "ingrese un número",

                retiro_2005: "ingrese un número",
                retiro_2006: "ingrese un número", 
                retiro_2007: "ingrese un número",
                retiro_2008: "ingrese un número",  
                retiro_2009: "ingrese un número",

                baja_2005: "ingrese un número",
                baja_2006: "ingrese un número", 
                baja_2007: "ingrese un número",
                baja_2008: "ingrese un número",  
                baja_2009: "ingrese un número",

                aprobacion_2005: "ingrese un número",
                aprobacion_2006: "ingrese un número", 
                aprobacion_2007: "ingrese un número",
                aprobacion_2008: "ingrese un número",  
                aprobacion_2009: "ingrese un número",

                asistencia_2005: "ingrese un número",
                asistencia_2006: "ingrese un número", 
                asistencia_2007: "ingrese un número",
                asistencia_2008: "ingrese un número",  
                asistencia_2009: "ingrese un número",

                egresotp_2005: "ingrese un número",
                egresotp_2006: "ingrese un número", 
                egresotp_2007: "ingrese un número",
                egresotp_2008: "ingrese un número",  
                egresotp_2009: "ingrese un número",


                inserciontp_2005: "ingrese un número",
                inserciontp_2006: "ingrese un número", 
                inserciontp_2007: "ingrese un número",
                inserciontp_2008: "ingrese un número",  
                inserciontp_2009: "ingrese un número",

                egreso_2005: "ingrese un número",
                egreso_2006: "ingrese un número", 
                egreso_2007: "ingrese un número",
                egreso_2008: "ingrese un número",  
                egreso_2009: "ingrese un número",

                ingresoeducacionsuperior_2005: "ingrese un número",
                ingresoeducacionsuperior_2006: "ingrese un número", 
                ingresoeducacionsuperior_2007: "ingrese un número",
                ingresoeducacionsuperior_2008: "ingrese un número",  
                ingresoeducacionsuperior_2009: "ingrese un número",

                postulante_2005: "ingrese un número",
                postulante_2006: "ingrese un número", 
                postulante_2007: "ingrese un número",
                postulante_2008: "ingrese un número",  
                postulante_2009: "ingrese un número"
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
                GuardarEficiencia(codest);
            }
        });

    });
//]]> 
</script>
<form id="frmEficienciaNueva">
    <div class="fondo_eficiencia">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>&nbsp;</td>
                <th>2005</th>
                <th>2006</th>
                <th>2007</th>
                <th>2008</th>
                <th>2009</th>
            </tr>
            <tr>
                <td>Repitencia</td>
                <td><input size="1" type="text" name="repitencia_2005" id="repitencia_2005" value=""/></td>
                <td><input size="1" type="text" name="repitencia_2006" id="repitencia_2006" value=""/></td>
                <td><input size="1" type="text" name="repitencia_2007" id="repitencia_2007" value=""/></td>
                <td><input size="1" type="text" name="repitencia_2008" id="repitencia_2008" value=""/></td>
                <td><input size="1" type="text" name="repitencia_2009" id="repitencia_2009" value=""/></td>

            </tr>
            <tr>
                <td>Retiro de alumnos</td>
                <td><input size="1" type="text" name="retiro_2005" id="retiro_2005" value=""/></td>
                <td><input size="1" type="text" name="retiro_2006" id="retiro_2006" value=""/></td>
                <td><input size="1" type="text" name="retiro_2007" id="retiro_2007" value=""/></td>
                <td><input size="1" type="text" name="retiro_2008" id="retiro_2008" value=""/></td>
                <td><input size="1" type="text" name="retiro_2009" id="retiro_2009" value=""/></td>
            </tr>
            <tr>
                <td>Baja de Alumnos</td>
                <td><input size="1" type="text" name="baja_2005" id="baja_2005" value=""/></td>
                <td><input size="1" type="text" name="baja_2006" id="baja_2006" value=""/></td>
                <td><input size="1" type="text" name="baja_2007" id="baja_2007" value=""/></td>
                <td><input size="1" type="text" name="baja_2008" id="baja_2008" value=""/></td>
                <td><input size="1" type="text" name="baja_2009" id="baja_2009" value=""/></td>
            </tr>
            <tr>
                <td>Aprobación</td>
                <td><input size="1" type="text" name="aprobacion_2005" id="aprobacion_2005" value=""/></td>
                <td><input size="1" type="text" name="aprobacion_2006" id="aprobacion_2006" value=""/></td>
                <td><input size="1" type="text" name="aprobacion_2007" id="aprobacion_2007" value=""/></td>
                <td><input size="1" type="text" name="aprobacion_2008" id="aprobacion_2008" value=""/></td>
                <td><input size="1" type="text" name="aprobacion_2009" id="aprobacion_2009" value=""/></td>
            </tr>
            <tr>
                <td>Porcentaje Asistencia</td>
                <td><input size="1" type="text" name="asistencia_2005" id="asistencia_2005" value=""/></td>
                <td><input size="1" type="text" name="asistencia_2006" id="asistencia_2006" value=""/></td>
                <td><input size="1" type="text" name="asistencia_2007" id="asistencia_2007" value=""/></td>
                <td><input size="1" type="text" name="asistencia_2008" id="asistencia_2008" value=""/></td>
                <td><input size="1" type="text" name="asistencia_2009" id="asistencia_2009" value=""/></td>
             </tr>
            <tr>
                <td>Egreso alumnos TP</td>
                <td><input size="1" type="text" name="egresotp_2005" id="egresotp_2005" value=""/></td>
                <td><input size="1" type="text" name="egresotp_2006" id="egresotp_2006" value=""/></td>
                <td><input size="1" type="text" name="egresotp_2007" id="egresotp_2007" value=""/></td>
                <td><input size="1" type="text" name="egresotp_2008" id="egresotp_2008" value=""/></td>
                <td><input size="1" type="text" name="egresotp_2009" id="egresotp_2009" value=""/></td>
            </tr>
            <tr>
                <td>Inserción Laboral de Alumnos TP</td>
                <td><input size="1" type="text" name="inserciontp_2005" id="inserciontp_2005" value=""/></td>
                <td><input size="1" type="text" name="inserciontp_2006" id="inserciontp_2006" value=""/></td>
                <td><input size="1" type="text" name="inserciontp_2007" id="inserciontp_2007" value=""/></td>
                <td><input size="1" type="text" name="inserciontp_2008" id="inserciontp_2008" value=""/></td>
                <td><input size="1" type="text" name="inserciontp_2009" id="inserciontp_2009" value=""/></td>
            </tr>
            <tr>
                <td>Total Alumnos Egresados a la fecha</td>
                <td><input size="1" type="text" name="egreso_2005" id="egreso_2005" value=""/></td>
                <td><input size="1" type="text" name="egreso_2006" id="egreso_2006" value=""/></td>
                <td><input size="1" type="text" name="egreso_2007" id="egreso_2007" value=""/></td>
                <td><input size="1" type="text" name="egreso_2008" id="egreso_2008" value=""/></td>
                <td><input size="1" type="text" name="egreso_2009" id="egreso_2009" value=""/></td>
            </tr>
            <tr>
                <td>Alumnos que ingresan a la Educación Superior</td>
                <td><input size="1" type="text" name="ingresoeducacionsuperior_2005" id="ingresoeducacionsuperior_2005" value=""/></td>
                <td><input size="1" type="text" name="ingresoeducacionsuperior_2006" id="ingresoeducacionsuperior_2006" value=""/></td>
                <td><input size="1" type="text" name="ingresoeducacionsuperior_2007" id="ingresoeducacionsuperior_2007" value=""/></td>
                <td><input size="1" type="text" name="ingresoeducacionsuperior_2008" id="ingresoeducacionsuperior_2008" value=""/></td>
                <td><input size="1" type="text" name="ingresoeducacionsuperior_2009" id="ingresoeducacionsuperior_2009" value=""/></td>
            </tr>
            <tr>
                <td>Número Postulantes por establecimiento</td>
                <td><input size="1" type="text" name="postulante_2005" id="postulante_2005" value=""/></td>
                <td><input size="1" type="text" name="postulante_2006" id="postulante_2006" value=""/></td>
                <td><input size="1" type="text" name="postulante_2007" id="postulante_2007" value=""/></td>
                <td><input size="1" type="text" name="postulante_2008" id="postulante_2008" value=""/></td>
                <td><input size="1" type="text" name="postulante_2009" id="postulante_2009" value=""/></td>
            </tr>
         </table>
     </div>

     <p style="text-align:center">
        <input type="submit" value="ENVIAR" />
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla3','#formulario3')" />
     </p>
</form>