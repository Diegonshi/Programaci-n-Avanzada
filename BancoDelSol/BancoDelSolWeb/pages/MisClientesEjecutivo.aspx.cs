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
    public partial class MisClientesEjecutivo : System.Web.UI.Page
    {
        //Crear Objetos de las Interfaces correspondientes
        private IClienteDAL clienteDAL = new ClienteDALObjetos();
        private ICuentaDAL cuentaDal = new CuentaDALObjetos();
      
        //Variables locales
        String runEjecutivo;
        String runCliente;
        String runClienteg;

        protected void Page_Load(object sender, EventArgs e)
        {          

            if (!IsPostBack)
            {
                this.divDepositar.Visible = false;
                this.divNewCuenta.Visible = false;
                this.btnNewCuenta.Visible = false;

                //Obtener los datos que vienen la página anterior
                if (Request.QueryString["run"] == null) return;
                runEjecutivo = Request.QueryString["run"].ToString();

                List<Cuenta> cuentaCliente = cuentaDal.Cuentasfiltradas(runClienteg);
                List<Cliente> clientes = clienteDAL.Clientesfiltrados(runEjecutivo);

                //llamar la lista de clientes
                this.gvClientes.DataSource = clientes; //Cargar Grilla Clientes
                this.gvClientes.DataBind(); //Actualizar Grilla


                this.gvCuentas.DataSource = cuentaCliente; //Cargar Grilla de Cuentas
                this.gvCuentas.DataBind(); //Actualizar Grilla
            }
        }

        protected void btnAgregarCliente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Mandar datos a la siguiente página
                runEjecutivo = Request.QueryString["run"].ToString();
                Response.Redirect("RegistrarClienteEjecutivo.aspx?run=" + runEjecutivo + "&runCliente=" + runCliente);
            }
        }

        protected void cvRunCliente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Lista para validar Clientes
            List<Cliente> valCliente = clienteDAL.Obtener();
            runCliente = this.txtBuscarCliente.Text.Trim();

            if (!ValidarRun.validarRun(runCliente))
            {
                cvRunCliente.ErrorMessage = "*RUN o formato no valido";
                args.IsValid = false;
            }
            else if (valCliente.Count() != 0)
            {
                foreach (Cliente cli in valCliente)
                {
                    if (cli.Run == runCliente)
                    {
                        cvRunCliente.ErrorMessage = "RUN ya registrado";
                        args.IsValid = false;
                    }
                    else
                    {
                        args.IsValid = true;
                    }

                }

            }
        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cuenta")
            {
                
                //Convertir CommandArgument en String
                runClienteg = Convert.ToString(e.CommandArgument);

                //Filtrar Cuentas del Clientes para cargarlas en la Grilla
                List<Cuenta> cuentaCliente = cuentaDal.Cuentasfiltradas(runClienteg);
                this.gvCuentas.DataSource = cuentaCliente;
                this.gvCuentas.DataBind();
                this.btnNewCuenta.Visible = true;
                
            }
        }

        protected void gvCuentas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "depositar")
            {
                int num_Cuenta = Convert.ToInt32(e.CommandArgument);
                this.divDepositar.Visible = true;
                lblNumCuenta.Text = Convert.ToString(num_Cuenta);
            }
        }

        protected void btnRealizarDeposito_Click(object sender, EventArgs e)
        {
            if (cvDeposito.IsValid)
            {
                List<Cuenta> cuentas = cuentaDal.Obtener();
                String montoTxt = this.txtDepositar.Text;
                String cuentaString = this.lblNumCuenta.Text;
                int monto = Convert.ToInt32(montoTxt);
                int numCuenta = Convert.ToInt32(cuentaString);

                for (int i = 0; i < cuentas.Count(); i++)
                {
                    if (cuentas[i].Num_cuenta == numCuenta)
                    {
                        cuentas[i].Saldo = cuentas[i].Saldo + monto;
                        Movimiento m = new Movimiento((cuentas[i].Movimientos.Count + 100), cuentas[i], "Deposito", monto);
                        cuentas[i].Movimientos.Add(m);

                        gvCuentas.DataBind();
                        this.divDepositar.Visible = false;
                    }
                }
            }
        }

        protected void btnNewCuenta_Click(object sender, EventArgs e)
        {
            this.divNewCuenta.Visible = true;
            this.btnNewCuenta.Visible = false;


        }

        protected void btnAgregarNewCuenta_Click(object sender, EventArgs e)
        {
            if (cvTxtNewMontoInicial.IsValid && cvTxtNewNumCuenta.IsValid)
            {
                this.divNewCuenta.Visible = false;
                this.btnNewCuenta.Visible = true;
                

                String numCuentaTxt = this.txtNewNumCuenta.Text;
                int numCuenta = Convert.ToInt32(numCuentaTxt);

                String montoTxt = this.txtNewMontoInicial.Text;
                int monto = Convert.ToInt32(montoTxt);

                List<Cliente> clientes = clienteDAL.Obtener();

                for (int i = 0; i < clientes.Count(); i++)
                {
                    foreach(GridViewRow row in gvClientes.Rows)
                    {
                        String run = row.Cells[0].Text;
                        if (run == clientes[i].Run)
                        {
                            String clave = clientes[i].Run.Substring(0, 4);
                            Cuenta cuenta = new Cuenta();
                            cuenta.Num_cuenta = numCuenta;
                            cuenta.Saldo = monto;
                            cuenta.CuentaHabiente = clientes[i];
                            cuenta.Clave = clave;
                            if (monto != 0)
                            {
                                Movimiento m = new Movimiento((cuenta.Movimientos.Count() + 100), cuenta, "Depósito", monto);
                            }
                            clientes[i].Cuentas.Add(cuenta);
                            cuentaDal.Agregar(cuenta);

                            gvCuentas.DataBind();
                        }
                    }
                }
            }
            

        }

        protected void cvDeposito_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String montoTxt = this.txtDepositar.Text;
            int monto = Convert.ToInt32(montoTxt);

            if (monto < 0)
            {
                this.cvDeposito.Text = "El Monto no puede ser Negativo";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvTxtNewNumCuenta_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String numCuentaTxt = this.txtNewNumCuenta.Text;
            int numCuenta = Convert.ToInt32(numCuentaTxt);

            List<Cuenta> cuentas = cuentaDal.Obtener();
            foreach (Cuenta c in cuentas)
            {
                if (c.Num_cuenta == numCuenta)
                {
                    this.cvTxtNewNumCuenta.Text = "Cuenta ya Registrada";
                    args.IsValid = false;
                }else if (numCuentaTxt.Count() < 6)
                {
                     cvTxtNewNumCuenta.ErrorMessage = "La cuenta no puede tener más de 6 digitos";
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }

            }
        }

        protected void cvTxtNewMontoInicial_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String montoTxt = this.txtNewMontoInicial.Text;
            int monto = Convert.ToInt32(montoTxt);

            if (monto < 0)
            {
                this.cvDeposito.Text = "El Monto no puede ser Negativo";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}