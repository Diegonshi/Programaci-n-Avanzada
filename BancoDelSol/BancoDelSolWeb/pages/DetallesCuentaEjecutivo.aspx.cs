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
    public partial class DetallesCuentaEjecutivo : System.Web.UI.Page
    {
        private IClienteDAL clienteDAL = new ClienteDALObjetos();
        private ICuentaDAL cuentaDAL = new CuentaDALObjetos();
        String runEjecutivo;
        String runCliente;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.QueryString["run"] == null) return;
                runEjecutivo = Request.QueryString["run"].ToString();

                if (Request.QueryString["runCliente"] == null) return;
                runCliente = Request.QueryString["runCliente"].ToString();

                List<Cliente> lstCliente = clienteDAL.Obtener();
                Cliente cli = lstCliente.FirstOrDefault(x => x.Run == runCliente);
                List<Cuenta> lstCuenta = cuentaDAL.Obtener();
                if (cli != null)
                {
                    txtNombres.Text = cli.Nombre.ToString();
                    txtApellidoMaterno.Text = cli.Materno.ToString();
                    txtApellidoPaterno.Text = cli.Paterno.ToString();
                    txtRun.Text = cli.Run.ToString();
                    txtDireccion.Text = cli.Direccion.ToString();
                    txtContra.Text = cli.PassCliente.ToString();
                    txtTelefono.Text = cli.Telefono.ToString();

                    cli.Cuentas.FindAll(x => x.CuentaHabiente.Run == runCliente);
                    if (cli !=null)
                    {
                        for (int i = 0; i <lstCuenta.Count(); i++)
                        {
                            ddlCuentas.DataSource = lstCuenta;
                        }
                    }


                }
                
            }
        }

        protected void btnDepositar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                Response.Redirect("MisClietesEjecutivo.aspx?run="+runEjecutivo);
            }
        }

        protected void cvMontoDeposito_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String strMontoDeposito = txtMontoDeposito.Text.Trim();
            Int32 montoInicial;
            Int32.TryParse(strMontoDeposito, out montoInicial);

            if (montoInicial < 0)
            {
                cvMontoDeposito.ErrorMessage = "El monto no puede ser negativo";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}