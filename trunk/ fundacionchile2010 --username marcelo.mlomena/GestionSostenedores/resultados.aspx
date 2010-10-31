<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="GestionSostenedores.resultados" %>                                                                                                                                                       
<script id="resultados" type="text/javascript">
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
              url: "/resultados.aspx/ObtenerResultados",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  //alert(objJson);
                  if(objJson.resultados.length>0){
                      $.each(objJson.resultados, function(i,res){
                        $("#simce2_len_200" + (i+5) ).attr('value', res.S2_LEN);
                        $("#simce2_mat_200" + (i+5) ).attr('value', res.S2_MAT);
                        $("#simce2_med_200" + (i+5) ).attr('value', res.S2_MED);
                        $("#simce4_len_200" + (i+5) ).attr('value', res.S4_LEN);
                        $("#simce4_mat_200" + (i+5) ).attr('value', res.S4_MAT);
                        $("#simce4_med_200" + (i+5) ).attr('value', res.S4_MED);
                        $("#simce8_len_200" + (i+5) ).attr('value', res.S8_LEN);
                        $("#simce8_mat_200" + (i+5) ).attr('value', res.S8_MAT);
                        $("#simce8_med_200" + (i+5) ).attr('value', res.S8_MED);
                        $("#psu_mat_200" + (i+5) ).attr('value', res.PSUM);
                        $("#psu_cie_200" + (i+5) ).attr('value', res.PSUC);
                        $("#psu_len_200" + (i+5) ).attr('value', res.PSUL);
                        $("#pro_200" + (i+5) ).attr('value', res.PRO);
                        $("#otr_200" + (i+5) ).attr('value', res.OTR);
                      });
                  }
              }, /*success*/
              error: function (msg) {
                  alert("intentelo mas tarde");
              },
              complete: function (objeto, exito) {
              }
          });
        }

        $("#frmResultadosNueva").validate({
            rules: {
                simce4_len_2005: {required: true, number:true},
                simce4_len_2006: {required: true, number:true},
                simce4_len_2007: {required: true, number:true},
                simce4_len_2008: {required: true, number:true},
                simce4_len_2009: {required: true, number:true},
               
                simce4_mat_2005: {required: true, number:true},
                simce4_mat_2006: {required: true, number:true},
                simce4_mat_2007: {required: true, number:true},
                simce4_mat_2008: {required: true, number:true},
                simce4_mat_2009: {required: true, number:true},
               
                simce4_med_2005: {required: true, number:true},
                simce4_med_2006: {required: true, number:true},
                simce4_med_2007: {required: true, number:true},
                simce4_med_2008: {required: true, number:true},
                simce4_med_2009: {required: true, number:true},
               
                simce8_len_2005: {required: true, number:true},
                simce8_len_2006: {required: true, number:true},
                simce8_len_2007: {required: true, number:true},
                simce8_len_2008: {required: true, number:true},
                simce8_len_2009: {required: true, number:true},
               
                simce8_mat_2005: {required: true, number:true},
                simce8_mat_2006: {required: true, number:true},
                simce8_mat_2007: {required: true, number:true},
                simce8_mat_2008: {required: true, number:true},
                simce8_mat_2009: {required: true, number:true},
               
                simce8_med_2005: {required: true, number:true},
                simce8_med_2006: {required: true, number:true},
                simce8_med_2007: {required: true, number:true},
                simce8_med_2008: {required: true, number:true},
                simce8_med_2009: {required: true, number:true},
               
                simce2_len_2005: {required: true, number:true},
                simce2_len_2006: {required: true, number:true},
                simce2_len_2007: {required: true, number:true},
                simce2_len_2008: {required: true, number:true},
                simce2_len_2009: {required: true, number:true},
               
                simce2_mat_2005: {required: true, number:true},
                simce2_mat_2006: {required: true, number:true},
                simce2_mat_2007: {required: true, number:true},
                simce2_mat_2008: {required: true, number:true},
                simce2_mat_2009: {required: true, number:true},
               
                simce2_med_2005: {required: true, number:true},
                simce2_med_2006: {required: true, number:true},
                simce2_med_2007: {required: true, number:true},
                simce2_med_2008: {required: true, number:true},
                simce2_med_2009: {required: true, number:true},
               
                psu_len_2005: {required: true, number:true},   
                psu_len_2006: {required: true, number:true},   
                psu_len_2007: {required: true, number:true},   
                psu_len_2008: {required: true, number:true},   
                psu_len_2009: {required: true, number:true},   
               
                psu_mat_2005: {required: true, number:true},   
                psu_mat_2006: {required: true, number:true},   
                psu_mat_2007: {required: true, number:true},   
                psu_mat_2008: {required: true, number:true},   
                psu_mat_2009: {required: true, number:true},   
               
                psu_cie_2005: {required: true, number:true},   
                psu_cie_2006: {required: true, number:true},   
                psu_cie_2007: {required: true, number:true},   
                psu_cie_2008: {required: true, number:true},   
                psu_cie_2009: {required: true, number:true},   
               
                pro_2005: {required: true, number:true},       
                pro_2006: {required: true, number:true},       
                pro_2007: {required: true, number:true},       
                pro_2008: {required: true, number:true},       
                pro_2009: {required: true, number:true},     
               
                otr_2005: {required: true, number:true},       
                otr_2006: {required: true, number:true},       
                otr_2007: {required: true, number:true},       
                otr_2008: {required: true, number:true},       
                otr_2009: {required: true, number:true}    

            },
            messages: {
                simce4_len_2005: "ingrese un número",
                simce4_len_2006: "ingrese un número",
                simce4_len_2007: "ingrese un número",
                simce4_len_2008: "ingrese un número",
                simce4_len_2009: "ingrese un número",
               
                simce4_mat_2005: "ingrese un número",
                simce4_mat_2006: "ingrese un número",
                simce4_mat_2007: "ingrese un número",
                simce4_mat_2008: "ingrese un número",
                simce4_mat_2009: "ingrese un número",
               
                simce4_med_2005: "ingrese un número",
                simce4_med_2006: "ingrese un número",
                simce4_med_2007: "ingrese un número",
                simce4_med_2008: "ingrese un número",
                simce4_med_2009: "ingrese un número",
               
                simce8_len_2005: "ingrese un número",
                simce8_len_2006: "ingrese un número",
                simce8_len_2007: "ingrese un número",
                simce8_len_2008: "ingrese un número",
                simce8_len_2009: "ingrese un número",
               
                simce8_mat_2005: "ingrese un número",
                simce8_mat_2006: "ingrese un número",
                simce8_mat_2007: "ingrese un número",
                simce8_mat_2008: "ingrese un número",
                simce8_mat_2009: "ingrese un número",
               
                simce8_med_2005: "ingrese un número",
                simce8_med_2006: "ingrese un número",
                simce8_med_2007: "ingrese un número",
                simce8_med_2008: "ingrese un número",
                simce8_med_2009: "ingrese un número",
               
                simce2_len_2005: "ingrese un número",
                simce2_len_2006: "ingrese un número",
                simce2_len_2007: "ingrese un número",
                simce2_len_2008: "ingrese un número",
                simce2_len_2009: "ingrese un número",
               
                simce2_mat_2005: "ingrese un número",
                simce2_mat_2006: "ingrese un número",
                simce2_mat_2007: "ingrese un número",
                simce2_mat_2008: "ingrese un número",
                simce2_mat_2009: "ingrese un número",
               
                simce2_med_2005: "ingrese un número",
                simce2_med_2006: "ingrese un número",
                simce2_med_2007: "ingrese un número",
                simce2_med_2008: "ingrese un número",
                simce2_med_2009: "ingrese un número",
               
                psu_len_2005: "ingrese un número",   
                psu_len_2006: "ingrese un número",   
                psu_len_2007: "ingrese un número",   
                psu_len_2008: "ingrese un número",   
                psu_len_2009: "ingrese un número",   
               
                psu_mat_2005: "ingrese un número",   
                psu_mat_2006: "ingrese un número",   
                psu_mat_2007: "ingrese un número",   
                psu_mat_2008: "ingrese un número",   
                psu_mat_2009: "ingrese un número",   
               
                psu_cie_2005: "ingrese un número",   
                psu_cie_2006: "ingrese un número",   
                psu_cie_2007: "ingrese un número",   
                psu_cie_2008: "ingrese un número",   
                psu_cie_2009: "ingrese un número",   
               
                pro_2005: "ingrese un número",       
                pro_2006: "ingrese un número",       
                pro_2007: "ingrese un número",       
                pro_2008: "ingrese un número",       
                pro_2009: "ingrese un número",     
               
                otr_2005: "ingrese un número",       
                otr_2006: "ingrese un número",       
                otr_2007: "ingrese un número",       
                otr_2008: "ingrese un número",       
                otr_2009: "ingrese un número"  

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
                GuardarResultados(codest);
            }
        });

    });
