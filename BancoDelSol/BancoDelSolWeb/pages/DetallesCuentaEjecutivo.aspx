<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesCuentaEjecutivo.aspx.cs" Inherits="BancoDelSolWeb.pages.DetallesCuentaEjecutivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/CustomStyle.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center> <h3>Datos del Cliente</h3> </center>
    <div class="flex-row">
        <div class="col-lg-6">
             <div class="form-group">
                <label>Nombres</label>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
               <div class="form-group">
                <label>Apellido Paterno</label>
                 <asp:TextBox ID="txtApellidoPaterno" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Direccion</label>
                 <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
               <div class="form-group">
                <label>Contraseña</label>
                <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>

            </div>
        </div>
        <div class="col-lg-6">
            
             <div class="form-group">
                <label>RUN</label>
                   <asp:TextBox ID="txtRun" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Apellido Materno</label>
                 <asp:TextBox ID="txtApellidoMaterno" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
               <div class="form-group">
                <label >Telefono</label>
                   <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
               <div class="form-group">
                <label >Repetir Contraseña</label>
                <asp:TextBox ID="txtRepContra" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
        </div>
    </div>
            <asp:Button ID="btnConfirmarCambios" runat="server" Text="Confirmar Cambios" CssClass="btn btn-success form-control" />
    <center> <h3>Depositar en la Cuenta</h3></center>
    <div class="flex-row">
        <div class="col-lg-6">
             <div class="form-group">
                <label>Numero de Cuenta</label>
                 <asp:DropDownList ID="ddlCuentas" runat="server" CssClass="form-control" ></asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-6">
             <div class="form-group">
                <label>Monto a Depositar</label>
                 <asp:TextBox ID="txtMontoDeposito"  runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvMontoDeposito" ControlToValidate="txtMontoDeposito" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvMontoDeposito_ServerValidate" CssClass="text-danger"></asp:CustomValidator>

            </div>
        </div>
    </div>
    <asp:Button ID="btnDepositar" CssClass="btn btn-success form-control" runat="server" Text="Depositar" OnClick="btnDepositar_Click" />
    <div>
        <asp:Label ID="LblMensaje" runat="server" CssClass="text-success"></asp:Label>
    </div>
        </div>
    </form>
    <script src="../js/jquery-3.5.0.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
