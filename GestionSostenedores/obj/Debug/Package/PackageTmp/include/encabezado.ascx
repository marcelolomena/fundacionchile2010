<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="encabezado.ascx.cs" Inherits="GestionSostenedores.include.encabezado" %>
<div id="header">
	<a href="../Default.aspx"><img src="../images/html/logo.gif" alt="Gesti&oacute;n de Sostenedores" /></a>
    <a href="http://www.codeduc.cl"><img src="../images/html/codeduc_sup.gif" alt="codeduc" /></a>
</div>

<div id="menu_principal">

	<ul>
    	<!--<li id="bot_01"><a href="/work/gestion_escolar/" onmouseover="buttonMouseover(event, 'submenu_modelo');" title="MODELO">MODELO</a></li>-->
        <li id="bot_02"><a href="../esquema.aspx" onmouseover="buttonMouseover(event, 'submenu_ciclo');" title="CICLO MEJORAMIENTO">CICLO MEJORAMIENTO</a></li>
        <li id="bot_03"><a href="../registro.aspx" title="INSCRIPCION SOSTENEDOR">INSCRIPCIÓN SOSTENEDOR</a></li>
        <li id="bot_04"><a href="../formularios.aspx" title="ACCESO">ACCESO</a></li>
        <li id="bot_05"><a href="#" onmouseover="buttonMouseover(event, 'submenu_resultados');" title="RESULTADOS EVALUACION">RESULTADOS EVALUACION</a></li>
        <li id="bot_06"><a href="../faq.aspx" title="PREGUNTAS FRECUENTES">PREGUNTAS FRECUENTES</a></li>
        <li id="bot_07"><a href="#" onmouseover="buttonMouseover(event, 'submenu_contacto');" title="CONTACTO">CONTACTO</a></li>
    </ul>

</div>

<!--MENU MODELO-->
<!--
<div id="submenu_modelo" class="menu" onmouseover="menuMouseover(event)">
    <p><a href="../modelo.aspx" title="Presentación y Descripción del Modelo">Presentación y Descripción del Modelo</a></p>
    <p><a href="#" title="Objetivos">Objetivos</a></p>
    <p class="noborde"><a href="../aplicaciones_del_modelo.aspx" title="Aplicaciones Modelo">Aplicaciones del Modelo</a></p>
</div>
-->
<!--END MENU MODELO-->

<!--MENU CICLO-->
<div id="submenu_ciclo" class="menu" onmouseover="menuMouseover(event)">
    <!--<p><a href="/work/gestion_escolar/registro.php" title="Login o acceso sostenedores registrados">Incripción Nuevo Sostenedor</a></p>
    <p><a href="/work/gestion_escolar/registro.php" title="Login o acceso sostenedores registrados">Login o acceso sostenedores registrados</a></p> -->
    <p><a href="../modelo.aspx" title="Ciclo de Mejoramiento">Ciclo de Mejoramiento</a></p>
    <p><a href="../pdf/cmccuaderno.pdf" target="_blank" title="Cómo implementar el CMC">Cómo implementar el CMC</a></p>
    <p><a href="../registro.aspx" title="Manuales de Uso">Manuales de Uso</a></p>
    <p class="noborde"><a href="../formularios.aspx" title="Formularios">Formularios - Dimensionamiento</a></p>
</div>
<!--END MENU CICLO-->

<!--MENU RESULTADOS-->
<% if (codusu != null)
{%>     
<div id="submenu_resultados" class="menu" onmouseover="menuMouseover(event)">
    <p><a href="javascript:verPagina('../reporte.aspx?codfor=A');" title="Resultados">Resultados</a></p>
    <p class="noborde"><a href="../registro.aspx" title="Reportes de Resultados por Sostenedor">Reportes de Resultados por Sostenedor</a></p>
</div>       
<%}%>

<!--END MENU RESULTADOS-->
 
<!--MENU CONTACTO-->
<div id="submenu_contacto" class="menu" onmouseover="menuMouseover(event)">
    <p><a href="../contacto.aspx" title="DATOS DE CONTACTO">DATOS DE CONTACTO</a></p>
    <p class="noborde"><a href="../registro.aspx" title="FORMULARIO DE REGISTRO">FORMULARIO DE REGISTRO</a></p>
</div>
<!--END MENU CONTACTO--> 


    <div id="iframedivsup2" style="border: solid 2px gray; display: none; background-color: #f3f3f3;
        width: 95%; height: 95%; position: absolute; vertical-align: middle; text-align: center;
        margin: 10px; top: 5px; left: 5px;">
        <table style="width: 100%">
            <tr>
                <td style="padding-left: 20px; width: 85%; text-align: center; font-family: Verdana, Arial;
                    color: gray; font-size: small;">
                    <br />
                    <br />
                </td>
                <td style="width: 15%; text-align: right;">
                    <span id="Span1" style="margin: 5px; padding: 5px; background-color: White;
                        border: solid gray 1px; text-align: center; font-family: Verdana, Arial; color: gray;
                        font-size: small; font-weight: bold; cursor: pointer;" onclick="$('#iframedivsup2').hide(500);">
                        Cerrar[X]</span>
                </td>
            </tr>
        </table>
        <div id="iframedivinner2" style="padding: 10px; height: 90%;">
        </div>
    </div>

    <div id="iframedivsup3" style="border: solid 2px gray; display: none; background-color: #f3f3f3;
        width: 70%; height: 95%; position: absolute; vertical-align: middle; text-align: center;
        margin: 10px; top: 5px; left: 15%;">
        <table style="width: 100%">
            <tr>
                <td style="padding-left: 20px; width: 85%; text-align: center; font-family: Verdana, Arial;
                    color: gray; font-size: small;">
                    <br />
                    <br />
                </td>
                <td style="width: 15%; text-align: right;">
                    <span id="Span2" style="margin: 5px; padding: 5px; background-color: White;
                        border: solid gray 1px; text-align: center; font-family: Verdana, Arial; color: gray;
                        font-size: small; font-weight: bold; cursor: pointer;" onclick="$('#iframedivsup3').hide(500);">
                        Cerrar[X]</span>
                </td>
            </tr>
        </table>
        <div id="iframedivinner3" style="padding: 10px; height: 90%;">
        </div>
    </div>