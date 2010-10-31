<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="GestionSostenedores.faq" %>
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
  <h1><strong>Preguntas Frecuentes</strong></h1>
  <div id="faq">
    <p name="inicio">
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('one_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Qué es la Plataforma del Ciclo de Mejoramiento Continuo de Gestión de Sostenedores?</strong></li>
        </ul>
      </div>
    </div>
    <div id="one_new" style="display: none;">
      <div align="left"> <span class="texto1a">La plataforma del Ciclo de Mejoramiento Continuo de Gestión de Sostenedores es un sistema online, gratuito y abierto a la comunidad. Cualquier sostenedor del país puede usarlo con el fin de mejorar permanentemente sus procesos de gestión. El Ciclo de Mejoramiento Continuo tiene como base el Modelo de Gestión de Calidad de Sostenedores desarrollado por el Área de Educación de Fundación Chile.</span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('two_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;De qué me sirve ocupar el Ciclo de Mejoramiento Continuo?</strong></li>
        </ul>
      </div>
    </div>
    <div id="two_new" style="display: none;">
      <div align="left"> <span class="texto1a">Usando la plataforma del Ciclo de Mejoramiento de Gestión de Sostenedores podrá realizar un diagnóstico institucional del Sostenedor (en base a Dimensionamiento, Autoevaluación y Levantamiento de Evidencias). Con ese diagnóstico, la plataforma le permitirá diseñar e implementar un Plan de Mejoramiento especialmente enfocado en las áreas críticas detectadas en el diagnóstico.</span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('tres_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Necesito algún tipo de formación especial para usar el Ciclo de Mejoramiento Continuo?</strong></li>
        </ul>
      </div>
    </div>
    <div id="tres_new" style="display: none;">
      <div align="left"> <span class="texto1a">El Ciclo de Mejoramiento es una herramienta que cualquier Sostenedor escolar puede ocupar. Sin embargo, debido a su complejidad recomendamos haber tenido alguna experiencia en el Modelo de Gestión Escolar, o usar la asesoría de los Consultores formados en el modelo.</span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('cuatro_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Debo llenar todo el Dimensionamiento para poder ingresar a Autoevaluación?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('tres_new', event)"></div>
    <div id="cuatro_new" style="display: none;">
      <div align="left"> <span class="texto1a">Es recomendable completar el Dimensionamiento antes de solicitar la Autoevaluación. Sin embargo, hay algunos datos que son imprescindibles para poder ingresar a la Autoevaluación. Estos son: la cantidad de establecimientos, la matrícula de cada uno de ellos, la dotación docente y el número de directivos total y por establecimiento, y los niveles que se imparten en cada establecimiento (parvulario, básico, medio). Con esos datos completados ya puede ingresar al proceso de Autoevaluación.</span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('cinco_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Cómo puedo aplicar las encuestas en papel?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('tres_new', event)"></div>
    <div id="cinco_new" style="display: none;">
      <div align="left"> <span class="texto1a">Si el contexto de la organización sostenedora no permite que los diferentes actores (sostenedor, directores, jefes técnicos, alumnos, apoderados, docentes y asistentes) respondan las encuestas a través del sistema digital en línea, se pueden aplicar en formato papel y luego ingresarlas al sistema. Las encuestas para imprimir las puede encontrar en www.gestionsostenedores.cl/descargas. Recuerde que deberá tener el registro de los RUTs y emails de quienes respondan las encuestas. No olvide también que para asegurar la confidencialidad no es recomendable poner el RUT de la persona que va a responder en la misma encuesta.</span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('seis_new', event)">
      <div align="left">
        <ul>
          <li><strong>¿Cuándo y cómo puedo ver los resultados de la Autoevaluación?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('siete_new', event)"></div>
    <div id="seis_new" style="display: none;">
      <div align="left"> <span class="texto1a">A los resultados del proceso de Autoevaluación se pueden acceder una vez ingresado el 95% del total de las encuestas. Estos resultados están disponibles para el sostenedor cuando éste ingresa con sus credenciales (email y clave) al sitio y luego ingresa al menú de resultados de autoevaluación. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('siete_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Puedo hacer el Levantamiento de Evidencias en paralelo con la Autoevaluación?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('siete_new', event)"></div>
    <div id="siete_new" style="display: none;">
      <div align="left"> <span class="texto1a">A pesar de que el Levantamiento de Evidencias se considera como la etapa siguiente de la Autoevaluación, es posible realizar ambas al mismo tiempo. Esto tomando en cuenta que mientras los diversos actores responden encuestas, el equipo sostenedor puede adelantar trabajo haciendo el Levantamiento de Evidencias.</span> </div>
    </div>

    
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('ocho_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Puedo empezar el Plan de Mejoramiento mientras se hace la Autoevaluación?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('ocho_new', event)"></div>
    <div id="ocho_new" style="display: none;">
      <div align="left"> <span class="texto1a">El Plan de Mejoramiento está diseñado para usar los datos de todas las etapas anteriores (Dimensionamiento, Autoevaluación y Levantamiento de Evidencias) y a partir de eso obtener áreas críticas para diseñar líneas de acción que concluyan en un Plan de Mejoramiento. Es por esto que es absolutamente necesario completar las etapas anteriores antes de comenzar con el Plan de Mejoramiento.</span> </div>
    </div>
    
    <!--
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('nueve_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Por qu&eacute; el sistema no me deja  cambiar algunos datos del Dimensionamiento?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('nueve_new', event)"></div>
    <div id="nueve_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Ciertos datos, como el nombre del establecimiento, la comuna, región, dependencia y dirección no son editables por el usuario pues son parte de la base de datos. Si alguno de estos datos no están correctos, envíenos un correo a gestionescolar@fundacionchile.cl con el RBD del establecimiento y el o los datos que haya que corregir. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('diez_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Debo llenar todo el Dimensionamiento para poder solicitar una  Autoevaluaci&oacute;n?</strong> </li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('diez_new', event)"></div>
    <div id="diez_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Es recomendable completar el Dimensionamiento antes de solicitar la Autoevaluación. Sin embargo, hay algunos datos que son imprescindibles para poder solicitar la Autoevaluación. Estos son los niveles del establecimiento (parvulario, básico, medio), el número de docentes, el número de directivos y la matrícula de alumnos. Con esos datos completados ya puede solicitar un proceso de Autoevaluación. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('once_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Por qu&eacute; no veo la opci&oacute;n para solicitar una Autoevaluaci&oacute;n en la  plataforma?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('once_new', event)"></div>
    <div id="once_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Una vez completados los datos necesarios del Dimensionamiento, en el módulo 2 de Autoevaluación se puede ver un botón que dice “Solicitar Autevaluación”.  Con ese botón se solicita un proceso de Autoevaluación. Si no puede ver ese botón es porque el establecimiento tiene un proceso anterior sin terminar. Deberá contactarse con nosotros al correo gestionescolar@fundacionchile.cl, para que le cambiemos el estado a ese proceso anterior y pueda solicitar un nuevo proceso. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('doce_new', event)">
      <div align="left">
        <ul>
          <li><strong>Ya tengo mi proceso de  Autoevaluaci&oacute;n activado, pero no s&eacute; en qu&eacute; parte se responden las encuestas. </strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('doce_new', event)"></div>
    <div id="doce_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Para responder encuestas debe dirigirse al sitio www.gestionescolar.cl y pinchar en el botón “Autoevaluación: Responder Encuesta”. Luego deberá seleccionar el perfil e ingresar el RUT y la clave asociada a cada perfil que se envió por correo y que pueden verse también en el módulo de Autoevaluación de la plataforma del Ciclo de Mejoramiento. 
        También puede hacerlo directamente en la página del Ciclo <a href="http://www.gestionescolar.cl/mejoramientocontinuo" target="_blank">www.gestionescolar.cl/mejoramientocontinuo </a>y pinchar en Autoevaluación: Responder Encuesta. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('trece_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Por qu&eacute; el sistema me dice que no puedo ingresar m&aacute;s encuestas, si a&uacute;n  faltan encuestas por responder?</strong> </li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('trece_new', event)"></div>
    <div id="trece_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Para responder encuestas debe dirigirse al sitio www.gestionescolar.cl y pinchar en el botón “Autoevaluación: Responder Encuesta”. Luego deberá seleccionar el perfil e ingresar el RUT y la clave asociada a cada perfil que se envió por correo y que pueden verse también en el módulo de Autoevaluación de la plataforma del Ciclo de Mejoramiento. 
        También puede hacerlo directamente en la página del Ciclo <a href="http://www.gestionescolar.cl/mejoramientocontinuo" target="_blank">www.gestionescolar.cl/mejoramientocontinuo </a>y pinchar en Autoevaluación: Responder Encuesta. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('catorce_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Por qu&eacute; no puedo responder la encuesta de directivos con la clave que  me lleg&oacute;?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('catorce_new', event)"></div>
    <div id="catorce_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Recuerde que la clave que se le envía al momento de la inscripción sólo sirve para acceder al Ciclo de Mejoramiento Continuo. La clave para responder encuestas se envía una vez que se solicita la Autoevaluación y es diferente a la clave enviada anteriormente. No olvide también que puede cambiar ambas contraseñas. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('quince_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;C&oacute;mo puedo cambiar el n&uacute;mero de encuestas a aplicar si comet&iacute; un error?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('quince_new', event)"></div>
    <div id="quince_new" style="display: none;">
      <div align="left"> <span class="texto1a"> El número de encuestas para aplicar se obtiene desde el Dimensionamiento. Si se solicitó una Autoevaluación con algún dato equivocado en el Dimensionamiento, ese dato no puede cambiarse por usted, aún cuando haga el cambio en el Dimensionamiento. Para solucionarlo debe enviar un correo a gestionescolar@fundacionchile.cl indicándonos el RBD del establecimiento y la información que hay que corregir. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('16_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Puedo cambiar las contrase&ntilde;as para responder encuestas por unas m&aacute;s f&aacute;ciles?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('16_new', event)"></div>
    <div id="16_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Sí. Esto lo puede realizar en el punto 5 de las Herramientas del Director. Es recomendable hacerlo para que a los usuarios les resulte más simple el acceso a las encuestas. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('17_new', event)">
      <div align="left">
        <ul>
          <li><strong>El establecimiento tiene s&oacute;lo nivel de ense&ntilde;anza b&aacute;sica &iquest;Todos los  alumnos pueden responder encuestas?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('17_new', event)"></div>
    <div id="17_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Debido al nivel de complejidad de las preguntas de las encuestas, recomendamos que para el nivel de enseñanza básica sólo estudiantes de 7° y 8° contesten. Sin embargo, si en alguna escuela tampoco cuentan con esos cursos, la encuesta se puede aplicar a niños de 5° y 6° siempre y cuando se les preste asistencia y se les explique en qué consisten las preguntas. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('18_new', event)">
      <div align="left">
        <ul>
          <li><strong>La muestra que me indica el sistema es mayor al n&uacute;mero de alumnos que  pueden responder encuestas &iquest;qu&eacute; hago?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('18_new', event)"></div>
    <div id="18_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Si la muestra que indica el sistema es mayor al total de alumnos de 7° y 8° básico, deberá enviarnos un correo a gestionescolar@fundacionchile.cl con el RBD del establecimiento y el número total de estudiantes de 7° y 8° para que bajemos la muestra. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('19_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;C&oacute;mo puedo aplicar las  encuestas en papel?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('19_new', event)"></div>
    <div id="19_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Si el contexto del establecimiento no permite que los diferentes actores (alumnos, apoderados, docentes, directivos) respondan las encuestas a través del sistema digital en línea, se pueden aplicar en formato papel y luego ingresarlas al sistema. Las encuestas para imprimir las puede encontrar en www.gestionescolar.cl/mejoramientocontinuo. Recuerde que deberá tener el registro de los RUTs de quienes respondan las encuestas. No olvide también que para asegurar la confidencialidad no es recomendable poner el RUT de la persona que va a responder en la misma encuesta. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('20_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Cu&aacute;ndo y c&oacute;mo puedo ver los  resultados de la   Autoevaluaci&oacute;n?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('20_new', event)"></div>
    <div id="20_new" style="display: none;">
      <div align="left"> <span class="texto1a"> A los resultados del proceso de Autoevaluación se pueden acceder una vez ingresado el 95% del total de las encuestas. Estos resultados se ven desde el punto 7 del módulo de Autoevaluación de la plataforma del Ciclo de Mejoramiento Continuo. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('21_new', event)">
      <div align="left">
        <ul>
          <li><strong>El sistema dice que mi proceso de Autoevaluaci&oacute;n expir&oacute; &iquest;Qu&eacute; puedo  hacer?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('21_new', event)"></div>
    <div id="21_new" style="display: none;">
      <div align="left"> <span class="texto1a"> El Ciclo de Mejoramiento contempla 3 meses de plazo para una Autoevaluación antes de que expire. Sin embargo, al ser un sistema abierto y autoadministrable, cada usuario determina los plazos en que se realizará el proceso. Si los 3 meses no fueron suficientes y su Autoevaluación quedó en estado expirada, envíenos un correo a gestionescolar@fundacionchile.cl, indicando el RBD del establecimiento y la notificación de querer reactivar el proceso. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('22_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Puedo hacer el Levantamiento de Evidencias en paralelo con la Autoevaluaci&oacute;n?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('22_new', event)"></div>
    <div id="22_new" style="display: none;">
      <div align="left"> <span class="texto1a"> A pesar de que el Levantamiento de Evidencias se considera como la etapa siguiente de la Autoevaluación, es posible realizar ambas al mismo tiempo. Esto tomando en cuenta que mientras los diversos actores responden encuestas, el equipo directivo puede adelantar trabajo haciendo el Levantamiento de Evidencias. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('24_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Puedo empezar el Plan de Mejoramiento mientras se hace la Autoevaluaci&oacute;n?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('24_new', event)"></div>
    <div id="24_new" style="display: none;">
      <div align="left"> <span class="texto1a"> El Plan de Mejoramiento está diseñado para ocupar los datos de todas las etapas anteriores (Dimensionamiento, Autoevaluación y Levantamiento de Evidencias) y a partir de eso obtener áreas críticas para diseñar líneas de acción que concluyan en un Plan de Mejoramiento. Es por esto que es absolutamente necesario completar las etapas anteriores antes de empezar con el Plan de Mejoramiento. </span> </div>
    </div>
    <div class="Estilo6" style="cursor: pointer;" onclick="toggle('25_new', event)">
      <div align="left">
        <ul>
          <li><strong>&iquest;Por qu&eacute; no puedo ver las  preguntas cr&iacute;ticas en el m&oacute;dulo del Plan de Mejoramiento ?</strong></li>
        </ul>
      </div>
    </div>
    <div class="preguntas" style="cursor: pointer;" onclick="toggle('25_new', event)"></div>
    <div id="25_new" style="display: none;">
      <div align="left"> <span class="texto1a"> Seguramente no se indicó el año de Autoevaluación que se utilizará. Para esto debe pinchar en “Historial Plan de Mejoramiento”, luego en “editar” y finalmente ingresar el año de la Autoevaluación que se ocupará en el Plan de Mejoramiento. </span> </div>
    </div>

    -->
    </p>


  </div>
  <div style="clear:both;"></div>
  <div style="clear:both;">&nbsp;</div>
  <!--#include virtual="/include/menu_bottom.html"-->
  <div style="clear:both;">&nbsp;</div>
</div>

<!--#include virtual="/include/footer.html"-->
</body>
</html>
