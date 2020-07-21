<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Ejecutivo.Master" AutoEventWireup="true" CodeBehind="RegistrarClienteEjecutivo.aspx.cs" Inherits="BancoDelSolWeb.pages.RegistrarClienteEjecutivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoEjecutivo" runat="server">
    <center> <h3>Datos del Cliente</h3> </center>
    <div class="flex-row">
        <div class="col-lg-6">
             <div class="form-group">
                <label>Nombres</label>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfNombres" ControlToValidate="txtNombres" runat="server" ErrorMessage="Campo Obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
               <div class="form-group">
                <label>Apellido Paterno</label>
                 <asp:TextBox ID="txtApellidoPaterno" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfApellidoPaterno" ControlToValidate="txtApellidoPaterno" runat="server" ErrorMessage="Campo Obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
             <div class="form-group">
                <label>Direccion</label>
                 <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfDireccion" ControlToValidate="txtDireccion" runat="server" ErrorMessage="Campo Obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
               <div class="form-group">
                <label>Contraseña</label>
                <asp:TextBox ID="txtContra" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CustomValidator ID="cvContra" ControlToValidate="txtContra" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" CssClass="text-danger"></asp:CustomValidator>

            </div>
        </div>
        <div class="col-lg-6">
            
             <div class="form-group">
                <label>RUN</label>
                   <asp:TextBox ID="txtRun" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Apellido Materno</label>
                 <asp:TextBox ID="txtApellidoMaterno" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfApellidoMaterno" ControlToValidate="txtApellidoMaterno" runat="server" ErrorMessage="Campo Obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
               <div class="form-group">
                <label >Telefono</label>
                   <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfTelefono" ControlToValidate="txtTelefono" runat="server" ErrorMessage="Campo Obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
               <div class="form-group">
                <label >Repetir Contraseña</label>
                <asp:TextBox ID="txtRepContra" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:CustomValidator ID="cvRepContra" ControlToValidate="txtRepContra" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvContra_ServerValidate" CssClass="text-danger"></asp:CustomValidator>
            </div>
        </div>
    </div>
    <center> <h3>Datos de la Cuenta</h3></center>
    <div class="flex-row">
        <div class="col-lg-6">
             <div class="form-group">
                <label>Numero de Cuenta</label>
                 <asp:TextBox ID="txtNumeroCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvNumeroCuenta" ControlToValidate="txtNumeroCuenta" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvNumeroCuenta_ServerValidate" CssClass="text-danger"></asp:CustomValidator>
            </div>
        </div>
        <div class="col-lg-6">
             <div class="form-group">
                <label>Monto Inicial</label>
                 <asp:TextBox ID="txtMontoInicial"  runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvMontoInicial" ControlToValidate="txtMontoInicial" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvMontoInicial_ServerValidate" CssClass="text-danger"></asp:CustomValidator>

            </div>
        </div>
    </div>
    <asp:Button ID="btnRegistrarCliente" CssClass="btn btn-success form-control" runat="server" Text="Registrar Cliente" OnClick="btnRegistrarCliente_Click" />
    <div>
        <asp:Label ID="LblMensaje" runat="server" CssClass="text-success"></asp:Label>
    </div>
</asp:Content>
