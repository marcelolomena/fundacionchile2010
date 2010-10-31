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
    public partial class esquema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ValidaEstado()
        {
            string respuesta = "[]";
            try
            {
                int codusu = int.Parse((string)HttpContext.Current.Session["codusu"]);
                int codper = int.Parse((string)HttpContext.Current.Session["codper"]);

                Instrumento instr = new Instrumento();
                respuesta = instr.validaForma(codper, codusu); ;
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ActualizaForma(string codfor)
        {
            string respuesta = "[]";
            try
            {
                int codusu = int.Parse((string)HttpContext.Current.Session["codusu"]);
                //int codper = int.Parse((string)HttpContext.Current.Session["codper"]);

                Instrumento instr = new Instrumento();
                instr.actualizaForma(codusu, codfor); ;
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }




    }



}