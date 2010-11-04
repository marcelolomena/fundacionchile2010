using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionSostenedores.include
{
    public partial class encabezado : System.Web.UI.UserControl
    {
        public string codusu = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            codusu = (string)HttpContext.Current.Session["codusu"];
        }
    }
}