using System;
using System.Collections.Specialized;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionSostenedores.datos;
using System.Net;
using System.IO;

namespace GestionSostenedores
{
    public partial class proyectos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GuardarProyectos(string qs, string codest)
        {
            string respuesta = "[]";
            try
            {
                //int codusu=int.Parse((string)HttpContext.Current.Session["codusu"]);
                string qsdecode = HttpUtility.UrlDecode(qs);
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                dim.GuardarProyectos(qsdecode, codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerProyectos(string codest)
        {
            string respuesta = "[]";
            try
            {
                datos.Dimensionamiento dim = new datos.Dimensionamiento();
                respuesta = dim.ObtenerProyectos(codest);
            }
            catch (Exception e)
            {
                respuesta = "[{\"ERROR\":\"" + e.Message + "\"}]";
            }
            return respuesta;
        }

        [WebMethod(EnableSession = true)]
        public bool UploadDocument(byte[] docbinaryarray, string docname)
        {
            string strdocPath;
            strdocPath = "C:\\DocumentDirectory\\" + docname;
            FileStream objfilestream = new FileStream(strdocPath,
            FileMode.Create, FileAccess.ReadWrite);
            objfilestream.Write(docbinaryarray, 0, docbinaryarray.Length);
            objfilestream.Close();
            return true;
        }

        [WebMethod(EnableSession = true)]
        public byte[] DownloadFile(string FName)
        {
            System.IO.FileStream fs1 = null;
            fs1 = System.IO.File.Open(FName, FileMode.Open, FileAccess.Read);
            byte[] b1 = new byte[fs1.Length];
            fs1.Read(b1, 0, (int)fs1.Length);
            fs1.Close();
            return b1;
        }

    }
}