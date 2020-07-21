using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BancoDelSolWeb.pages
{
    public partial class TransferenciaCliente : System.Web.UI.Page
    {
        String runCliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["run"] == null) return;
                runCliente = Request.QueryString["run"].ToString();


            }
        }

        protected void gvCuentas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}