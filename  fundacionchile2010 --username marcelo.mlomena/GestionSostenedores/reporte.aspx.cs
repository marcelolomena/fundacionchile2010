using System;
using System.Collections.Specialized;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionSostenedores.datos;

namespace GestionSostenedores
{
    public partial class reporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteArea(string codfor,string codins)
        {
            string respuesta = "[]";
            try
            {
                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteArea(codins2, codfor);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteDimension(string codfor,string codins)
        {
            string respuesta = "[]";
            try
            {
                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteDimension(codins2,codfor);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteMejoria(string codins)
        {
            string respuesta = "[]";
            try
            {

                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteMejoria(codins2);

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteInscritos(string codins,string codfor)
        {
            string respuesta = "[]";
            try
            {

                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteInscritos(codins2,codfor);

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteAreaCartesiano(string codins)
        {
            string respuesta = "[]";
            try
            {

                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteCartesiano(codins2, "sp_reporte_area_cartesiano");

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ReporteDimensionCartesiano(string codins)
        {
            string respuesta = "[]";
            try
            {

                Resultados res = new Resultados();
                string codins2 = (string)HttpContext.Current.Session["codins"];
                respuesta = res.reporteCartesiano(codins2, "sp_reporte_dimension_cartesiano");

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }
    }
}