using BancoDelSolModel.DAL;
using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BancoDelSolWeb.pages
{
    public partial class HomeEjecutivo : System.Web.UI.Page
    {
        private IEjecutivoDAL ejecutivoDAL = new EjecutivoDALObjetos();
        String runEjecutivo;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Request.QueryString["run"] == null) return;
                runEjecutivo = Request.QueryString["run"].ToString();

                //Response.Redirect("../masters/Ejecutivo.master?run="+run);

                List<Ejecutivo> lstEjecutivo = ejecutivoDAL.Obtener();

                Ejecutivo ej = lstEjecutivo.FirstOrDefault(x => x.Run == runEjecutivo);
                if(ej != null)
                {
                    lblNombreEjecutivo.Text = ej.Nombre.ToString();
                }
                else
                {
                    lblNombreEjecutivo.Text = "Nombre no encontrado";
                }
            }
        }

        protected void btnMisClientesEjecutivo_Click(object sender, EventArgs e)
        {
            runEjecutivo = Request.QueryString["run"].ToString();
            Response.Redirect("MisClientesEjecutivo.aspx?run="+runEjecutivo);
        }
    }
}