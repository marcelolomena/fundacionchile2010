<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="establecimiento.aspx.cs" Inherits="GestionSostenedores.establecimiento" %>
<script id="establecimiento" type="text/javascript">
//<![CDATA[
        <%
            Response.Write("var codins='" + Session["codins"] + "';");
            Response.Write("var codest='" + Request["codest"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>
    $(document).ready(function () {
    
        $("input:button, input:submit").button();

        if(accion=='edit'){

         var jsonStr = "{codest:'" + codest + "',codins:'" + codins + "'}";
          var estado="";

          $.ajax({
              type: "POST",
              url: "/establecimiento.aspx/DetalleEstablecimiento",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  $("#magnitud_nombre").attr('value', objJson.establecimiento[0]["MAGNITUD_NOMBRE"]);
                  $("#magnitud_direccion").attr('value', objJson.establecimiento[0]["MAGNITUD_DIRECCION"]);
                  $("#magnitud_datoscontacto").attr('value', objJson.establecimiento[0]["MAGNITUD_DATOSCONTACTO"]);
                  $("#magnitud_fechacreacion").attr('value', objJson.establecimiento[0]["MAGNITUD_FECHACREACION"]);
                  $("#magnitud_nombredirector").attr('value', objJson.establecimiento[0]["MAGNITUD_NOMBREDIRECTOR"]);
                  //$("#magnitud_clasificacion").attr('value', objJson.establecimiento[0]["MAGNITUD_CLASIFICACION"]);
                  $("#magnitud_cantidadalumnos").attr('value', objJson.establecimiento[0]["MAGNITUD_CANTIDADALUMNOS"]);
                  $("#magnitud_superficie").attr('value', objJson.establecimiento[0]["MAGNITUD_SUPERFICIE"]);
                  $("#magnitud_docente_total").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_TOTAL"]);
                  $("#magnitud_docente_genero_masculino").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_GENERO_MASCULINO"]);
                  $("#magnitud_docente_genero_femenino").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_GENERO_FEMENINO"]);
                  $("#magnitud_docente_edad").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_EDAD"]);
                  $("#magnitud_docente_anosservicio").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_ANOSSERVICIO"]);
                  $("#magnitud_docente_destacado").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_DESTACADO"]);
                  $("#magnitud_docente_competente").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_COMPETENTE"]);
                  $("#magnitud_docente_basico").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_BASICO"]);
                  $("#magnitud_docente_insatisfactorio").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_INSATISFACTORIO"]);
                  $("#magnitud_docente_lenguaje").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_LENGUAJE"]);
                  $("#magnitud_docente_matematica").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_MATEMATICA"]);  
                  $("#magnitud_docente_ciencia").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_CIENCIA"]);
                  $("#magnitud_docente_arte").attr('value', objJson.establecimiento[0]["MAGNITUD_DOCENTE_ARTE"]);
                  $("#mat_2005").attr('value', objJson.matricula[0]["TOTAL"]);
                  $("#mat_2006").attr('value', objJson.matricula[1]["TOTAL"]);  
                  $("#mat_2007").attr('value', objJson.matricula[2]["TOTAL"]);
                  $("#mat_2008").attr('value', objJson.matricula[3]["TOTAL"]);  
                  $("#mat_2009").attr('value', objJson.matricula[4]["TOTAL"]);
                  $("#mat_2010").attr('value', objJson.matricula[5]["TOTAL"]); 
                  $("#magnitud_personal_asistente").attr('value', objJson.establecimiento[0]["MAGNITUD_PERSONAL_ASISTENTE"]);  
                  $("#magnitud_personal_directivo_docente").attr('value', objJson.establecimiento[0]["MAGNITUD_PERSONAL_DIRECTIVO_DOCENTE"]);
                  $("#magnitud_personal_directivo_nodocente").attr('value', objJson.establecimiento[0]["MAGNITUD_PERSONAL_DIRECTIVO_NODOCENTE"]);  
                  $("#magnitud_personal_directivo_hlectiva").attr('value', objJson.establecimiento[0]["MAGNITUD_PERSONAL_DIRECTIVO_HLECTIVA"]);
                  $("#magnitud_personal_directivo_hnolectiva").attr('value', objJson.establecimiento[0]["MAGNITUD_PERSONAL_DIRECTIVO_HNOLECTIVA"]);                 

              }, /*success*/
              error: function (msg) {
                  jAlert("intentelo mas tarde", "Error");
              },
              complete: function (objeto, exito) {

              }
          });
        }

        $(function () {
            $("#magnitud_fechacreacion").datepicker();
        });

        $("#frmEstablecimientoNuevo").validate({
            rules: {
                magnitud_nombre: {required: true,minlength: 10},
                magnitud_direccion: {required: true,minlength: 10},
                magnitud_datoscontacto: {required: true,minlength: 10},
                magnitud_fechacreacion: {required: true},
                magnitud_nombredirector: {required: true,minlength: 5},
                magnitud_cantidadalumnos: {required: true, number:true},
                magnitud_superficie: {required: true, number:true},
                magnitud_docente_total: {required: true, number:true},
                magnitud_docente_edad: {required: true, number:true},
                magnitud_docente_genero_masculino: {required: true, number:true},
                magnitud_docente_genero_femenino: {required: true, number:true},
                magnitud_docente_anosservicio: {required: true, number:true},
                magnitud_docente_destacado: {required: true, number:true},
                magnitud_docente_competente: {required: true, number:true},
                magnitud_docente_basico: {required: true, number:true},
                magnitud_docente_insatisfactorio: {required: true, number:true},
                magnitud_docente_lenguaje: {required: true, number:true},
                magnitud_docente_matematica: {required: true, number:true},
                magnitud_docente_ciencia: {required: true, number:true},
                magnitud_docente_arte: {required: true, number:true},
                mat_2005: {required: true, number:true},
                mat_2006: {required: true, number:true}, 
                mat_2007: {required: true, number:true},
                mat_2008: {required: true, number:true},  
                mat_2009: {required: true, number:true},
                mat_2010: {required: true, number:true},
                magnitud_personal_asistente: {required: true, number:true},
                magnitud_personal_directivo_docente: {required: true, number:true},
                magnitud_personal_directivo_nodocente: {required: true, number:true},
                magnitud_personal_directivo_hlectiva: {required: true, number:true},
                magnitud_personal_directivo_hnolectiva: {required: true, number:true}
            },
            messages: {
                magnitud_nombre: "Ingrese un texto de 10 caractes como mínimo",
                magnitud_direccion: "Ingrese un texto de 10 caractes como mínimo",
                magnitud_datoscontacto: "Ingrese un texto de 10 caractes como mínimo",
                magnitud_fechacreacion: "Es obligatorio",
                magnitud_nombredirector: "Debe completarlo",
                magnitud_cantidadalumnos: "ingrese un número",
                magnitud_superficie: "ingrese un número",
                magnitud_docente_total: "ingrese un número",
                magnitud_docente_genero_masculino: "ingrese un número",
                magnitud_docente_genero_femenino: "ingrese un número",
                magnitud_docente_edad: "ingrese un número",
                magnitud_docente_anosservicio: "ingrese un número",
                magnitud_docente_destacado: "ingrese un número",
                magnitud_docente_competente: "ingrese un número",
                magnitud_docente_basico: "ingrese un número",
                magnitud_docente_insatisfactorio: "ingrese un número",
                magnitud_docente_lenguaje: "ingrese un número",
                magnitud_docente_matematica: "ingrese un número",
                magnitud_docente_ciencia: "ingrese un número",
                magnitud_docente_arte: "ingrese un número",
                mat_2005: "ingrese un número",
                mat_2006: "ingrese un número",  
                mat_2007: "ingrese un número",
                mat_2008: "ingrese un número",  
                mat_2009: "ingrese un número",
                mat_2010: "ingrese un número",
                magnitud_personal_asistente: "ingrese un número",
                magnitud_personal_directivo_docente: "ingrese un número",
                magnitud_personal_directivo_nodocente: "ingrese un número",
                magnitud_personal_directivo_hlectiva: "ingrese un número",
                magnitud_personal_directivo_hnolectiva: "ingrese un número"
            },
            errorElement: "div",
            wrapper: "div",
            errorPlacement: function(error, element) {
                offset = element.offset();
                error.insertBefore(element);
                error.addClass('message');
                error.css('position', 'absolute');
                error.css('left', offset.left + element.outerWidth());
                error.css('top', offset.top);
            },
            submitHandler: function (form) {
                //alert(codins);
                if(accion=='add'){
                    GuardarEstablecimiento(codins);
                }else if(accion=='edit'){
                    ActualizarEstablecimiento(codest);
                }
                $("#formulario2").hide();
                $("#tabla2").show();
            }
        });

    });
//]]> 
</script>
<form id="frmEstablecimientoNuevo">
    <div class="fondo_dimensionamiento">
        <table cellspacing="0" cellpadding="0">
            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Perfil y Clasificación de los establecimientos</b></th>
            </tr>
            <tr>
                <th>Nombre Establecimiento</th>
                <td><input class="text" type="text" name="magnitud_nombre" id="magnitud_nombre" value=""/></td>
                
                <th>Direcci&oacute;n</th>
                <td><input class="text" type="text" name="magnitud_direccion" id="magnitud_direccion" value=""/></td>
                
            </tr>
            <tr>
                <th>Datos Contacto</th>
                <td><input class="text" type="text" name="magnitud_datoscontacto" id="magnitud_datoscontacto" value=""/></td>
                
                <th>Fecha Creaci&oacute;n</th>
                <td><input class="text" type="text" name="magnitud_fechacreacion" id="magnitud_fechacreacion" size="10" value=""/></td>
                
            </tr>
            <tr>
                <th>Nombre Director</th>
                <td><input class="text" type="text" name="magnitud_nombredirector" id="magnitud_nombredirector"  value=""/></td>
                
                <th>Clasificación</th>
                <td>
                <select name="magnitud_clasificacion" id="magnitud_clasificacion">
                  <option value="1">emergentes</option>
                  <option value="2">autonomos</option>
                </select>
                </td>
            </tr>
            <tr>
                <th>Cantidad de alumnos</th>
                <td><input class="text" type="text" name="magnitud_cantidadalumnos" id="magnitud_cantidadalumnos" size="5" value=""/></td>
                
                <th>Superficie</th>
                <td><input class="text" type="text" name="magnitud_superficie" id="magnitud_superficie" size="5" value=""/></td>
                
            </tr>

            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Dotación Docente</b></th>
            </tr>

            <tr>
                <th>Total Docentes</th>
                <td><input class="text" type="text" name="magnitud_docente_total" id="magnitud_docente_total" size="2" value=""/></td>
                
                <th>Docentes hombres</th>
                <td><input class="text" type="text" name="magnitud_docente_genero_masculino" id="magnitud_docente_genero_masculino" size="2" value=""/></td>
            </tr>

            <tr>
                <th>Docentes mujeres</th>
                <td><input class="text" type="text" name="magnitud_docente_genero_femenino" id="magnitud_docente_genero_femenino" size="2" value=""/></td>
                
                <th></th>
                <td></td>
            </tr>

            <tr>
                <th>Promedio Edad Docentes</th>
                <td><input class="text" type="text" name="magnitud_docente_edad" id="magnitud_docente_edad" size="2" value=""/></td>
                
                <th>Promedio Años de Servicio</th>
                <td><input class="text" type="text" name="magnitud_docente_anosservicio" id="magnitud_docente_anosservicio" size="2" value=""/></td>
                
            </tr>
            <tr>
                <th>Destacados</th>
                <td><input class="text" type="text" name="magnitud_docente_destacado" id="magnitud_docente_destacado" size="3" value=""/></td>
                
                <th>Competentes</th>
                <td><input class="text" type="text" name="magnitud_docente_competente" id="magnitud_docente_competente" size="3" value=""/></td>
                
            </tr>
            <tr>
                <th>Básicos</th>
                <td><input class="text" type="text" name="magnitud_docente_basico" id="magnitud_docente_basico" size="3" value=""/></td>
                
                <th>Insatisfactorios</th>
                <td><input class="text" type="text" name="magnitud_docente_insatisfactorio" id="magnitud_docente_insatisfactorio" size="3" value=""/></td>
                
            </tr>

            <tr>
                <th>Lenguaje</th>
                <td><input class="text" type="text" name="magnitud_docente_lenguaje" id="magnitud_docente_lenguaje" size="3" value=""/></td>
                
                <th>Matemática</th>
                <td><input class="text" type="text" name="magnitud_docente_matematica" id="magnitud_docente_matematica" size="3" value=""/></td>
                
            </tr>
            <tr>
                <th>Ciencias</th>
                <td><input class="text" type="text" name="magnitud_docente_ciencia" id="magnitud_docente_ciencia" size="3" value=""/></td>
                
                <th>Artes</th>
                <td><input class="text" type="text" name="magnitud_docente_arte" id="magnitud_docente_arte" size="3" value=""/></td>
                
            </tr>

            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Matrícula Total de Alumos</b></th>
            </tr>

            <tr>
                <th>2005</th>
                <td><input class="text" type="text" name="mat_2005" id="mat_2005" size="3" value=""/></td>
                
                <th>2006</th>
                <td><input class="text" type="text" name="mat_2006" id="mat_2006" size="3" value=""/></td>
                
            </tr>

            <tr>
                <th>2007</th>
                <td><input class="text" type="text" name="mat_2007" id="mat_2007" size="3" value=""/></td>
                
                <th>2008</th>
                <td><input class="text" type="text" name="mat_2008" id="mat_2008" size="3" value=""/></td>
                
            </tr>

            <tr>
                <th>2009</th>
                <td><input class="text" type="text" name="mat_2009" id="mat_2009" size="3" value=""/></td>
                
                <th>2010</th>
                <td><input class="text" type="text" name="mat_2010" id="mat_2010" size="3" value=""/></td>
                
            </tr>

            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Personal Administrativo</b></th>
            </tr>

            <tr>
                <th>Asistentes Educación</th>
                <td><input class="text" type="text" name="magnitud_personal_asistente" id="magnitud_personal_asistente" size="3" value=""/></td>
                
            </tr>

            <tr>
            <th colspan="4" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Personal Directivo</b></th>
            </tr>

            <tr>
                <th>Realizan Docencia en Aula</th>
                <td><input class="text" type="text" name="magnitud_personal_directivo_docente" id="magnitud_personal_directivo_docente" size="3" value=""/></td>
                
                <th>Realizan sólo función directiva</th>
                <td><input class="text" type="text" name="magnitud_personal_directivo_nodocente" id="magnitud_personal_directivo_nodocente" size="3" value=""/></td>
                
            </tr>

            <tr>
                <th>Promedio de Horas Lectivas</th>
                <td><input class="text" type="text" name="magnitud_personal_directivo_hlectiva" id="magnitud_personal_directivo_hlectiva" size="3" value=""/></td>
                
                <th>Promedio de Horas No Lectivas</th>
                <td><input class="text" type="text" name="magnitud_personal_directivo_hnolectiva" id="magnitud_personal_directivo_hnolectiva" size="3"/></td>
                
            </tr>

        </table>
     </div>

    <p style="text-align:center">
        <input type="submit" value="ENVIAR" />
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla2','#formulario2')" />
     </p>
</form>