using BancoDelSolModel.DAL;
using BancoDelSolModel.DTO;
using BancoDelSolWeb.pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BancoDelSolWeb
{
    public partial class Default : System.Web.UI.Page
    {
        private IEjecutivoDAL ejecutivoDAL = new EjecutivoDALObjetos();
        private IClienteDAL clienteDAL = new ClienteDALObjetos();

        protected void Page_Load(object sender, EventArgs e)
        {
            //llamar la lista de ejecutivos
            List<Ejecutivo> ejecutivos = ejecutivoDAL.Obtener();
            List<Cliente> clientes = clienteDAL.Obtener();
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                //obtener los datos del formulario
                string runLogin = this.txtRunlogin.Text.Trim();
                string passLogin = this.txtPasslogin.Text.Trim();

                if (runLogin.Equals("Administrador") && passLogin.Equals("1"))
                {
                    Response.Redirect("pages/Administrador.aspx");
                }
                else
                {
                    List<Ejecutivo> lstEjecutivo = ejecutivoDAL.Obtener();
                    Ejecutivo ej = lstEjecutivo.FirstOrDefault(x => x.Run == runLogin);
                    if (ej != null)
                    {
                        //Session["Ejecutivo"] = ej;
                        //Ejecutivo eje = (Ejecutivo) Session["Ejecutivo"];
                        //remover
                        //Session.Remove("Ejecutivo");
                        //Response.Redirect("Default.aspx");

                        //direccionar a HomeEjecutivo con el run
                        Response.Redirect("pages/HomeEjecutivo.aspx?run=" + runLogin);
                    }
                    else
                    {
                        List<Cliente> lstCliente = clienteDAL.Obtener();
                        Cliente cli = lstCliente.FirstOrDefault(x => x.Run == runLogin);
                        if (cli != null)
                        {
                            Response.Redirect("pages/HomeCliente.aspx?run=" + runLogin);
                        }
                    }
                    
                    
                }
            }
         
        }

        protected void cvRunLogin_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string run = this.txtRunlogin.Text.Trim();
            string pass = this.txtPasslogin.Text.Trim();

            if (run.Equals("Administrador") && pass.Equals("1"))
            {
                args.IsValid = true;
            }
            else
            {
                if (run == string.Empty)
                {
                    cvRunLogin.ErrorMessage = "*Campo obligatorio";                  
                    args.IsValid = false;
                }
                else if(pass == string.Empty)
                {
                    //no aparece le mensaje de este error
                    valPassLogin.ErrorMessage = "*Campo obligatorio";
                    args.IsValid = false;
                }
                else if (!ValidarRun.validarRun(run))
                {
                    cvRunLogin.ErrorMessage = "*RUN o formato no válido";
                    args.IsValid = false;

                }   
                else
                {
                    List<Ejecutivo> valEjecutivo = ejecutivoDAL.Obtener();

                    if (valEjecutivo.Count() != 0)
                    {
                        foreach (Ejecutivo ej in valEjecutivo)
                        {
                            if (ej.Run == run)
                            {
                                if (ej.Pass == pass)
                                {
                                    args.IsValid = true;
                                }
                                else
                                {
                                    valPassLogin.ErrorMessage = "*Contraseña incorrecta";
                                    args.IsValid = false;
                                }

                            }

                        }
                    }
                    else
                    {
                        List<Cliente> valCliente = clienteDAL.Obtener();

                        if (valCliente.Count() != 0)
                        {
                            foreach (Cliente cli in valCliente)
                            {
                                if (cli.Run == run)
                                {
                                    if (cli.PassCliente == pass)
                                    {
                                        args.IsValid = true;
                                    }
                                    else
                                    {
                                        valPassLogin.ErrorMessage = "*Contraseña incorrecta";
                                        args.IsValid = false;
                                    }

                                }
                                else
                                {
                                    cvRunLogin.ErrorMessage = "RUN no registrado";
                                    args.IsValid = false;
                                }

                            }
                            cvRunLogin.ErrorMessage = "No hay run ingresados";
                            args.IsValid = false;
                        }
                    }
                }
            }
        }
    }
}