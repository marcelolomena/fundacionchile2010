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
    public partial class acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ValidaIngreso(string qs)
        {
            string respuesta = "[]";
            try
            {

                string qsdecode = HttpUtility.UrlDecode(qs);
                Instrumento instr = new Instrumento();
                if (instr.validaIngreso(qsdecode))
                {
                    respuesta = "[{\"OK\":\"SI\"}]";
                }
                else
                {
                    respuesta = "[{\"OK\":\"NO\"}]";
                }

                

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }
    }
}