<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="espacial.aspx.cs" Inherits="GestionSostenedores.espacial" %>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.core.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.button.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.draggable.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.mouse.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.position.min.js"></script>
<script type="text/javascript" src="Scripts/ui/minified/jquery.ui.resizable.min.js"></script>

<script id="espacial" type="text/javascript">
        <%
            Response.Write("var codest='" + Request["codest"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>
    $(document).ready(function () {

    $("input:button, input:submit").button();
        $("#h_riesgo").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'riesgo');
        });

        $("#h_verde").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'verde');
        });

        $("#h_luminaria").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'luminaria');
        });

        $("#h_comisaria").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'comisaria');
        });

        $("#h_botilleria").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'botilleria');
        });

        $("#h_emergencia").click(function(event){
            event.preventDefault();
            ver_mapa(codest,'emergencia');
        });
        
                     
        if(accion=='edit'){

            var jsonStr = "{codest:'" + codest + "'}";
            //alert(jsonStr);
            $.ajax({
                type: "POST",
                url: "/espacial.aspx/ObtenerEspacial",
                data: jsonStr,
                contentType: "application/json",
                dataType: "json",
                timeout: 10000,
                success: function (response) {
                    var objJson = JSON.parse(response.d);
                    var strFilaRiesgo="";
                    var strFilaVerde="";
                    var strFilaLuminaria="";
                    var strFilaComisaria="";
                    var strFilaBotillerias="";
                    var strFilaEmergencia="";
                    if(objJson.riesgo.length>0){
                        $.each(objJson.riesgo, function(i,rie){
                                strFilaRiesgo+="<tr>";
                                strFilaRiesgo+="<td><input type=\"text\" name=\"riesgo_lat\" value=\"" + rie.RIESGO_LAT+ "\" size=\"10\"/></td>";
                                strFilaRiesgo+="<td><input type=\"text\" name=\"riesgo_lon\" value=\"" + rie.RIESGO_LON+ "\" size=\"10\"/></td>";
                                strFilaRiesgo+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaRiesgo+="</tr>";
                        });
                    }else{
                        strFilaRiesgo+="<tr>";
                        strFilaRiesgo+="<td><input type=\"text\" name=\"riesgo_lat\" size=\"10\"/></td>";
                        strFilaRiesgo+="<td><input type=\"text\" name=\"riesgo_lon\" size=\"10\"/></td>";
                        strFilaRiesgo+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaRiesgo+="</tr>";
                    }
                    if(objJson.verde.length>0){
                        $.each(objJson.verde, function(i,ver){
                                strFilaVerde+="<tr>";
                                strFilaVerde+="<td><input type=\"text\" name=\"verde_lat\" value=\"" + ver.VERDE_LAT+ "\" size=\"10\"/></td>";
                                strFilaVerde+="<td><input type=\"text\" name=\"verde_lon\" value=\"" + ver.VERDE_LON+ "\" size=\"10\"/></td>";
                                strFilaVerde+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaVerde+="</tr>";
                        });
                    }else{
                        strFilaVerde+="<tr>";
                        strFilaVerde+="<td><input type=\"text\" name=\"verde_lat\" size=\"10\"/></td>";
                        strFilaVerde+="<td><input type=\"text\" name=\"verde_lon\" size=\"10\"/></td>";
                        strFilaVerde+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaVerde+="</tr>";
                    }
                    if(objJson.luminaria.length>0){
                        $.each(objJson.luminaria, function(i,lum){
                                strFilaLuminaria+="<tr>";
                                strFilaLuminaria+="<td><input type=\"text\" name=\"luminaria_lat\" value=\"" + lum.LUMINARIA_LAT+ "\" size=\"10\"/></td>";
                                strFilaLuminaria+="<td><input type=\"text\" name=\"luminaria_lon\" value=\"" + lum.LUMINARIA_LON+ "\" size=\"10\"/></td>";
                                strFilaLuminaria+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaLuminaria+="</tr>";
                        });
                    }else{
                        strFilaLuminaria+="<tr>";
                        strFilaLuminaria+="<td><input type=\"text\" name=\"luminaria_lat\" size=\"10\"/></td>";
                        strFilaLuminaria+="<td><input type=\"text\" name=\"luminaria_lon\" size=\"10\"/></td>";
                        strFilaLuminaria+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaLuminaria+="</tr>";
                    }
                    if(objJson.comisaria.length>0){
                        $.each(objJson.comisaria, function(i,com){
                                strFilaComisaria+="<tr>";
                                strFilaComisaria+="<td><input type=\"text\" name=\"comisaria_lat\" value=\"" + com.COMISARIA_LAT+ "\" size=\"10\"/></td>";
                                strFilaComisaria+="<td><input type=\"text\" name=\"comisaria_lon\" value=\"" + com.COMISARIA_LON+ "\" size=\"10\"/></td>";
                                strFilaComisaria+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaComisaria+="</tr>";
                        });
                    }else{
                        strFilaComisaria+="<tr>";
                        strFilaComisaria+="<td><input type=\"text\" name=\"comisaria_lat\" size=\"10\"/></td>";
                        strFilaComisaria+="<td><input type=\"text\" name=\"comisaria_lon\" size=\"10\"/></td>";
                        strFilaComisaria+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaComisaria+="</tr>";
                    }
                    if(objJson.botilleria.length>0){
                        $.each(objJson.botilleria, function(i,bot){
                                strFilaBotillerias+="<tr>";
                                strFilaBotillerias+="<td><input type=\"text\" name=\"botilleria_lat\" value=\"" + bot.BOTILLERIA_LAT+ "\" size=\"10\"/></td>";
                                strFilaBotillerias+="<td><input type=\"text\" name=\"botilleria_lon\" value=\"" + bot.BOTILLERIA_LON+ "\" size=\"10\"/></td>";
                                strFilaBotillerias+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaBotillerias+="</tr>";
                        });
                    }else{

                        strFilaBotillerias+="<tr>";
                        strFilaBotillerias+="<td><input type=\"text\" name=\"botilleria_lat\" size=\"10\"/></td>";
                        strFilaBotillerias+="<td><input type=\"text\" name=\"botilleria_lon\" size=\"10\"/></td>";
                        strFilaBotillerias+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaBotillerias+="</tr>";
                    }

                    if(objJson.emergencia.length>0){
                        $.each(objJson.emergencia, function(i,eme){
                                strFilaEmergencia+="<tr>";
                                strFilaEmergencia+="<td><input type=\"text\" name=\"emergencia_lat\" value=\"" + eme.EMERGENCIA_LAT+ "\" size=\"10\"/></td>";
                                strFilaEmergencia+="<td><input type=\"text\" name=\"emergencia_lon\" value=\"" + eme.EMERGENCIA_LON+ "\" size=\"10\"/></td>";
                                strFilaEmergencia+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                                strFilaEmergencia+="</tr>";
                        });
                    }else{
                        strFilaEmergencia+="<tr>";
                        strFilaEmergencia+="<td><input type=\"text\" name=\"emergencia_lat\" size=\"10\"/></td>";
                        strFilaEmergencia+="<td><input type=\"text\" name=\"emergencia_lon\" size=\"10\"/></td>";
                        strFilaEmergencia+="<td><img src=\"images/b_borrarfila.gif\" class=\"delRow\" border=\"0\" alt=\"cruz\"/></td>";
                        strFilaEmergencia+="</tr>";
                    }

                    $('table[id^=tbl_riesgo] tbody').append(strFilaRiesgo);
                    $('table[id^=tbl_verde] tbody').append(strFilaVerde);
                    $('table[id^=tbl_luminaria] tbody').append(strFilaLuminaria);
                    $('table[id^=tbl_comisaria] tbody').append(strFilaComisaria);
                    $('table[id^=tbl_botillerias] tbody').append(strFilaBotillerias);
                    $('table[id^=tbl_emergencia] tbody').append(strFilaEmergencia);

                    $(".alternativeRow").btnAddRow({ maxRow: 5, inputBoxAutoNumber: true, oddRowCSS: "oddRow", evenRowCSS: "evenRow" });
                    $(".delRow").btnDelRow();

                }, 
                   error: function (msg) {
                    alert("intentelo mas tarde");
                },
                complete: function (objeto, exito) {

                }
            });
        }
        

        $("#frmEspacialNueva").validate({
            rules: {
                riesgo_lat1: {required: true, number:true},
                riesgo_lon1: {required: true, number:true},
                riesgo_lat2: {required: true, number:true},
                riesgo_lon2: {required: true, number:true},
                riesgo_lat3: {required: true, number:true},
                riesgo_lon3: {required: true, number:true},
                riesgo_lat4: {required: true, number:true},
                riesgo_lon4: {required: true, number:true},
                riesgo_lat5: {required: true, number:true},
                riesgo_lon5: {required: true, number:true},

                verde_lat1: {required: true, number:true},
                verde_lon1: {required: true, number:true},
                verde_lat2: {required: true, number:true},
                verde_lon2: {required: true, number:true},
                verde_lat3: {required: true, number:true},
                verde_lon3: {required: true, number:true},
                verde_lat4: {required: true, number:true},
                verde_lon4: {required: true, number:true},
                verde_lat5: {required: true, number:true},
                verde_lon5: {required: true, number:true},

                luminaria_lat1: {required: true, number:true},
                luminaria_lon1: {required: true, number:true},
                luminaria_lat2: {required: true, number:true},
                luminaria_lon2: {required: true, number:true},
                luminaria_lat3: {required: true, number:true},
                luminaria_lon3: {required: true, number:true},
                luminaria_lat4: {required: true, number:true},
                luminaria_lon4: {required: true, number:true},
                luminaria_lat5: {required: true, number:true},
                luminaria_lon5: {required: true, number:true},

                comisaria_lat1: {required: true, number:true},
                comisaria_lon1: {required: true, number:true},
                comisaria_lat2: {required: true, number:true},
                comisaria_lon2: {required: true, number:true},
                comisaria_lat3: {required: true, number:true},
                comisaria_lon3: {required: true, number:true},
                comisaria_lat4: {required: true, number:true},
                comisaria_lon4: {required: true, number:true},
                comisaria_lat5: {required: true, number:true},
                comisaria_lon5: {required: true, number:true},

                botilleria_lat1: {required: true, number:true},
                botilleria_lon1: {required: true, number:true},
                botilleria_lat2: {required: true, number:true},
                botilleria_lon2: {required: true, number:true},
                botilleria_lat3: {required: true, number:true},
                botilleria_lon3: {required: true, number:true},
                botilleria_lat4: {required: true, number:true},
                botilleria_lon4: {required: true, number:true},
                botilleria_lat5: {required: true, number:true},
                botilleria_lon5: {required: true, number:true},

                emergencia_lat1: {required: true, number:true},
                emergencia_lon1: {required: true, number:true},
                emergencia_lat2: {required: true, number:true},
                emergencia_lon2: {required: true, number:true},
                emergencia_lat3: {required: true, number:true},
                emergencia_lon3: {required: true, number:true},
                emergencia_lat4: {required: true, number:true},
                emergencia_lon4: {required: true, number:true},
                emergencia_lat5: {required: true, number:true},
                emergencia_lon5: {required: true, number:true}


            },
            messages: {
                    riesgo_lat1: "ingrese un número",
                    riesgo_lon1: "ingrese un número",
                    riesgo_lat2: "ingrese un número",
                    riesgo_lon2: "ingrese un número",
                    riesgo_lat3: "ingrese un número",
                    riesgo_lon3: "ingrese un número",
                    riesgo_lat4: "ingrese un número",
                    riesgo_lon4: "ingrese un número",
                    riesgo_lat5: "ingrese un número",
                    riesgo_lon5: "ingrese un número",

                    verde_lat1: "ingrese un número",
                    verde_lon1: "ingrese un número",
                    verde_lat2: "ingrese un número",
                    verde_lon2: "ingrese un número",
                    verde_lat3: "ingrese un número",
                    verde_lon3: "ingrese un número",
                    verde_lat4: "ingrese un número",
                    verde_lon4: "ingrese un número",
                    verde_lat5: "ingrese un número",
                    verde_lon5: "ingrese un número",

                    luminaria_lat1: "ingrese un número",
                    luminaria_lon1: "ingrese un número",
                    luminaria_lat2: "ingrese un número",
                    luminaria_lon2: "ingrese un número",
                    luminaria_lat3: "ingrese un número",
                    luminaria_lon3: "ingrese un número",
                    luminaria_lat4: "ingrese un número",
                    luminaria_lon4: "ingrese un número",
                    luminaria_lat5: "ingrese un número",
                    luminaria_lon5: "ingrese un número",

                    comisaria_lat1: "ingrese un número",
                    comisaria_lon1: "ingrese un número",
                    comisaria_lat2: "ingrese un número",
                    comisaria_lon2: "ingrese un número",
                    comisaria_lat3: "ingrese un número",
                    comisaria_lon3: "ingrese un número",
                    comisaria_lat4: "ingrese un número",
                    comisaria_lon4: "ingrese un número",
                    comisaria_lat5: "ingrese un número",
                    comisaria_lon5: "ingrese un número",

                    botilleria_lat1: "ingrese un número",
                    botilleria_lon1: "ingrese un número",
                    botilleria_lat2: "ingrese un número",
                    botilleria_lon2: "ingrese un número",
                    botilleria_lat3: "ingrese un número",
                    botilleria_lon3: "ingrese un número",
                    botilleria_lat4: "ingrese un número",
                    botilleria_lon4: "ingrese un número",
                    botilleria_lat5: "ingrese un número",
                    botilleria_lon5: "ingrese un número",

                    emergencia_lat1: "ingrese un número",
                    emergencia_lon1: "ingrese un número",
                    emergencia_lat2: "ingrese un número",
                    emergencia_lon2: "ingrese un número",
                    emergencia_lat3: "ingrese un número",
                    emergencia_lon3: "ingrese un número",
                    emergencia_lat4: "ingrese un número",
                    emergencia_lon4: "ingrese un número",
                    emergencia_lat5: "ingrese un número",
                    emergencia_lon5: "ingrese un número"
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
                GuardarEspacial(codest);
            }
        });

    });