//]]> 
</script>                                                                                                                                                                                                                                                                                 
<form id="frmResultadosNueva">                                                                                                                                                                                                                                                   
    <div class="fondo_dimensionamiento">                                                                                                                                                                                                                                         
        <table border="0" cellspacing="0" cellpadding="0">                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">SIMCE 4° Básico últimos 5 años en distintos subsectores</b></th>                  
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Lenguaje</th>                                                                                                                                                                                                                                                
                <td><input type="text" size="1" name="simce4_len_2005" id="simce4_len_2005" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce4_len_2006" id="simce4_len_2006" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce4_len_2007" id="simce4_len_2007" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce4_len_2008" id="simce4_len_2008" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce4_len_2009" id="simce4_len_2009" value=""/></td> 
                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
                <th>Matemática</th>                                                                                                                                                                                                                                              
                <td><input type="text" size="1" name="simce4_mat_2005" id="simce4_mat_2005"  value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce4_mat_2006" id="simce4_mat_2006"  value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce4_mat_2007" id="simce4_mat_2007"  value=""/></td> 
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce4_mat_2008" id="simce4_mat_2008"  value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce4_mat_2009" id="simce4_mat_2009"  value=""/></td> 
                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Comprensión<br /> del Medio</th>                                                                                                                                                                                                                 
                <td><input type="text" size="1" name="simce4_med_2005" id="simce4_med_2005" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce4_med_2006" id="simce4_med_2006" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce4_med_2007" id="simce4_med_2007" value=""/></td> 
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce4_med_2008" id="simce4_med_2008" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce4_med_2009" id="simce4_med_2009" value=""/></td> 
                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">SIMCE 8° Básico últimos 5 años en distintos subsectores</b></th>                 
            </tr>                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Lenguaje</th>                                                                                                                                                                                                                                                
                <td><input type="text" size="1" name="simce8_len_2005" id="simce8_len_2005" value=""/></td>  
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce8_len_2006" id="simce8_len_2006" value=""/></td>   
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce8_len_2007" id="simce8_len_2007" value=""/></td> 
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce8_len_2008" id="simce8_len_2008" value=""/></td>   
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce8_len_2009" id="simce8_len_2009" value=""/></td>                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                  
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Matemática</th>                                                                                                                                                                                                                                              
                <td><input type="text" size="1" name="simce8_mat_2005" id="simce8_mat_2005" value=""/></td> 
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce8_mat_2006" id="simce8_mat_2006" value=""/></td>    
                                                                                                                                                                                                                         
                <td><input type="text" size="1" name="simce8_mat_2007" id="simce8_mat_2007" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce8_mat_2008" id="simce8_mat_2008" value=""/></td>    
                                                                                                                                                                                                                         
                <td><input type="text" size="1" name="simce8_mat_2009" id="simce8_mat_2009" value=""/></td>  
                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Comprensión<br /> del Medio</th>                                                                                                                                                                                                                 
                <td><input type="text" size="1" name="simce8_med_2005" id="simce8_med_2005" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce8_med_2006" id="simce8_med_2006" value=""/></td> 
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce8_med_2007" id="simce8_med_2007" value=""/></td>
                                                                                                                                                                                                                             
                <td><input type="text" size="1" name="simce8_med_2008" id="simce8_med_2008" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce8_med_2009" id="simce8_med_2009" value=""/></td>  
                                                                                                                                                                                                  
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">SIMCE 2° Medio últimos 5 años en distintos subsectores</b></th>                  
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                
           <tr>                                                                                                                                                                                                                                                                  
                <th>Lenguaje</th>                                                                                                                                                                                                                                                
                <td><input type="text" size="1" name="simce2_len_2005" id="simce2_len_2005" value=""/></td> 
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce2_len_2006" id="simce2_len_2006" value=""/></td>     
                                                                                                                                                                                                                        
                <td><input type="text" size="1" name="simce2_len_2007" id="simce2_len_2007" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_len_2008" id="simce2_len_2008" value=""/></td>  
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_len_2009" id="simce2_len_2009" value=""/></td>
                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Matemática</th>                                                                                                                                                                                                                                              
                <td><input type="text" size="1" name="simce2_mat_2005" id="simce2_mat_2005" value=""/></td>
                                                                                                                                                                                                                            
                <td><input type="text" size="1" name="simce2_mat_2006" id="simce2_mat_2006" value=""/></td>      
                                                                                                                                                                                                                      
                <td><input type="text" size="1" name="simce2_mat_2007" id="simce2_mat_2007" value=""/></td> 
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_mat_2008" id="simce2_mat_2008" value=""/></td> 
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_mat_2009" id="simce2_mat_2009" value=""/></td> 
                                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Comprensión<br /> del Medio</th>                                                                                                                                                                                                                 
                <td><input type="text" size="1" name="simce2_med_2005" id="simce2_med_2005" value=""/></td> 
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_med_2006" id="simce2_med_2006" value=""/></td>    
                                                                                                                                                                                                                        
                <td><input type="text" size="1" name="simce2_med_2007" id="simce2_med_2007" value=""/></td>   
                                                                                                                                                                                                                         
                <td><input type="text" size="1" name="simce2_med_2008" id="simce2_med_2008" value=""/></td> 
                                                                                                                                                                                                                           
                <td><input type="text" size="1" name="simce2_med_2009" id="simce2_med_2009" value=""/></td> 
                                                                                                                                                                                                                            
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">PSU Lenguaje últimos 5 años</b></th>                                             
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Lenguaje</th>                                                                                                                                                                                                                                                
                <td><input size="1" type="text" name="psu_len_2005" id="psu_len_2005"  value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_len_2006" id="psu_len_2006"  value=""/></td> 
                                                                                                                                                                                                                
                <td><input size="1" type="text" name="psu_len_2007" id="psu_len_2007"  value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_len_2008" id="psu_len_2008"  value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_len_2009" id="psu_len_2009"  value=""/></td>                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                  
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">PSU Matemática últimos 5 años</b></th>                                           
            </tr>                                                                                                                                                                                                                                                                
             <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
                <th>Matemática</th>                                                                                                                                                                                                                                              
                <td><input size="1" type="text" name="psu_mat_2005" id="psu_mat_2005" value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_mat_2006" id="psu_mat_2006" value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_mat_2007" id="psu_mat_2007" value=""/></td>    
                                                                                                                                                                                                             
                <td><input size="1" type="text" name="psu_mat_2008" id="psu_mat_2008" value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_mat_2009" id="psu_mat_2009" value=""/></td> 
                                                                                                                                                                                                                                                         
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">PSU Ciencias últimos 5 años</b></th>                                             
            </tr>                                                                                                                                                                                                                                                                
             <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
                <th>Ciencias</th>                                                                                                                                                                                                                                                
                <td><input size="1" type="text" name="psu_cie_2005" id="psu_cie_2005" value=""/></td>
                                                                                                                                                                                                                 
                <td><input size="1" type="text" name="psu_cie_2006" id="psu_cie_2006" value=""/></td>   
                                                                                                                                                                                                              
                <td><input size="1" type="text" name="psu_cie_2007" id="psu_cie_2007" value=""/></td>    
                                                                                                                                                                                                             
                <td><input size="1" type="text" name="psu_cie_2008" id="psu_cie_2008" value=""/></td>  
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="psu_cie_2009" id="psu_cie_2009" value=""/></td>
                                                                                                                                                                                                                                                        
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Promedios Rendimientos</b></th>                                                  
            </tr>                                                                                                                                                                                                                                                                
             <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                                 
            <tr>                                                                                                                                                                                                                                                                 
                <th>Promedios</th>                                                                                                                                                                                                                                               
                <td><input size="1" type="text" name="pro_2005" id="pro_2005" value=""/></td> 
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="pro_2006" id="pro_2006" value=""/></td> 
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="pro_2007" id="pro_2007" value=""/></td> 
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="pro_2008" id="pro_2008" value=""/></td>   
                                                                                                                                                                                                             
                <td><input size="1" type="text" name="pro_2009" id="pro_2009" value=""/></td>                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
            <th colspan="11" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Otras Evaluaciones Externas o internas (ej: PCA, Pruebas de Nivel, etc.)</b></th>
            </tr>                                                                                                                                                                                                                                                                
              <tr>                                                                                                                                                                                                                                                                 
                <th>&nbsp;</th>                                                                                                                                                                                                                                                  
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2005</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2006</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2007</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2008</th>                                                                                                                                                          
                <th style="color:#E78F08;font:bold 12px Tahoma, Arial, Helvetica, sans-serif; text-align:left">2009</th>                                                                                                                                                          
            </tr>                                                                                                                                                                                                                                                                                
            <tr>                                                                                                                                                                                                                                                                 
                <th>Otras Evaluaciones</th>                                                                                                                                                                                                                                      
                <td><input size="1" type="text" name="otr_2005" id="otr_2005" value=""/></td> 
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="otr_2006" id="otr_2006" value=""/></td>
                                                                                                                                                                                                                
                <td><input size="1" type="text" name="otr_2007" id="otr_2007" value=""/></td> 
                                                                                                                                                                                                               
                <td><input size="1" type="text" name="otr_2008" id="otr_2008" value=""/></td>  
                                                                                                                                                                                                              
                <td><input size="1" type="text" name="otr_2009" id="otr_2009" value=""/></td> 
                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                 
            </tr>                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                 
         </table>                                                                                                                                                                                                                                                                
     </div>                                                                                                                                                                                                                                                                      
     <!--<div class="bottom_dimensionamiento"></div>-->                                                                                                                                                                                                                          
     <p style="text-align:center">                                                                                                                                                                                                                             
        <input type="submit" value="ENVIAR" />                                                                                                                                                                                                                                   
        <input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla5','#formulario5')" />                                                                                                                                                      
     </p>                                                                                                                                                                                                                                                                        
</form>                                                                                                                                                                                                                                                                          