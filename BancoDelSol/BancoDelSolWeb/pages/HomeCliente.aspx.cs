using BancoDelSolModel.DAL;
using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BancoDelSolWeb.pages
{
    public partial class HomeCliente : System.Web.UI.Page
    {
        private IClienteDAL clienteDAL = new ClienteDALObjetos();
        String runCliente;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["run"] == null) return;
                runCliente = Request.QueryString["run"].ToString();

                //Response.Redirect("../masters/Ejecutivo.master?run="+run);

                List<Cliente> lstCliente = clienteDAL.Obtener();

                Cliente cli = lstCliente.FirstOrDefault(x => x.Run == runCliente);
                if (cli != null)
                {
                    lblNombreCliente.Text = cli.Nombre.ToString();
                    //lblNombreEjecutivo.Text = cli.Ejecutivo.Nombre.ToString();
                }
                else
                {
                    lblNombreCliente.Text = "Nombre no encontrado";
                    lblNombreEjecutivo.Text = "Ejecutivo no encontrado";
                }
            }
        }

        protected void btnTransferenciaCliente_Click(object sender, EventArgs e)
        {
            runCliente = Request.QueryString["run"].ToString();
            Response.Redirect("TransferenciaCliente.aspx?run="+runCliente);
        }

    }
}