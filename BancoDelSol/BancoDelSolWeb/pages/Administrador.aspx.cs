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
    public partial class Administrador : System.Web.UI.Page
    {
        private IEjecutivoDAL ejecutivoDAL = new EjecutivoDALObjetos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //llamar la lista de ejecutivos
                List<Ejecutivo> ejecutivos = ejecutivoDAL.Obtener();
                //cargar la grilla
                this.gvEjecutivos.DataSource = ejecutivos;
                //recargar la grilla
                this.gvEjecutivos.DataBind();
            }
        }

        protected void btnCrearEjecutivo_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String run = this.txtRunEjecutivo.Text.Trim();
                String pass = this.TxtPassEjecutivo.Text.Trim();
                String nombre = this.txtNombreEjecutivo.Text.Trim();
                String paterno = this.txtPaternoEjecutivo.Text.Trim();
                String materno = this.TxtMaternoEjecutivo.Text.Trim();
                String direccion = this.txtDireccionEjecutivo.Text.Trim();
                String telefonotxt = this.TxtTelefonoEjecutivo.Text.Trim();
                int telefono;
                int.TryParse(telefonotxt, out telefono);


                Ejecutivo ejecutivo = new Ejecutivo(run, nombre, paterno, materno, telefono, direccion, pass);

                ejecutivo.Run = run;
                ejecutivo.Pass = pass;
                ejecutivo.Nombre = nombre;
                ejecutivo.Paterno = paterno;
                ejecutivo.Materno = materno;
                ejecutivo.Direccion = direccion;
                ejecutivo.Telefono = telefono;

                ejecutivoDAL.Agregar(ejecutivo);

                this.lblMensaje.Text = "Ejecutivo ingresado Exitosamente";

                //Limpiar Inputs
                txtRunEjecutivo.Text = "";
                TxtPassEjecutivo.Text = "";
                txtNombreEjecutivo.Text = "";
                txtPaternoEjecutivo.Text = "";
                TxtMaternoEjecutivo.Text = "";
                TxtTelefonoEjecutivo.Text = "";
                txtDireccionEjecutivo.Text = "";
                


                //llamar la lista de ejecutivos
                List<Ejecutivo> ejecutivos = ejecutivoDAL.Obtener();
                //cargar la grilla
                this.gvEjecutivos.DataSource = ejecutivos;
                //recargar la grilla
                this.gvEjecutivos.DataBind();
            }


        }

        protected void cvRunEjecutivo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            List<Ejecutivo> valEjecutivo = ejecutivoDAL.Obtener();
            String run = this.txtRunEjecutivo.Text.Trim();

            if (run == string.Empty)
            {
                cvRunEjecutivo.ErrorMessage = "*Campo obligatorio";
                args.IsValid = false;
                lblMensaje.Text = "";
            }
            else if(!ValidarRun.validarRun(run))
            {
                cvRunEjecutivo.ErrorMessage = "*RUN o formato no valido";
                args.IsValid = false;
                lblMensaje.Text = "";
            }
            else if (valEjecutivo.Count() != 0)
            {
                foreach (Ejecutivo ej in valEjecutivo)
                {
                    if (ej.Run == run)
                    {
                        cvRunEjecutivo.ErrorMessage = "RUN ya registrado";
                        args.IsValid = false;
                        lblMensaje.Text = "";
                    }
                    else
                    {
                        args.IsValid = true;
                        lblMensaje.Text = "";
                    }

                }
                
            }
        }
    }
}