</script>
<form id="frmEspacialNueva">
<div class="fondo_dimensionamiento">
   <table border="0" cellspacing="0" cellpadding="0">
       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_riesgo"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Variables de riesgo social asociadas al entorno directo</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_riesgo" border="1" class="atable">
           <thead>
           <tr><th>Latitud</th><th>Longitud</th><th><input type="button" id="b_riesgo" class="alternativeRow"/></th></tr>
           </thead>
           <tbody></tbody>  
           </table>
           </td>
       </tr>

       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_verde"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Áreas verdes</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_verde" border="1" class="atable">
           <thead>
               <tr>
                   <th>Latitud</th>
                   <th>Longitud</th>
                   <th><input type="button" id="b_verde" class="alternativeRow"/></th>
               </tr>
           </thead>
           <tbody></tbody>
           </table>
           </td>
       </tr>

       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_luminaria"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Luminarias</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_luminaria" border="1" class="atable">
           <thead>
               <tr>
                   <th>Latitud</th>
                   <th>Longitud</th>
                   <th><input type="button" id="b_luminaria" class="alternativeRow"/></th>
               </tr>
           </thead>
           <tbody></tbody>
           </table>
           </td>
       </tr>

       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_comisaria"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Comisarías y seguridad</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_comisaria" border="1" class="atable">
           <thead>
               <tr>
                   <th>Latitud</th>
                   <th>Longitud</th>
                   <th><input type="button" id="b_comisaria" class="alternativeRow"/></th>
               </tr>
           </thead>
           <tbody></tbody>
           </table>
           </td>
       </tr>

       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_botillerias"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Botillerías</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_botillerias" border="1" class="atable">
           <thead>
               <tr>
                   <th>Latitud</th>
                   <th>Longitud</th>
                   <th><input type="button" id="b_botillerias" class="alternativeRow"/></th>
               </tr>
            </thead>
            <tbody></tbody>  
           </table>
           </td>
       </tr>

       <tr>
       <th style="border-bottom: 2px solid #EBEBEB;"><a href="#" id="h_emergencia"><img src="images/b_mapa.gif" alt="mapa"/></a><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Emergencia</b></th>
       </tr>
       <tr>
           <td>
           <table id="tbl_emergencia" border="1" class="atable">
           <thead>
               <tr>
                   <th>Latitud</th>
                   <th>Longitud</th>
                   <th><input type="button" id="b_emergencia" class="alternativeRow"/></th>
               </tr>
            </thead>
            <tbody></tbody>  
           </table>
           </td>
       </tr>

    </table>
</div>

<p style="text-align:center">
   <input type="submit" value="ENVIAR" />
   <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla10','#formulario10')" />
</p>
</form>