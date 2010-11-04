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
    public partial class resultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarResultados(string qs, string codest)
        {
            string respuesta = "[]";
            try
            {
                string qsdecode = HttpUtility.UrlDecode(qs);
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                dim.GuardarResultados(qsdecode, codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerResultados(string codest)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ObtenerResultados(codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }


    }
}