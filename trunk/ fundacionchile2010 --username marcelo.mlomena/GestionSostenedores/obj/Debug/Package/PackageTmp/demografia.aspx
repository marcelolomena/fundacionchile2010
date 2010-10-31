<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demografia.aspx.cs" Inherits="GestionSostenedores.demografia" %>

<script id="Script1" type="text/javascript">
        <%
            Response.Write("var codusu='" + Request["codusu"] + "';");
        %>
    $(document).ready(function () {
    $("input:button, input:submit").button();
         var jsonStr = "{codusu:'" + codusu + "'}";

          $.ajax({
              type: "POST",
              url: "/demografia.aspx/ObtenerDemografia",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                    var objJson = JSON.parse(response.d);
                    //alert(objJson.demografia.length);
                    var strFila="";
                    if(objJson.demografia.length>0){
                        $.each(objJson.demografia, function(i,dem){
                            strFila+="<tr>";                                                                           
                            strFila+="<td><input type=\"text\" name=\"ano\" value=\"" + dem.PERIODO + "\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"nat\" value=\"" + dem.NATALIDAD + "\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"esc\" value=\"" + dem.JOVENES + "\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"hom\" value=\"" + dem.HOMBRES + "\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"muj\" value=\"" + dem.MUJERES + "\" size=\"2\"/></td>";                          
                            strFila+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                            strFila+="</tr>";  
                        });
                    }else{
                            strFila+="<tr>";                                                                           
                            strFila+="<td><input type=\"text\" name=\"ano\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"nat\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"esc\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"hom\" size=\"2\"/></td>";                          
                            strFila+="<td><input type=\"text\" name=\"muj\" size=\"2\"/></td>";                          
                            strFila+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                            strFila+="</tr>"; 
                    }
                    
                    $('table[id^=tbl_demografia] tbody').append(strFila);      

                    $(".alternativeRow").btnAddRow({ maxRow: 10, inputBoxAutoNumber: true, oddRowCSS: "oddRow", evenRowCSS: "evenRow" });
                    $(".delRow").btnDelRow();

              }, 
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {

              }
          });

        $("#frmDemografiaNueva").validate({
            rules: {
                ano1: {required: true, number:true},
                nat1: {required: true, number:true},
                esc1: {required: true, number:true},
                hom1: {required: true, number:true},
                muj1: {required: true, number:true},

                ano2: {required: true, number:true},
                nat2: {required: true, number:true},
                esc2: {required: true, number:true},
                hom2: {required: true, number:true},
                muj2: {required: true, number:true},

                ano3: {required: true, number:true},
                nat3: {required: true, number:true},
                esc3: {required: true, number:true},
                hom3: {required: true, number:true},
                muj3: {required: true, number:true},

                ano4: {required: true, number:true},
                nat4: {required: true, number:true},
                esc4: {required: true, number:true},
                hom4: {required: true, number:true},
                muj4: {required: true, number:true},

                ano4: {required: true, number:true},
                nat4: {required: true, number:true},
                esc4: {required: true, number:true},
                hom4: {required: true, number:true},
                muj4: {required: true, number:true},

                ano5: {required: true, number:true},
                nat5: {required: true, number:true},
                esc5: {required: true, number:true},
                hom5: {required: true, number:true},
                muj5: {required: true, number:true},

                ano6: {required: true, number:true},
                nat6: {required: true, number:true},
                esc6: {required: true, number:true},
                hom6: {required: true, number:true},
                muj6: {required: true, number:true},

                ano7: {required: true, number:true},
                nat7: {required: true, number:true},
                esc7: {required: true, number:true},
                hom7: {required: true, number:true},
                muj7: {required: true, number:true},

                ano8: {required: true, number:true},
                nat8: {required: true, number:true},
                esc8: {required: true, number:true},
                hom8: {required: true, number:true},
                muj8: {required: true, number:true},

                ano9: {required: true, number:true},
                nat9: {required: true, number:true},
                esc9: {required: true, number:true},
                hom9: {required: true, number:true},
                muj9: {required: true, number:true},

                ano10: {required: true, number:true},
                nat10: {required: true, number:true},
                esc10: {required: true, number:true},
                hom10: {required: true, number:true},
                muj10: {required: true, number:true}
            },

            messages: {
                ano1: "ingrese un año",
                nat1: "ingrese un número",
                esc1: "ingrese un número",
                hom1: "ingrese un número",
                muj1: "ingrese un número",

                ano2: "ingrese un año",
                nat2: "ingrese un número",
                esc2: "ingrese un número",
                hom2: "ingrese un número",
                muj2: "ingrese un número",

                ano3: "ingrese un año",
                nat3: "ingrese un número",
                esc3: "ingrese un número",
                hom3: "ingrese un número",
                muj3: "ingrese un número",

                ano4: "ingrese un año",
                nat4: "ingrese un número",
                esc4: "ingrese un número",
                hom4: "ingrese un número",
                muj4: "ingrese un número",

                ano5: "ingrese un año",
                nat5: "ingrese un número",
                esc5: "ingrese un número",
                hom5: "ingrese un número",
                muj5: "ingrese un número",

                ano6: "ingrese un año",
                nat6: "ingrese un número",
                esc6: "ingrese un número",
                hom6: "ingrese un número",
                muj6: "ingrese un número",

                ano7: "ingrese un año",
                nat7: "ingrese un número",
                esc7: "ingrese un número",
                hom7: "ingrese un número",
                muj7: "ingrese un número",

                ano8: "ingrese un año",
                nat8: "ingrese un número",
                esc8: "ingrese un número",
                hom8: "ingrese un número",
                muj8: "ingrese un número",

                ano9: "ingrese un año",
                nat9: "ingrese un número",
                esc9: "ingrese un número",
                hom9: "ingrese un número",
                muj9: "ingrese un número",

                ano10: "ingrese un año",
                nat10: "ingrese un número",
                esc10: "ingrese un número",
                hom10: "ingrese un número",
                muj10: "ingrese un número"

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
                GuardarDemografia(codusu);
            }
        });
    });
</script>
<form id="frmDemografiaNueva" >
<div class="fondo_dimensionamiento">
           <table class="atable" id="tbl_demografia">
               <thead>
               <tr>
                   <th>Año</th>
                   <th>Natalidad</th>
                   <th>Población <br />escolar</th>
                   <th>Población <br />hombres</th>
                   <th>Población <br />mujeres</th>
                   <th><input type="button" value="Nueva" class="alternativeRow"/></th>
               </tr>
               </thead>
               <tbody></tbody>
           </table>           
</div>
<p style="text-align:center">
   <input type="submit" value="ENVIAR" />
   <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla11','#formulario11')" />
</p>
</form>