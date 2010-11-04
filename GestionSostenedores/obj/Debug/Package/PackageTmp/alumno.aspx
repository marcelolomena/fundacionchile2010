<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alumno.aspx.cs" Inherits="GestionSostenedores.alumno" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n Escolar de Calidad</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/funciones.js"></script>
</head>

<body>

<uc1:encabezado ID="cabecita" runat="server"/>

<div id="internas">
  <h1><strong>Instrumento Piloto de Autoevaluación Gestión Sostenedores
Fuente: Alumnos</strong></h1>
  <p>Una organizaci&oacute;n que desea  progresar, debe conocer sus fortalezas y debilidades, para reafirmar las  primeras y superar gradualmente las &uacute;ltimas.</p>
  <p>La finalidad del presente  cuestionario es facilitar el auto conocimiento de su gesti&oacute;n, recogiendo su  opini&oacute;n y recogiendo las opiniones de la comunidad educativa, de modo de  generar informaci&oacute;n que facilite la elaboraci&oacute;n de planes de mejoramiento, que  permitan optimizar la calidad de la gesti&oacute;n y de la educaci&oacute;n que est&aacute;  proporcionando. </p>
  <p>El trabajo que le solicitamos  al responder este cuestionario es muy importante para esta instituci&oacute;n, ya que  s&oacute;lo usted puede comunicar lo que piensa y siente de ella.</p>
  <p>El cuestionario es an&oacute;nimo. Le  solicitamos que no se reste a esta iniciativa y que responda la totalidad del  instrumento. En este cuestionario no hay respuestas correctas ni incorrectas;  se trata de obtener su opini&oacute;n sincera y responsable.</p>
  <h3><strong>INSTRUCCIONES:</strong></h3>
  <p>1.- El cuestionario est&aacute; estructurado en dos secciones  principales:</p>
  <p>En la primera parte se consulta el grado de satisfacci&oacute;n,  participaci&oacute;n y conocimiento que usted tiene frente a diversas tem&aacute;ticas  organizacionales y respecto a su rol institucional.</p>
  <p>En la segunda parte, se consulta en relaci&oacute;n al grado de mejor&iacute;a  de varios aspectos.</p>
  <p>2.- Para cada una de las secciones, siga atentamente las  instrucciones</p>
  <form action="#" method="post">
    
    <div class="fondo_formularios">
      <p>I.- En la primera parte, en relaci&oacute;n a cada afirmaci&oacute;n, nos interesa  conocer el grado de acuerdo que usted tiene con las afirmaciones que se hacen.  Para ello, debe marcar la opci&oacute;n en el casillero que corresponda a su opini&oacute;n.  El significado de los n&uacute;meros es el siguiente:</p>
        <p><input type="radio" name="grado_acuerdo" id="grado_acuerdo_0" value="radio" /><label for="grado_acuerdo_0"> Muy en desacuerdo</label><br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_1" value="radio" /><label for="grado_acuerdo_1"> En desacuerdo</label> <br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_2" value="radio" /><label for="grado_acuerdo_2"> De acuerdo </label><br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_3" value="radio" /><label for="grado_acuerdo_3"> Muy de acuerdo </label><br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_4" value="radio" /><label for="grado_acuerdo_4"> No se aplica (si no tiene informaci&oacute;n o no corresponde la pregunta)</label></p>
    </div>
    <div class="bottom_formularios">&nbsp;</div>
    
    <!-- BLOQUE UNO -->
    <div id="bloque_uno">
    <p class="tit_formularios"><a href="#">1. LIDERAZGO ESTRATEGICO EDUCATIVO</a></p>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
      	<tr>
        <th colspan="7">DIMENSI&Oacute;N<br />
        1.1 (Liderazgo y cambio educativo)</th>
      </tr>
      </thead>
      <tr>
        <td><strong>Nro.</strong></td>
        <td style="border-right: none;"><strong>&Iacute;tems</strong></td>
        <td colspan="5" class="center" style="border-left: none;"><strong>Opciones de Respuesta</strong></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td class="center">1</td>
        <td class="center">2</td>
        <td class="center">3</td>
        <td class="center">4</td>
        <td class="center">5</td>
      </tr>
      <tr>
        <td>1</td>
        <td><p>El&nbsp;    sostenedor promueve una cultura organizacional basada en la calidad de    la educaci&oacute;n y en la equidad del sistema de ense&ntilde;anza</p></td>
        <td class="center"><input type="radio" name="p1" id="radio1" value="1" /></td>
        <td class="center"><input type="radio" name="p1" id="radio2" value="2" /></td>
        <td class="center"><input type="radio" name="p1" id="radio3" value="3" /></td>
        <td class="center"><input type="radio" name="p1" id="radio4" value="4" /></td>
        <td class="center"><input type="radio" name="p1" id="radio5" value="5" /></td>
      </tr>
      <tr>
        <td>2</td>
        <td><p>La cultural organizacional que promueve el    sostenedor se ve reflejada en el establecimiento.</p></td>
        <td class="center"><input type="radio" name="p2" id="radio6" value="1" /></td>
        <td class="center"><input type="radio" name="p2" id="radio7" value="2" /></td>
        <td class="center"><input type="radio" name="p2" id="radio8" value="3" /></td>
        <td class="center"><input type="radio" name="p2" id="radio9" value="4" /></td>
        <td class="center"><input type="radio" name="p2" id="radio10" value="5" /></td>
      </tr>
      <tr>
        <td>3</td>
        <td><p>En este establecimiento educacional se promueve    la mejora continua y la innovaci&oacute;n.</p></td>
        <td class="center"><input type="radio" name="p3" id="radio11" value="1" /></td>
        <td class="center"><input type="radio" name="p3" id="radio12" value="2" /></td>
        <td class="center"><input type="radio" name="p3" id="radio13" value="3" /></td>
        <td class="center"><input type="radio" name="p3" id="radio14" value="4" /></td>
        <td class="center"><input type="radio" name="p3" id="radio15" value="5" /></td>
      </tr>
      <tr>
        <td>4</td>
        <td><p>Existen altas expectativas respecto al desempe&ntilde;o    de los alumnos.</p></td>
        <td class="center"><input type="radio" name="p4" id="radio16" value="1" /></td>
        <td class="center"><input type="radio" name="p4" id="radio17" value="2" /></td>
        <td class="center"><input type="radio" name="p4" id="radio18" value="3" /></td>
        <td class="center"><input type="radio" name="p4" id="radio19" value="4" /></td>
        <td class="center"><input type="radio" name="p4" id="radio20" value="5" /></td>
      </tr>
      <tr>
        <td>5</td>
        <td><p>El mejoramiento educativo del establecimiento    esta respaldado por autoridades pol&iacute;ticas e institucionales.</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
      <tr>
        <td>6</td>
        <td><p>El establecimiento fomenta la participaci&oacute;n de    los alumnos y los invita a comprometerse con las iniciativas de cambio y    mejora que se llevan a cabo.</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
      <tr>
        <td>7</td>
        <td><p>Existen canales formales de comunicaci&oacute;n entre el    sostenedor y los alumnos.</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
      <tr>
        <td>8</td>
        <td><p>Los problemas que se presentan en el sistema    educativo son resueltos de manera oportuna y adecuada</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
      <tr>
        <td>9</td>
        <td><p>El sostenedor reconoce los esfuerzos y celebra    con la comunidad cada vez que el establecimiento cumple sus metas</p></td>
        <td class="center"><input type="radio" name="p5" id="radio" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
      	<tr>
        <th colspan="7">        1.2 (Planificaci&oacute;n Estrat&eacute;gica)</th>
      </tr>
      	<tr>
          <td>10</td>
      	  <td><p>Conozco la misi&oacute;n, visi&oacute;n y valores que orientan    el funcionamiento de este establecimiento educacional. </p></td>
      	  <td class="center"><input type="radio" name="p5" id="radio61" value="1" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio62" value="2" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio63" value="3" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio64" value="4" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio65" value="5" /></td>
    	  </tr>
      	<tr>
          <td>11</td>
      	  <td><p>Conozco la pol&iacute;tica educativa del sostenedor</p></td>
      	  <td class="center"><input type="radio" name="p5" id="radio56" value="1" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio57" value="2" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio58" value="3" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio59" value="4" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio60" value="5" /></td>
    	  </tr>
      	<tr>
          <td>12</td>
      	  <td><p>Los alumnos participan en la formulaci&oacute;n del plan    estrat&eacute;gico del sostenedor.</p></td>
      	  <td class="center"><input type="radio" name="p5" id="radio266" value="1" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio267" value="2" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio268" value="3" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio269" value="4" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio270" value="5" /></td>
    	  </tr>
      	<tr>
          <td>13</td>
      	  <td><p>Conozco el plan estrat&eacute;gico del sostenedor.</p></td>
      	  <td class="center"><input type="radio" name="p5" id="radio261" value="1" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio262" value="2" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio263" value="3" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio264" value="4" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio265" value="5" /></td>
    	  </tr>
      	<tr>
          <td>14</td>
      	  <td><p>Conozco el plan anual del sostenedor (PADEM).</p></td>
      	  <td class="center"><input type="radio" name="p5" id="radio256" value="1" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio257" value="2" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio258" value="3" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio259" value="4" /></td>
      	  <td class="center"><input type="radio" name="p5" id="radio260" value="5" /></td>
    	  </tr>
      </thead>
    </table>
    </div>
    <!-- FIN BLOQUE UNO -->
    
    <!-- BLOQUE DOS -->
    <div id="bloque_dos">
    <p class="tit_formularios"><a href="#">2. PROCESOS CURRICULARES Y COMPETENCIAS PROFESIONALES</a></p>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7">            2.1 (Gesti&oacute;n curricular pedag&oacute;gica)</th>
        </tr>
        <tr>
          <td>15</td>
          <td><p>En este establecimiento educacional se consideran    los intereses de los alumnos.</p></td>
          <td class="center"><input type="radio" name="p5" id="radio61" value="1" /></td>
          <td class="center"><input type="radio" name="p5" id="radio62" value="2" /></td>
          <td class="center"><input type="radio" name="p5" id="radio63" value="3" /></td>
          <td class="center"><input type="radio" name="p5" id="radio64" value="4" /></td>
          <td class="center"><input type="radio" name="p5" id="radio65" value="5" /></td>
        </tr>
        <tr>
          <td>16</td>
          <td><p>En el establecimiento se promueven pol&iacute;ticas y un    curriculum educativo que pone &eacute;nfasis en las demandas del entorno productivo    y laboral.</p></td>
          <td class="center"><input type="radio" name="p5" id="radio56" value="1" /></td>
          <td class="center"><input type="radio" name="p5" id="radio57" value="2" /></td>
          <td class="center"><input type="radio" name="p5" id="radio58" value="3" /></td>
          <td class="center"><input type="radio" name="p5" id="radio59" value="4" /></td>
          <td class="center"><input type="radio" name="p5" id="radio60" value="5" /></td>
        </tr>
        <tr>
          <td>17</td>
          <td><p>El sostenedor apoya la implementaci&oacute;n de planes    de mejoramiento en el establecimiento</p></td>
          <td class="center"><input type="radio" name="p5" id="radio46" value="1" /></td>
          <td class="center"><input type="radio" name="p5" id="radio47" value="2" /></td>
          <td class="center"><input type="radio" name="p5" id="radio48" value="3" /></td>
          <td class="center"><input type="radio" name="p5" id="radio49" value="4" /></td>
          <td class="center"><input type="radio" name="p5" id="radio50" value="5" /></td>
        </tr>
      </thead>
      
      <tr>
        <td>18</td>
        <td><p>El sostenedor implementa&nbsp; estrategias de apoyo de acuerdo los    resultados de aprendizajes de los alumnos del establecimiento.</p></td>
        <td class="center"><input type="radio" name="p1" id="radio26" value="1" /></td>
        <td class="center"><input type="radio" name="p1" id="radio27" value="2" /></td>
        <td class="center"><input type="radio" name="p1" id="radio28" value="3" /></td>
        <td class="center"><input type="radio" name="p1" id="radio29" value="4" /></td>
        <td class="center"><input type="radio" name="p1" id="radio30" value="5" /></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 2.2 (Gesti&oacute;n de competencias)</th>
        </tr>
        <tr>
          <td>19</td>
          <td><p>El establecimiento cuenta con personal docente    bien calificado.</p></td>
          <td class="center"><input type="radio" name="p2" id="radio86" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio87" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio88" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio89" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio90" value="5" /></td>
        </tr>
        <tr>
          <td>20</td>
          <td><p>El establecimiento cuenta con personal    administrativo bien calificado.</p></td>
          <td class="center"><input type="radio" name="p3" id="radio81" value="1" /></td>
          <td class="center"><input type="radio" name="p3" id="radio82" value="2" /></td>
          <td class="center"><input type="radio" name="p3" id="radio83" value="3" /></td>
          <td class="center"><input type="radio" name="p3" id="radio84" value="4" /></td>
          <td class="center"><input type="radio" name="p3" id="radio85" value="5" /></td>
        </tr>
      </thead>
    </table>
    </div>
    <!-- FIN BLOQUE DOS -->
    
    <!-- BLOQUE TRES -->
    <div id="bloque_tres">
    <p class="tit_formularios"><a href="#">3. RECURSOS FINANCIEROS Y SERVICIOS DE APOYO</a></p>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 3.1 (Recursos Financieros)</th>
        </tr>
        <tr>
          <td>21</td>
          <td><p>Conozco el presupuesto definido para este  establecimiento.</p></td>
          <td class="center"><input type="radio" name="p1" id="radio211" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio212" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio213" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio214" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio215" value="5" /></td>
        </tr>
      </thead>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 3.2 (Servicios de apoyo)</th>
        </tr>
        <tr>
          <td>22</td>
          <td><p>Existe una adecuada mantenci&oacute;n de la    infraestructura y equipamiento del establecimiento.</p></td>
          <td class="center"><input type="radio" name="p2" id="radio276" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio277" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio278" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio279" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio280" value="5" /></td>
        </tr>
        <tr>
          <td>23</td>
          <td><p>Existen alianzas con instituciones de educaci&oacute;n    superior y/o de asistencia t&eacute;cnica para el mejoramiento del establecimiento.</p></td>
          <td class="center"><input type="radio" name="p3" id="radio271" value="1" /></td>
          <td class="center"><input type="radio" name="p3" id="radio272" value="2" /></td>
          <td class="center"><input type="radio" name="p3" id="radio273" value="3" /></td>
          <td class="center"><input type="radio" name="p3" id="radio274" value="4" /></td>
          <td class="center"><input type="radio" name="p3" id="radio275" value="5" /></td>
        </tr>
        <tr>
          <td>24</td>
          <td><p>Los alumnos del establecimiento cuentan con los    recursos pedag&oacute;gicos y de tecnolog&iacute;a de la informaci&oacute;n necesarios.</p></td>
          <td class="center"><input type="radio" name="p1" id="radio241" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio242" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio243" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio244" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio245" value="5" /></td>
        </tr>
        <tr>
          <td>25</td>
          <td><p>Los servicios de apoyo para los alumnos de este    establecimiento son adecuados (alimentaci&oacute;n, salud, transporte,    extra-curriculares y de orientaci&oacute;n educacional de los estudiantes).</p></td>
          <td class="center"><input type="radio" name="p3" id="radio236" value="1" /></td>
          <td class="center"><input type="radio" name="p3" id="radio237" value="2" /></td>
          <td class="center"><input type="radio" name="p3" id="radio238" value="3" /></td>
          <td class="center"><input type="radio" name="p3" id="radio239" value="4" /></td>
          <td class="center"><input type="radio" name="p3" id="radio240" value="5" /></td>
        </tr>
        <tr>
          <td>26</td>
          <td><p>Existen pol&iacute;ticas de prevenci&oacute;n que aseguran    condiciones adecuadas de higiene y seguridad para el personal escolar y&nbsp; para&nbsp;    los estudiantes.</p></td>
          <td class="center"><input type="radio" name="p4" id="radio231" value="1" /></td>
          <td class="center"><input type="radio" name="p4" id="radio232" value="2" /></td>
          <td class="center"><input type="radio" name="p4" id="radio233" value="3" /></td>
          <td class="center"><input type="radio" name="p4" id="radio234" value="4" /></td>
          <td class="center"><input type="radio" name="p4" id="radio235" value="5" /></td>
        </tr>
      </thead>
    </table>
    </div>
    <!-- FIN BLOQUE TRES -->
    
    <!-- BLOQUE CUATRO -->
    <div id="bloque_cuatro">
    <p class="tit_formularios"><a href="#">4. RESULTADOS</a></p>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7">          4.1 (Orientaci&oacute;n e impacto en la comunidad)</th>
        </tr>
        <tr>
          <td>27</td>
          <td><p>Se consulta mi grado de satisfacci&oacute;n como alumno    respecto del servicio educativo del establecimiento</p></td>
          <td class="center"><input type="radio" name="p4" id="radio226" value="1" /></td>
          <td class="center"><input type="radio" name="p4" id="radio227" value="2" /></td>
          <td class="center"><input type="radio" name="p4" id="radio228" value="3" /></td>
          <td class="center"><input type="radio" name="p4" id="radio229" value="4" /></td>
          <td class="center"><input type="radio" name="p4" id="radio230" value="5" /></td>
        </tr>
        <tr>
          <td>28</td>
          <td><p>En el establecimiento se recoge informaci&oacute;n sobre    la participaci&oacute;n de los alumnos en las instancias y proyectos realizados por    el sostenedor durante el a&ntilde;o.</p></td>
          <td class="center"><input type="radio" name="p2" id="radio221" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio222" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio223" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio224" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio225" value="5" /></td>
        </tr>
      </thead>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 4.2 (Logros educativos)</th>
        </tr>
        <tr>
          <td>29</td>
          <td><p>Los resultados de los estudiantes en las Pruebas  Nacionales son analizados y comparados con los resultados de sostenedores  similares.</p></td>
          <td class="center"><input type="radio" name="p1" id="radio216" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio217" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio218" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio219" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio220" value="5" /></td>
        </tr>
      </thead>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 4.3 (Efectividad de la gesti&oacute;n)</th>
        </tr>
        <tr>
          <td>30</td>
          <td><p>El sostenedor aplica instrumentos de evaluaci&oacute;n  para el desempe&ntilde;o docente y del personal </p></td>
          <td class="center"><input type="radio" name="p1" id="radio31" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio32" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio33" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio34" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio35" value="5" /></td>
        </tr>
      </thead>
    </table>
    </div>
    <!-- FIN BLOQUE CUATRO -->
    
    <!-- BLOQUE CINCO -->
    <div id="bloque_cinco">
    <p class="tit_formularios"><a href="#">5. RELACIONES CON LA COMUNIDAD</a></p>
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 5.1 (Participaci&oacute;n y atenci&oacute;n a la comunidad)</th>
        </tr>
        
        <tr>
          <td>31</td>
          <td><p>El sostenedor mantiene diversos mecanismos de    comunicaci&oacute;n y apoyo para incentivar la participaci&oacute;n de los alumnos (en el    consejo escolar, consejo de profesores, centro de padres, cento de alumnos).</p></td>
          <td class="center"><input type="radio" name="p2" id="radio151" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio152" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio153" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio154" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio155" value="5" /></td>
        </tr>
        <tr>
          <td>32</td>
          <td><p>Conozco los procedimientos a seguir para resolver    mis inquietudes y reclamos al interior del establecimiento y a nivel de    sostenedor.</p></td>
          <td class="center"><input type="radio" name="p2" id="radio141" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio142" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio143" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio144" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio145" value="5" /></td>
        </tr>
        <tr>
          <td>33</td>
          <td><p>El establecimiento, junto al sostenedor, realiza    esfuerzos para que crezca el inter&eacute;s y la participaci&oacute;n de los padres y apoderados    en la educaci&oacute;n de sus hijos.</p></td>
          <td class="center"><input type="radio" name="p1" id="radio136" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio137" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio138" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio139" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio140" value="5" /></td>
        </tr>
      </thead>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 5.2 (Comunicaci&oacute;n y rendici&oacute;n de cuentas)</th>
        </tr>
        <tr>
          <td>34</td>
          <td><p>Existe informaci&oacute;n sobre los resultados de    aprendizaje y las mejoras obtenidas por el establecimiento en los programas    educativos</p></td>
          <td class="center"><input type="radio" name="p1" id="radio126" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio127" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio128" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio129" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio130" value="5" /></td>
        </tr>
        <tr>
          <td>35</td>
          <td><p>El sostenedor informa constantemente a la    comunidad educativa sobre los logros alcanzados y cambios realizados a nivel    de gesti&oacute;n interna y de recursos (administrativos y financieros).</p></td>
          <td class="center"><input type="radio" name="p1" id="radio76" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio77" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio78" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio79" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio80" value="5" /></td>
        </tr>
        <tr>
          <td>36</td>
          <td><p>La rendici&oacute;n de cuentas del sostenedor es formal,    peri&oacute;dica y sistem&aacute;tica. </p></td>
          <td class="center"><input type="radio" name="p2" id="radio71" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio72" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio73" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio74" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio75" value="5" /></td>
        </tr>
      </thead>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
        <tr>
          <th colspan="7"> 5.3 (Redes Institucionales y sociales)</th>
        </tr>
        <tr>
          <td>37</td>
          <td><p>El sostenedor articula y coordinar&nbsp; acciones en conjunto con redes locales y    asociaciones publico-privadas</p></td>
          <td class="center"><input type="radio" name="p2" id="radio71" value="1" /></td>
          <td class="center"><input type="radio" name="p2" id="radio72" value="2" /></td>
          <td class="center"><input type="radio" name="p2" id="radio73" value="3" /></td>
          <td class="center"><input type="radio" name="p2" id="radio74" value="4" /></td>
          <td class="center"><input type="radio" name="p2" id="radio75" value="5" /></td>
        </tr>
        <tr>
          <td>38</td>
          <td><p>El sostenedor establece alianzas con redes    externas, como por ejemplo: universidades, institutos, empresas, ONG's, etc.</p></td>
          <td class="center"><input type="radio" name="p1" id="radio66" value="1" /></td>
          <td class="center"><input type="radio" name="p1" id="radio67" value="2" /></td>
          <td class="center"><input type="radio" name="p1" id="radio68" value="3" /></td>
          <td class="center"><input type="radio" name="p1" id="radio69" value="4" /></td>
          <td class="center"><input type="radio" name="p1" id="radio70" value="5" /></td>
        </tr>
      </thead>
    </table>
    </div>
    <!-- FIN BLOQUE CINCO -->
    
    <div class="fondo_formularios">
    <p>&iquest;Usted considera que esta primera secci&oacute;n de la  encuesta mide su grado de satisfacci&oacute;n, conocimiento y/o participaci&oacute;n? (por  favor marque con una X la respuesta que mejor lo representa):</p>
    <p class="txt_destacado"><label for="grado_satisfacion_01">S&iacute;</label> <input type="radio" name="grado_satisfacion" id="grado_satisfacion_01" value="Si" /> <label for="grado_satisfacion_02">No</label><input type="radio" name="grado_satisfacion" id="grado_satisfacion_02" value="No" /></p>
    </div>

	<div class="bottom_formularios">&nbsp;</div>

    <div class="fondo_formularios">
        <p>II. A continuaci&oacute;n, le  solicitamos nos escriba sus sugerencia(s) o comentario(s) en relaci&oacute;n a la  primera secci&oacute;n de la encuesta que acaba de contestar:</p>
        <p>&iquest;Tiene alguna(s) sugerencia(s) o comentario(s)  que hacer para mejorarla? &iquest;Cu&aacute;l(es)?</p>
        <p><textarea name="comentarios" class="textarea" id="comentarios" cols="" rows=""></textarea></p>
    </div>
    <div class="bottom_formularios">&nbsp;</div>
    
    <div style="clear:both;">&nbsp;</div>
    
        <div class="fondo_formularios">
      <p>IIII.- En esta secci&oacute;n, interesa conocer su opini&oacute;n en  relaci&oacute;n al grado de mejor&iacute;a que la gesti&oacute;n del sostenedor en los 5 aspectos  que se indican.</p>
      <p>Para ello, debe marcar en el casillero que  corresponda a su opini&oacute;n. El significado de los n&uacute;meros es el siguiente:</p>
      <p><input type="radio" name="grado_acuerdo" id="grado_acuerdo_0" value="radio" /><label for="grado_acuerdo_0"></label>
        Necesita mejorar mucho<br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_1" value="radio" /><label for="grado_acuerdo_1"></label>
    Necesita mejorar bastante<br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_2" value="radio" /><label for="grado_acuerdo_2"></label>
    Necesita mejorar poco<br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_3" value="radio" /><label for="grado_acuerdo_3">No requiere mejora</label><br />
    <input type="radio" name="grado_acuerdo" id="grado_acuerdo_4" value="radio" /><label for="grado_acuerdo_4">No sabe</label></p>
    </div>
    <div class="bottom_formularios">&nbsp;</div>
    
    <p class="txt_destacado">A su juicio ¿en qué grado deben mejorar los siguientes aspectos en esta institución?</p>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla_formularios" summary="Liderazgo">
      <thead>
      </thead>
      <tr>
        <td><strong>Nro.</strong></td>
        <td style="border-right: none;"><strong>&Iacute;tems</strong></td>
        <td colspan="5" class="center" style="border-left: none;"><strong>Opciones de Respuesta</strong></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td class="center">1</td>
        <td class="center">2</td>
        <td class="center">3</td>
        <td class="center">4</td>
        <td class="center">5</td>
      </tr>
      <tr>
        <td>41</td>
        <td><p>Liderazgo Estrat&eacute;gico Educativo: La forma en    que el sostenedor conduce su gesti&oacute;n hacia el logro de metas al interior de    los establecimientos educacionales. </p></td>
        <td class="center"><input type="radio" name="p1" id="radio1" value="1" /></td>
        <td class="center"><input type="radio" name="p1" id="radio2" value="2" /></td>
        <td class="center"><input type="radio" name="p1" id="radio3" value="3" /></td>
        <td class="center"><input type="radio" name="p1" id="radio4" value="4" /></td>
        <td class="center"><input type="radio" name="p1" id="radio5" value="5" /></td>
      </tr>
      <tr>
        <td>42</td>
        <td><p>Gesti&oacute;n de los Procesos Curriculares: La manera    en que el sostenedor desarrolla e implementa lo que ha planificado como    modelo pedag&oacute;gico.</p></td>
        <td class="center"><input type="radio" name="p2" id="radio6" value="1" /></td>
        <td class="center"><input type="radio" name="p2" id="radio7" value="2" /></td>
        <td class="center"><input type="radio" name="p2" id="radio8" value="3" /></td>
        <td class="center"><input type="radio" name="p2" id="radio9" value="4" /></td>
        <td class="center"><input type="radio" name="p2" id="radio10" value="5" /></td>
      </tr>
      <tr>
        <td>43</td>
        <td><p>Gesti&oacute;n de las Competencias Profesionales del personal:    La forma en que el sostenedor selecciona, capacita y orienta a los    profesionales. </p></td>
        <td class="center"><input type="radio" name="p3" id="radio11" value="1" /></td>
        <td class="center"><input type="radio" name="p3" id="radio12" value="2" /></td>
        <td class="center"><input type="radio" name="p3" id="radio13" value="3" /></td>
        <td class="center"><input type="radio" name="p3" id="radio14" value="4" /></td>
        <td class="center"><input type="radio" name="p3" id="radio15" value="5" /></td>
      </tr>
      <tr>
        <td>44</td>
        <td><p>Recursos Financieros y Servicios de Apoyo: La    forma en que el sostenedor asegura los recursos para el mejoramiento de    aprendizaje y formaci&oacute;n integral de los alumnos.</p></td>
        <td class="center"><input type="radio" name="p4" id="radio16" value="1" /></td>
        <td class="center"><input type="radio" name="p4" id="radio17" value="2" /></td>
        <td class="center"><input type="radio" name="p4" id="radio18" value="3" /></td>
        <td class="center"><input type="radio" name="p4" id="radio19" value="4" /></td>
        <td class="center"><input type="radio" name="p4" id="radio20" value="5" /></td>
      </tr>
      <tr>
        <td>45</td>
        <td><p>Gesti&oacute;n de Resultados: la atenci&oacute;n que el    sostenedor presta a su efectividad en relaci&oacute;n a sus a sus logros, a su    eficiencia en el uso de recursos y el grado de participaci&oacute;n y satisfacci&oacute;n    de la comunidad educativa.</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
      
      <tr>
        <td>46</td>
        <td><p>Relaciones con la comunidad: las acciones que    el sostenedor efect&uacute;a para establecer una comunicaci&oacute;n efectiva hacia y desde    la comunidad.</p></td>
        <td class="center"><input type="radio" name="p5" id="radio21" value="1" /></td>
        <td class="center"><input type="radio" name="p5" id="radio22" value="2" /></td>
        <td class="center"><input type="radio" name="p5" id="radio23" value="3" /></td>
        <td class="center"><input type="radio" name="p5" id="radio24" value="4" /></td>
        <td class="center"><input type="radio" name="p5" id="radio25" value="5" /></td>
      </tr>
    </table>
    <div style="clear:both;"></div>
    <div class="fondo_formularios">
        <p>Finalmente, le solicitamos nos escriba sus sugerencia(s)  o comentario(s) en relaci&oacute;n a la encuesta que acaba de responder. </p>
        <p><textarea name="comentarios" class="textarea" id="comentarios" cols="" rows=""></textarea></p>
    </div>
    <div class="bottom_formularios">&nbsp;</div>
    
    <p id="boton_enviar" style="text-align:center"><input type="submit" value="ENVIAR" /></p>
    
    
  </form>

 <div style="clear:both;">&nbsp;</div>
<!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>


<!--#include virtual="/include/footer.html"-->

</body>
</html>

