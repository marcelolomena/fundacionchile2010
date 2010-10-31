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
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerUsuariosPorInstitucion(string codins)
        {
            string respuesta = "[]";
            try
            {
                datos.Registro dim = new datos.Registro();
                respuesta = dim.ObtenerUsuariosPorInstitucion(codins);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarUsuario(string qs, string codins)
        {
            string respuesta = "[]";
            try
            {
                string decodedUrl = HttpUtility.UrlDecode(qs);
                datos.Registro dim = new datos.Registro();
                respuesta=dim.GuardarUsuario(decodedUrl, codins);
            }
            catch (Exception e)
            {
                //respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

    }
}