using System;
//using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionSostenedores.datos;
using System.Collections.Specialized;

namespace GestionSostenedores
{
    public partial class cuestionario_alumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerInstrumento(string codfor)
        {
            string respuesta="[]";
            try
            {
                int codper = int.Parse((string)HttpContext.Current.Session["codper"]);
                int codusu = int.Parse((string)HttpContext.Current.Session["codusu"]);
                Instrumento instr = new Instrumento();
                respuesta = instr.ObtenerInstrumento(codper, codusu, char.Parse(codfor));
                
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarInstrumento(string qs, string codfor)
        {
            string respuesta = "[]";
            try
            {
                string codper = (string)HttpContext.Current.Session["codper"];
                string codusu = (string)HttpContext.Current.Session["codusu"];
                string qsdecode = HttpUtility.UrlDecode(qs);
                Instrumento instr = new Instrumento();

                instr.GuardarInstrumento(qsdecode, codper, codfor, codusu);
                respuesta = instr.ObtenerInstrumento(int.Parse(codper), int.Parse(codusu), char.Parse(codfor));

            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }
    }
}

