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
    public partial class espacial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarEspacial(string qs, string codest)
        {
            string respuesta = "[]";
            try
            {
                //int codusu=int.Parse((string)HttpContext.Current.Session["codusu"]);
                string qsdecode = HttpUtility.UrlDecode(qs);
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                dim.GuardarEspacial(qsdecode, codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerEspacial(string codest)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ObtenerEspacial(codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerCoordenadas(string codest, string tipo)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ObtenerEspacial(codest,tipo);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

    }
}