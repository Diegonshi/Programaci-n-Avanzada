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
    public partial class RegistrarClienteEjecutivo : System.Web.UI.Page
    {
        String runCliente;
        String runEjecutivo;
        private IEjecutivoDAL ejecutivoDAL = new EjecutivoDALObjetos();
        private IClienteDAL clienteDAL = new ClienteDALObjetos();
        private ICuentaDAL cuentaDAL = new CuentaDALObjetos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["run"] == null) return;
                runEjecutivo = Request.QueryString["run"].ToString();

                if (Request.QueryString["runCliente"] == null) return;
                runCliente = Request.QueryString["runCliente"].ToString();

                this.txtRun.Text = runCliente.ToString();
            }
        }

        protected void cvContra_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String contra = this.txtContra.Text.Trim();
            String repContra = this.txtRepContra.Text.Trim();

            if (contra == String.Empty)
            {
                cvContra.ErrorMessage = "Campo obligatorio";
                args.IsValid = false;
            } else if (repContra == String.Empty)
            {
                cvRepContra.ErrorMessage = "Campo obligatorio";
                args.IsValid = false;
            }
            else
            {
                if (contra.Equals(repContra))
                {
                    args.IsValid = true;
                }
                else
                {
                    cvRepContra.ErrorMessage = "La contraseña no coincide";
                    args.IsValid = false;
                }
            }
        }

        protected void btnRegistrarCliente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                runEjecutivo = Request.QueryString["run"].ToString();
                

                String nombres = this.txtNombres.Text;
                String apellidoP = this.txtApellidoPaterno.Text.Trim();
                String apellidoM = this.txtApellidoMaterno.Text.Trim();
                String runCliente = this.txtRun.Text.Trim();
                String telefonotxt = this.txtTelefono.Text.Trim();
                String direccion = this.txtDireccion.Text.Trim();
                String contra = this.txtContra.Text.Trim();
                Int32 telefono;
                Int32.TryParse(telefonotxt, out telefono);
                String strNumCuenta = this.txtNumeroCuenta.Text.Trim();
                Int32 numCuenta;
                Int32.TryParse(strNumCuenta, out numCuenta);
                String strmontoInicial = this.txtMontoInicial.Text.Trim();
                Int32 montoInicial;
                Int32.TryParse(strmontoInicial, out montoInicial);

                Cliente cliente = new Cliente(runCliente, nombres, apellidoP, apellidoM, telefono, direccion, contra);
                List<Ejecutivo> lstEjecutivo = ejecutivoDAL.Obtener();
                Ejecutivo ej = lstEjecutivo.FirstOrDefault(x => x.Run == runEjecutivo);
                if (ej != null)
                {
                    ej.Clientes.Add(cliente);
                }
                clienteDAL.Agregar(cliente);

                List<Cliente> lstCliente = clienteDAL.Obtener();                

                    for (int i = 0; i < lstCliente.Count(); i++)
                    {
                        if (runCliente == lstCliente[i].Run)
                        {
                            String clave = lstCliente[i].Run.Substring(0, 4);
                            Cuenta cuenta = new Cuenta();
                            cuenta.Num_cuenta = numCuenta;
                            cuenta.Saldo = montoInicial;
                            cuenta.CuentaHabiente = lstCliente[i];
                            cuenta.Clave = clave;
                            if (montoInicial != 0)
                            {
                                Movimiento m = new Movimiento((cuenta.Movimientos.Count() + 100), cuenta, "Depósito", montoInicial);
                                cuenta.Movimientos.Add(m);
                            }
                            lstCliente[i].Cuentas.Add(cuenta);
                            cuentaDAL.Agregar(cuenta);
                        this.LblMensaje.Text = "Cliente registrado exitosamente";
                        Response.Redirect("MisClientesEjecutivo.aspx?run="+runEjecutivo);
                    }
                    else
                    {
                        LblMensaje.Text = "no se pudo ingresar el cliente";
                    }
                    }


            }
        }

        protected void cvNumeroCuenta_ServerValidate(object source, ServerValidateEventArgs args)
        {
            List<Cuenta> valCuenta = cuentaDAL.Obtener();

            String strNumCuenta = this.txtNumeroCuenta.Text.Trim();
            int numCuenta = Convert.ToInt32(strNumCuenta);
            

            foreach (Cuenta c in valCuenta)
            {
                if (c.Num_cuenta == numCuenta)
                {
                    cvNumeroCuenta.ErrorMessage = "Cuenta ya Asociada";
                    args.IsValid = false;
                }else if (strNumCuenta.Count() < 6)
                {
                    cvNumeroCuenta.ErrorMessage = "La cuenta no puede tener menos de 6 digitos";
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }

        protected void cvMontoInicial_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String strMontoInicial = txtMontoInicial.Text.Trim();
            Int32 montoInicial;
            Int32.TryParse(strMontoInicial, out montoInicial);

            if (montoInicial < 0)
            {
                cvMontoInicial.ErrorMessage = "El monto no puede ser negativo";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvMontoDeposito_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }
    }
}