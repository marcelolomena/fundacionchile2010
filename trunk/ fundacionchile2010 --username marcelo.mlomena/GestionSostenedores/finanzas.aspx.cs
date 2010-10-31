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
    public partial class finanzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerFinanzas(string codusu)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ObtenerFinanzas(codusu);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarFinanzas(string qs, string codusu)
        {
            string respuesta = "[]";
            try
            {
                //int codusu=int.Parse((string)HttpContext.Current.Session["codusu"]);
                string qsdecode = HttpUtility.UrlDecode(qs);
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                dim.GuardarFinanzas(qsdecode, codusu);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

    }
}