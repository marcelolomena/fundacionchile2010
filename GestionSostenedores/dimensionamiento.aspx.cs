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
    public partial class dimensionamiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerEstablecimientos(string codusu)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.obtenerEstablecimientos(codusu);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DetalleEstablecimiento(string codest)
        {
            string respuesta = "[]";
            try
            {
                string codins = (string)HttpContext.Current.Session["codins"];
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ListaEstablecimiento(codest, codins);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string EliminarEstablecimiento(string codest)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ActualizarEstablecimiento(string qs, string codest)
        {
            string respuesta = "[]";
            try
            {
                string qsdecode = HttpUtility.UrlDecode(qs);

                datos.Dimensionamiento dim = new datos.Dimensionamiento();

                dim.ActualizarEstablecimiento(qsdecode, codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarEstablecimiento(string qs, string codins)
        {
            string respuesta = "[]";
            try
            {
                string qsdecode = HttpUtility.UrlDecode(qs);
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                dim.guardarEstablecimiento(qsdecode, codins);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

    }
}