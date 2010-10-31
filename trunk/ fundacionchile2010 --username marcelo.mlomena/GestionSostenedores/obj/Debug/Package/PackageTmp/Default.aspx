<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionSostenedores._Default" %>
<%@Register Src="include/encabezado.ascx" TagName="encabezado" TagPrefix="uc1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Gesti&oacute;n de Sostenedores</title>
<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/funciones.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="Scripts/jsPopup.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        //goMostrarPopupLoad("algo", "../faq.aspx", 100, 200, 300,"#portada");
        $("a[id^='ver']").click(function (event) {

            var valorID = $(this).attr("href");

            if (valorID == "#a") {
                $("#texto1").fadeOut("slow");
                $("#fotos").fadeOut("slow");
                $("#texto2").fadeIn("slow");
            } else if (valorID == "#b") {
                $("#texto2").fadeOut("slow");
                $("#texto1").fadeIn("slow");
                $("#fotos").fadeIn("slow");
            } 

        });
    });
</script>
</head>

<body>

<uc1:encabezado ID="cabecita" runat="server"/>



<div id="portada">

  <div id="texto1">
      <img src="images/fotos/modelo_portada.gif" alt="Foto" width="472" height="318"/>
      <p>El modelo de gestión de calidad de sostenedores desarrollado por el Área de Educación de Fundación Chile, es un referente que sistematiza los ámbitos y elementos que han sido definidos como claves para la gestión y, que pueden hacer más efectiva la administración educacional en este nivel y, por ende, la calidad de la educación impartida en los establecimientos que están bajo la dependencia de la institución sostenedora.</p>
      <p>Este modelo se fundamenta en una serie de principios, que se fundamentan  en un liderazgo que inspira y promueve la excelencia, que se orienta y focaliza su gestión hacia el logro de los resultados. Del mismo modo, cuando el sostenedor guía su acción a fortalecer las capacidades de gestión internas de los establecimientos, instalando una cultura de mejoramiento continuo, impacta positivamente en éstos, favoreciendo su  responsabilidad. Lo anterior, se complementa a través de la participación amplia de los distintos actores de la comunidad educativa y basado en una toma de decisiones transparentes que favorece el incremento de legitimidad, credibilidad y confianza de los usuarios.</p>
      <p>El modelo proporciona un marco de referencia que está conformado por cinco áreas y un conjunto de doce dimensiones , desde donde  las instituciones sostenedoras pueden  evaluar su desempeño por medio de un mecanismo que les permite comparar la situación en que se encuentran respecto del modelo, en otras palabras, cuánto falta (brecha) para alcanzar lo que se propone. Esto permite definir las mejoras a implementar, orientando y alineando los recursos e iniciativas organizacionales para avanzar en el mejoramiento de la gestión y el logro de las metas estratégicas. <b><a href="#a" id="ver1" >Ver más...</a></b></p>
  </div>
  <div id="fotos">
    <img src="images/fotos/fotos.jpg" alt="Foto" width="275" height="48" />
  </div>
  <div id="texto2" style="display:none">
        <h1><strong>MODELO GESTIÓN DE CALIDAD DE SOSTENEDORES</strong></h1>
        <h3><strong>DEFINICIONES DE LAS AREAS DEL MODELO</strong></h3>
        <p>El Modelo de Gestión de Calidad de Sostenedores considera cinco áreas que se relacionan de manera sistémica e integrada, orientadas hacia el logro de resultados de la organización, de manera tal que éstos puedan mejorar en la medida que se aumente la eficiencia y eficacia de los procesos que los generan.</p>
        <h3><strong>LIDERAZGO ESTRATÉGICO EDUCATIVO</strong></h3>
        <p>Esta primera área señala que el liderazgo del sostenedor resulta clave para impulsar los procesos claves de la institución, que se inician a partir de las altas expectativas que éste comunica respecto del desempeño de todos los actores.  Esta visión se instrumentaliza contando con  el respaldo político e institucional, a través de una planificación estratégica participativa, coherente y articulada, que comunica de manera efectiva las metas orientadas tanto hacia los resultados académicos y formativos.  Lo anterior, en el marco de una cultura de calidad e innovación, asegurando la equidad del sistema de enseñanza y, empoderando a los directores y comprometiendo a sus equipos con los resultados positivos de los procesos de aprendizaje de sus alumnos.</p>
        <h3><strong>PROCESOS CURRICULARES Y COMPETENCIAS PROFESIONALES</strong></h3>
        <p>Esta área asume la necesidad de contar con un modelo pedagógico coherente con el marco educativo nacional, así como con las demandas del entorno y los intereses de sus usuarios. Guía el trabajo de los establecimientos educacionales en base a los estándares establecidos, con un sistema permanente de seguimiento y evaluación de la cobertura curricular, así como de los resultados académicos. Con el fin de asegurar el aprendizaje de todos los alumnos vela por una adecuada gestión de los procesos de enseñanza-aprendizaje, por medio del desarrollo de planes de mejoramiento para sus establecimientos educacionales, entregando apoyo y soporte concreto para su implementación.De igual manera desarrolla perfiles de competencias para los cargos tanto a nivel del sostenedor como de establecimientos educacionales, definiendo e implementando prácticas para el desarrollo profesional, basadas en los objetivos institucionales y en las necesidades del personal a nivel interno y del establecimiento. Considera además los procedimientos de inducción de personal, de apoyo a la gestión de los directores y de seguimiento al desempeño de los directivos y docentes, generando instancias de colaboración entre los establecimientos para reflexionar y difundir buenas prácticas directivas y pedagógicas.</p>
        <h3><strong>RECURSOS FINANCIEROS Y SERVICIOS DE APOYO </strong></h3>
        <p>En el área de recursos financieros y servicios de apoyo el sostenedor asegura los recursos necesarios para el mejoramiento de los aprendizajes y la formación integral de los estudiantes. Para esto, diseña e implementa los instrumentos de control y seguimiento necesarios para una gestión eficiente de los recursos financieros (a nivel interno y de cada estableciendo educacional), garantizando además la implementación de procesos sistemáticos para la obtención de recursos adicionales a la subvención escolar. Del mismo modo, asegura que los espacios físicos y recursos materiales sean adecuados para los procesos efectivos de enseñanza-aprendizaje.Además el sostenedor coordina y monitorea aquellos servicios que responden a necesidades de alimentación, salud y seguridad de los estudiantes. Conjuntamente a lo anterior, respalda los mecanismos de soporte pedagógico, tecnológicos y de asistencia técnica necesarios para apoyar el mejoramiento de sus establecimientos y el rendimiento de sus alumnos.</p>
        <h3><strong>GESTIÓN DE RESULTADOS</strong></h3>
        <p>Esta área se refiere a la gestión de resultados de un sistema que periódicamente analiza y evalúa su nivel de efectividad en cuanto a sus logros, a su eficiencia en el uso de recursos y el grado de participación y satisfacción de la comunidad educativa.Con el objetivo de tomar decisiones que fortalezcan los resultados educativos, monitorea y evalúa (en coordinación con los directores de los establecimientos), indicadores de resultados de eficiencia interna: tasa de aprobación, titulación, repitencia, retención, deserción y de asistencia de alumnos entre otros, así como los índices de inserción laboral o de ingreso a la educación superior de todos sus alumnos, comparando sus resultados a nivel comunal y nacional.Para determinar aquellas áreas a fortalecer, el sostenedor resuelve junto a los directores un plan de acción que de cumplimiento a las metas establecidas y analiza el desempeño del personal en relación a sus resultados educativos, junto a otros indicadores tales como tasas de accidentabilidad, ausentismo y rotación laboral de su dotación.</p>
        <h3><strong>RELACIONES CON LA COMUNIDAD</strong></h3>
        <p>Esta área se refiere a las acciones que el sostenedor efectúa para establecer una comunicación efectiva hacia y desde la comunidad, con el objetivo de asegurar la participación y el compromiso de padres y apoderados en la educación de sus hijos. Con el objetivo de articular iniciativas colectivas y mejorar las oportunidades de aprendizaje de los alumnos, se establecen y mantienen canales permanentes de comunicación con autoridades educacionales así como alianzas, con redes externas, tales como universidades, institutos, organizaciones no gubernamentales y el mundo empresarial. Asimismo, el sostenedor cuenta con canales de difusión transparentes donde da cuenta a la comunidad educativa de su gestión interna y del uso de sus recursos (administrativos y financieros), informando además de las mejoras obtenidas en los ámbito de aprendizaje de sus alumnos.</p>
        <h3><strong>FACTORES CRÍTICOS A CONSIDERAR EN LA GESTIÓN Y ADMINISTRACIÓN A  NIVEL DE SOSTENEDORES (INTERMEDIO O MESO).</strong></h3>
        <p>El siguiente esquema se estructuró a partir de la revisión y análisis de los casos exitosos de sistemas educativos y el cruce con resultados de investigaciones internacionales y nacionales de la literatura nacional e internacional, que nos permiten señalar tres condiciones de base para que el nivel meso logre un funcionamiento apropiado y, por lo tanto, se encuentran en un nivel externo, que son las siguientes:  financiamiento adecuado de la educación, roles claros y definidos, capacidad técnico-administrativas). Luego se explicitan diez factores que influirían en una gestión local para una educación de calidad; y finalmente tres ámbitos en los cuales influyen estos factores y se podría evaluar el éxito en la gestión del nivel intermedio o meso, como son los resultados de aprendizaje, satisfacción de la comunidad y, eficacia y eficiencia interna en el nivel meso</p>
        <h3><strong>PRINCIPIOS DEL MODELO GESTIÓN DE CALIDAD DE SOSTENEDORES</strong></h3>
        <p>Este modelo se fundamenta en una serie de principios que permiten definir con mayor claridad las bases sobre la cual se han desarrollados las áreas y dimensiones que más adelante se detallarán.</p>
        <center><table><tr><td align="center"><img src="images/fotos/modelo_home1.gif" alt="modelo1"/></td></tr></table></center>
        <h3><strong>1.Principios ligados al rol del Sostenedor</strong></h3>
        <ul>
            <li>Liderazgo</li>
        </ul>
        <p>El liderazgo del Sostenedor inspira, promueve la excelencia y el cambio educativo. Articula en conjunto con los directores, jefes técnicos, docentes y asistentes de la educación metas claras, por medio de la planificación y comunicación efectiva, en coherencia con los valores y objetivos estratégicos de la comuna.</p>
        <ul>
            <li>Orientación a los resultados</li>
        </ul>
        <p>El principio orienta y focaliza la gestión del Sostenedor en el logro de los resultados y la influencia que sus acciones ejercen en tres áreas claves: orientación e impacto en la comunidad, logros educativos y efectividad de la gestión.</p>
        <br /><br />
        <h3><strong>2.Principios ligados a la relación con los Establecimientos</strong></h3>
        <ul>
            <li>Autonomía</li>
        </ul>
        <p>El papel clave del Sostenedor es generar las condiciones para que los directivos ejerzan su rol efectivamente, favoreciendo la responsabilidad y fortaleciendo las capacidades internas del establecimiento.</p>
        <ul>
            <li>Mejora continua</li>
        </ul>
        <p>Este principio se orienta a la revisión que el Sostenedor realiza de su gestión de modo que pueda observar sus procesos, acciones y resultados, reconociendo sus principales fortalezas y debilidades, asegurando las condiciones necesarias para que los establecimientos a su cargo puedan desarrollarse y mejorar de manera sostenida.</p>
        <h3><strong>3.Principios ligados a la relación con la Comunidad</strong></h3>
        <ul>
            <li>Participación</li>
        </ul>
        <p>La calidad del trabajo que realiza el Sostenedor se sustenta en el principio de fomentar y fortalecer la participación de todos los niveles en la gestión y desarrollo del servicio educativo.</p>
        <ul>
            <li>Rendición de cuentas</li>
        </ul>
        <p>Dentro de la lógica de una gestión de calidad, la visibilidad del poder de decisión del Sostenedor tiene un lugar preponderante, ya que le permite tanto a la comunidad educativa como a los usuarios “ver” cómo se toman las decisiones. El acceso a la información pública y la transparencia de las autoridades municipales son pilares fundamentales que legitiman acciones. Desde esta perspectiva, la rendición de cuentas o accountability en la función pública son elementos insustituibles de políticas acertadas, para la evaluación del Sostenedor y el incremento de legitimidad, credibilidad y confianza. <b><a href="#b" id="ver2" >Volver ...</a></b></p>
  </div>


  <div style="clear:both;"></div>
  <div style="clear:both;">&nbsp;</div>
  <!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>


<!--#include virtual="/include/footer.html"-->

</body>
</html>
