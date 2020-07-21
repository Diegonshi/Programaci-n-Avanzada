<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Ejecutivo.Master" AutoEventWireup="true" CodeBehind="MisClientesEjecutivo.aspx.cs" Inherits="BancoDelSolWeb.pages.MisClientesEjecutivo" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoEjecutivo" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div>
            <label>Clientes</label>
        </div>
        <div>
            <div class="input-group mb-3">
                <asp:TextBox ID="txtBuscarCliente" CssClass="form-control" aria-describedby="btnAgregarCliente" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <asp:Button ID="btnAgregarCliente" CssClass="btn btn-outline-secondary" runat="server" Text="Agregar" OnClick="btnAgregarCliente_Click" />
                </div>
            </div>
            <asp:CustomValidator ID="cvRunCliente" ControlToValidate="txtBuscarCliente" ValidateEmptyText="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvRunCliente_ServerValidate"></asp:CustomValidator>
        </div>
        <div class="card">
            <div class="card-header">
                <center>
                            <h3>Mis Clientes</h3>
                        </center>
            </div>

            <div class="card-body">
                <asp:GridView OnRowCommand="gvClientes_RowCommand" AutoGenerateColumns="false" CssClass="table table-hover table-bordered" runat="server" ID="gvClientes" EmptyDataText="No se registran Clientes">
                    <Columns>
                        <asp:BoundField DataField="Run" HeaderText="Rut" />
                        <asp:BoundField DataField="PassCliente" HeaderText="Contraseña" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Paterno" HeaderText="Apellido Paterno" />
                        <asp:BoundField DataField="Materno" HeaderText="Apellido Materno" />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnCuentas" runat="server" Text="Ver Cuentas" CommandArgument='<%# Eval("Run")%>' CommandName="cuenta" CssClass="btn btn-success"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-footer">
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <center>
                    <h3>Cuentas</h3>
                </center>
            </div>

            <div class="card-body">
                <asp:GridView OnRowCommand="gvCuentas_RowCommand" AutoGenerateColumns="false" CssClass="table table-hover table-bordered" runat="server" ID="gvCuentas" EmptyDataText='Seleccione "VER CUENTAS" de un Cliente' >
                    <Columns>
                        <asp:BoundField DataField="Num_cuenta" HeaderText="Cuenta" />
                        <asp:BoundField DataField="Saldo" HeaderText="Saldo" />
                        <asp:BoundField DataField="Credito" HeaderText="Credito" />
                        <asp:BoundField DataField="Clave" HeaderText="Clave" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnNewDeposito" runat="server" Text="Depositar" CommandArgument='<%# Eval("Num_cuenta") %>' CommandName="depositar" CssClass="btn btn-success"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnNewCuenta" runat="server" Text="Agregar Cuenta" CssClass="btn btn-success form-control" OnClick="btnNewCuenta_Click" />
            </div>
            <div id="divNewCuenta" runat="server" class="flex-row">
            <div class="col-lg-5">
                <label>Numero de la nueva Cuenta</label>
                <asp:TextBox ID="txtNewNumCuenta" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-lg-5">
                <label>Monto Inicial</label>
                <asp:TextBox ID="txtNewMontoInicial" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                <asp:CustomValidator ID="cvTxtNewMontoInicial" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtNewMontoInicial" OnServerValidate="cvTxtNewMontoInicial_ServerValidate"></asp:CustomValidator>
            <div class="col-lg-2">
                <asp:Button ID="btnAgregarNewCuenta" runat="server" Text="Agregar Cuenta" CssClass="btn btn-success form-control" OnClick="btnAgregarNewCuenta_Click"/>
            </div>
                <asp:CustomValidator ID="cvTxtNewNumCuenta" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtNewNumCuenta" OnServerValidate="cvTxtNewNumCuenta_ServerValidate"></asp:CustomValidator>
                </div>
            <div class="card-footer" id="divDepositar" runat="server">
                <center>
                    <h3>Depositar</h3>
                </center>
                <label>Numero de Cuneta: <asp:Label ID="lblNumCuenta" runat="server"></asp:Label> </label>
                <div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtDepositar" CssClass="form-control" aria-describedby="btnDepositar" runat="server"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnRealizarDeposito" CssClass="btn btn-outline-secondary" runat="server" Text="Depositar" OnClick="btnRealizarDeposito_Click"/>
                        </div>
                        <div>
                            <asp:CustomValidator ID="cvDeposito" runat="server" ControlToValidate="txtDepositar" ValidateEmptyText="true" ErrorMessage="CustomValidator" OnServerValidate="cvDeposito_ServerValidate" ></asp:CustomValidator>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
