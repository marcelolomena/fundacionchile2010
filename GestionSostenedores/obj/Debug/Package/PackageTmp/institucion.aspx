<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="institucion.aspx.cs" Inherits="GestionSostenedores.institucion" %>

<script id="institucion" type="text/javascript">
        <%
            Response.Write("var codusu='" + Request["codusu"] + "';");
            Response.Write("var accion='" + Request["accion"] + "';");
        %>

      $(document).ready(function () {


        $("input:button, input:submit").button();


        if(accion=='edit'){

         var jsonStr = "{codusu:'" + codusu + "'}";
          var estado="";

          $.ajax({
              type: "POST",
              url: "/institucion.aspx/ObtenerInstitucion",
              data: jsonStr,
              contentType: "application/json",
              dataType: "json",
              timeout: 10000,
              success: function (response) {
                  var objJson = JSON.parse(response.d);
                  //alert(objJson.institucion[0]["IDENTIFICACION_NOMBRE"]);
                  $("#IDENTIFICACION_NOMBRE").attr('value', objJson.institucion[0]["IDENTIFICACION_NOMBRE"]);

                  $("#CODDEP option[value='" + objJson.institucion[0]["CODDEP"] + "']").attr('selected',true);

                  $("#IDENTIFICACION_REPRESENTANTELEGAL").attr('value', objJson.institucion[0]["IDENTIFICACION_REPRESENTANTELEGAL"]);

                  $("#CODCAR option[value='" + objJson.institucion[0]["CODCAR"] + "']").attr('selected',true);


                  $("#IDENTIFICACION_DIRECCION").attr('value', objJson.institucion[0]["IDENTIFICACION_DIRECCION"]);

                  $("#region option[value='" + objJson.institucion[0]["CODREG"] + "']").attr('selected',true);

                  var strComunas="";
                  $.each(objJson.comunas, function(i,com){
                    strComunas += "<option value=\"" + com.CODCOM + "\">" + com.NOMCOM + "</option>";
                  });
                  $("#CODCOM").html(strComunas);

                  $("#CODCOM option[value='" + objJson.institucion[0]["CODCOM"] + "']").attr('selected',true);


                  $("#IDENTIFICACION_FONO1").attr('value', objJson.institucion[0]["IDENTIFICACION_FONO1"]);
                  $("#IDENTIFICACION_FONO2").attr('value', objJson.institucion[0]["IDENTIFICACION_FONO2"]);
                  $("#IDENTIFICACION_FAX").attr('value', objJson.institucion[0]["IDENTIFICACION_FAX"]);
                  $("#IDENTIFICACION_CELULAR").attr('value', objJson.institucion[0]["IDENTIFICACION_CELULAR"]);
                  $("#IDENTIFICACION_EMAIL1").attr('value', objJson.institucion[0]["IDENTIFICACION_EMAIL1"]);
                  $("#IDENTIFICACION_EMAIL2").attr('value', objJson.institucion[0]["IDENTIFICACION_EMAIL2"]);
                  $("#IDENTIFICACION_CONTACTO_NOMBRE").attr('value', objJson.institucion[0]["IDENTIFICACION_CONTACTO_NOMBRE"]);
                  $("#IDENTIFICACION_CONTACTO_EMAIL").attr('value', objJson.institucion[0]["IDENTIFICACION_CONTACTO_EMAIL"]);
                  $("#IDENTIFICACION_CONTACTO_FONO").attr('value', objJson.institucion[0]["IDENTIFICACION_CONTACTO_FONO"]);
                  $("#IDENTIFICACION_SITIOWEB").attr('value', objJson.institucion[0]["IDENTIFICACION_SITIOWEB"]);

              }, /*success*/
              error: function (msg) {
                  jAlert("intentelo mas tarde", "Error");
              },
              complete: function (objeto, exito) {

              }
          });
        }

          $("#frm_identificacion").validate({
              rules: {
                    IDENTIFICACION_NOMBRE:{required: true,minlength: 10},
                    IDENTIFICACION_REPRESENTANTELEGAL:{required: true,minlength: 10}, 
                    IDENTIFICACION_DIRECCION:{required:true,minlength: 10},
                    IDENTIFICACION_FONO1:{required: true, number:true},
                    IDENTIFICACION_FONO2:{required: true, number:true},
                    IDENTIFICACION_FAX:{required: true, number:true},
                    IDENTIFICACION_CELULAR:{required: true, number:true},
                    IDENTIFICACION_EMAIL1:{required: true,email:true},
                    IDENTIFICACION_EMAIL2:{required: true,email:true},
                    IDENTIFICACION_CONTACTO_NOMBRE:{required: true,minlength: 10},
                    IDENTIFICACION_CONTACTO_EMAIL:{required: true,email:true},
                    IDENTIFICACION_CONTACTO_FONO:{required: true, number:true},
                    IDENTIFICACION_SITIOWEB:{required: true,minlength:3}
              },
              messages: {
                IDENTIFICACION_NOMBRE: "nombre",
                IDENTIFICACION_REPRESENTANTELEGAL: "nombre",
                IDENTIFICACION_DIRECCION: "dirección",
                IDENTIFICACION_FONO1: "teléfono",
                IDENTIFICACION_FONO2: "teléfono",
                IDENTIFICACION_FAX: "fax",
                IDENTIFICACION_CELULAR: "celular",
                IDENTIFICACION_EMAIL1: "email",
                IDENTIFICACION_EMAIL2: "email",
                IDENTIFICACION_CONTACTO_NOMBRE: "nombre",
                IDENTIFICACION_CONTACTO_EMAIL: "nombre",
                IDENTIFICACION_CONTACTO_FONO: "teléfono",
                IDENTIFICACION_SITIOWEB: "web"

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
                  GuardarInstitucion(codusu);
              }
          });

      });

