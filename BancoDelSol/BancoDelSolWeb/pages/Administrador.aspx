<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="BancoDelSolWeb.pages.Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/customStyle.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
        <div class="flex-row">
            <div class="col-lg-4">
                <label>Crea un nuevo Ejecutivo</label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Cerrar Sesión</asp:HyperLink>
                <div>
                    <label>RUN</label>
                    <asp:TextBox ID="txtRunEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:CustomValidator ID="cvRunEjecutivo" ControlToValidate="txtRunEjecutivo" ValidateEmptyText="true" CssClass="text-danger" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvRunEjecutivo_ServerValidate"></asp:CustomValidator>
                    <asp:Label ID="lblRunExistente" runat="server" CssClass="text-danger"></asp:Label>

                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <asp:TextBox ID="TxtPassEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtPassEjecutivo" ID="valPassEjecutivo" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="txtNombreEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtNombreEjecutivo" ID="valNombreEjecutivo" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Apellido Paterno</label>
                    <asp:TextBox ID="txtPaternoEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtPaternoEjecutivo" ID="valPaterno" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Apellido Materno</label>
                    <asp:TextBox ID="TxtMaternoEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtMaternoEjecutivo" ID="valMaternoEjecutivo" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Telefono</label>
                    <asp:TextBox ID="TxtTelefonoEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtTelefonoEjecutivo" ID="valTelefonoEjecutivo" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <asp:TextBox ID="txtDireccionEjecutivo" runat="server" CssClass="form-control"></asp:TextBox>

                    <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtDireccionEjecutivo" ID="valDireccionEjecutivo" runat="server" ErrorMessage="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group">
                    <asp:Button ID="btnCrearEjecutivo" runat="server" Text="Agregar Ejecutivo" CssClass="form-control btn btn-success" OnClick="btnCrearEjecutivo_Click" />
                    <div></div>
                    
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
                      
                </div>
            </div>
            <div class="col-lg-8">
                <!--Grilla-->
                <div class="card">
                    <div class="card-header">
                        
                            <h3>Lista de Ejecutivos</h3>
                      
                    </div>
                    
                    <div class="card-body">
                        <asp:GridView AutoGenerateColumns="false" CssClass="table table-hover table-bordered" runat="server" ID="gvEjecutivos">
                            <Columns>
                                <asp:BoundField DataField="Run" HeaderText="Rut" />
                                <asp:BoundField DataField="Pass" HeaderText="Contraseña" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="Paterno" HeaderText="Apellido Paterno" />
                                <asp:BoundField DataField="Materno" HeaderText="Apellido Materno" />
                                <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="card-footer">
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="js/jquery-3.5.0.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