$("#region").change(function(){
	    var region_id 	=	$('#region').val();
	    var jsonStr = "{codreg:'" + region_id + "'}";
       
        var comunas="";
	    $.ajax({
	        type: "POST",
	        url: "/institucion.aspx/ObtenerComunaPorRegion",
	        data: jsonStr,
	        contentType: "application/json",
	        dataType: "json",
	        timeout: 10000,
	        success: function (response) {
                  var objJson = JSON.parse(response.d);
                  $.each(objJson.comunas, function(i,com){
                    comunas += "<option value=\"" + com.CODCOM + "\">" + com.NOMCOM + "</option>";
                  });
                  $("#CODCOM").html(comunas);
	        },
	        error: function (msg) {
	            //jAlert("intentelo mas tarde", "Error");
	        }
	    });

});
</script>
<form id="frm_identificacion">
<div class="fondo_dimensionamiento">
    <table border="0" cellspacing="0" cellpadding="0">
    <tr>
    <th colspan="2" style="border-bottom: 2px solid #EBEBEB;"><b style="margin: 0px; padding: 0px 0px 8px 10px; font-weight:normal;color: #1C94C4; font-weight: bold; font-size: 14px;">Identificaci&oacute;n Sostenedor</b></th>
    </tr>
      <tr>
	  	<th class="label"><label id="XIDENTIFICACION_NOMBRE" for="IDENTIFICACION_NOMBRE">Nombre Instituci&oacute;n Sostenedora</label></th>
  	<td class="field"><input id="IDENTIFICACION_NOMBRE" name="IDENTIFICACION_NOMBRE" type="text" maxlength="100" value="" size="50"/></td>
        
      </tr>
      <tr>
        <th class="label"><label id="XCODDEP" for="CODDEP">Dependencia de la Instituci&oacute;n</label></th>
        <td><select name="CODDEP" id="CODDEP">
          <option value="1">Corporación Municipal</option>
          <option value="2">Departamento de Educación Municipal</option>
          <option value="3">Particular Subvencionado</option>
          <option value="4">Particular Pagado</option>
          <option value="5">Corporación Privada</option>
        </select></td>
        
      </tr>

      <tr>
	  	<th class="label"><label id="XIDENTIFICACION_REPRESENTANTELEGAL" for="IDENTIFICACION_REPRESENTANTELEGAL">Representante Legal</label></th>
  	<td class="field"><input id="IDENTIFICACION_REPRESENTANTELEGAL" name="IDENTIFICACION_REPRESENTANTELEGAL" type="text" maxlength="50" value="" /></td>
      </tr>
      <tr>
        <th>Cargo Representante Legal</th>
        <td><select name="CODCAR" id="CODCAR">
          <option value="1">Gerente</option>
          <option value="2">Director Educación</option>
          <option value="3">Jefe</option>
          <option value="4">Otro</option>
        </select></td>
      </tr>

      <tr>
        <th>Direcci&oacute;n</th>
        <td><input name="IDENTIFICACION_DIRECCION" type="text" id="IDENTIFICACION_DIRECCION" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Regi&oacute;n</th>
        <td><select name="region" id="region">
        <option value="1">Tarapacá</option>   
        <option value="2">Antofagasta</option>
        <option value="3">Atacama</option>    
        <option value="4">Coquimbo</option>   
        <option value="5">Valparaíso</option> 
        <option value="6">Libertador General Bernardo O'Higgins</option>
        <option value="7">Maule</option>      
        <option value="8">Biobío</option>     
        <option value="9">La Araucanía</option>
        <option value="10">Los Lagos</option>
        <option value="11">Aisén del General Carlos Ibáñez del Campo</option> 
        <option value="12">Magallanes y de la Antártica Chilena</option>      
        <option value="13">Región Metropolitana de Santiago</option>          
        <option value="14">De los Ríos</option>                              
        <option value="15">Arica Parinacota</option>                          
        </select></td>
        
      </tr>

      <tr>
        <th>Comuna</th>
        <td><select name="CODCOM" id="CODCOM"></select></td>
        
      </tr>

      <tr>
        <th>Fono 1</th>
        <td><input name="IDENTIFICACION_FONO1" type="text" id="IDENTIFICACION_FONO1" size="50" value="" /></td>
        
      </tr>


      <tr>
        <th>Fono 2</th>
        <td><input name="IDENTIFICACION_FONO2" type="text" id="IDENTIFICACION_FONO2" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Fono FAX</th>
        <td><input name="IDENTIFICACION_FAX" type="text" id="IDENTIFICACION_FAX" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Celular</th>
        <td><input name="IDENTIFICACION_CELULAR" type="text" id="IDENTIFICACION_CELULAR" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>E-mail 1</th>
        <td><input name="IDENTIFICACION_EMAIL1" type="text" id="IDENTIFICACION_EMAIL1" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>E-mail 2</th>
        <td><input name="IDENTIFICACION_EMAIL2" type="text" id="IDENTIFICACION_EMAIL2" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Nombre Contacto</th>
        <td><input name="IDENTIFICACION_CONTACTO_NOMBRE" type="text" id="IDENTIFICACION_CONTACTO_NOMBRE" size="50" value="" /></td>
        
      </tr>


      <tr>
        <th>E-mail contacto</th>
        <td><input name="IDENTIFICACION_CONTACTO_EMAIL" type="text" id="IDENTIFICACION_CONTACTO_EMAIL" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Fono Contacto</th>
        <td><input name="IDENTIFICACION_CONTACTO_FONO" type="text" id="IDENTIFICACION_CONTACTO_FONO" size="50" value="" /></td>
        
      </tr>

      <tr>
        <th>Sitio web</th>
        <td><input name="IDENTIFICACION_SITIOWEB" type="text" id="IDENTIFICACION_SITIOWEB" size="50" value="" /></td>
        
      </tr>


    </table>
 </div>

<!--<p id="boton_enviar" style="text-align:center">-->
<p style="text-align:center">
<input type="submit" value="ENVIAR" />
<input type="button" name="cancelar" value="CANCELAR" onclick="Cancelar('#tabla1','#formulario1')" />
</p>
</form>