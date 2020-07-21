<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Cliente.Master" AutoEventWireup="true" CodeBehind="TransferenciaCliente.aspx.cs" Inherits="BancoDelSolWeb.pages.TransferenciaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <center>
                <h3>Cuentas</h3>
                    </center>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvCuentas" AutoGenerateColumns="false" runat="server" OnRowCommand="gvCuentas_RowCommand" CssClass="table table-hover table-bordered" EmptyDataText="No se registran Cuentas">
                    <Columns>
                        <asp:BoundField DataField="Num_Cuenta"/>
                        <asp:BoundField DataField="Saldo" HeaderText="Saldo" />
                        <asp:BoundField DataField="Credito" HeaderText="Credito" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnTransferenciaProductos" runat="server" Text="Transferir entre mis productos" />
                            </ItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnTransferirTerceros" runat="server" Text="Transferir a Terceros" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-footer">

            </div>
            <div class="card-footer" id="divTransferenciaProducto">
                <div>
                    <label>Cuenta seleccionada: <asp:Label ID="lblNumCuentaProducto" runat="server"></asp:Label> </label>
                </div>
                <div>
                    <label>Seleccionar Cuenta destino:</label>
                    <asp:DropDownList ID="ddlCuentasProducto" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div>
                    <label>Monto a Transferir:</label>
                    <asp:TextBox ID="txtMontoProducto" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btnTransferirProducto" runat="server" Text="Transferir" CssClass="btn btn-success form-control"/>
                </div>
            </div>
             <div class="card-footer" id="divTransferenciaTercero">
                <div>
                    <label>Cuenta seleccionada: <asp:Label ID="lblNumCunetaTercero" runat="server"></asp:Label> </label>
                </div>
                 <div >
                     <label>Ingrese el Run al que quiere Transferir</label>
                     <asp:TextBox ID="txtRunTercero" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                <div>
                    <label>Ingrse la cuenta de destino:</label>
                    <asp:TextBox ID="txtCuentaTercero" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <label>Monto a Transferir:</label>
                    <asp:TextBox ID="txtMontoTerceros" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div>
                     <label>Ingrese su contraseña:</label>
                     <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>

                <div>
                    <asp:Button ID="btnTransferirTercero" runat="server" Text="Transferir" CssClass="btn btn-success form-control" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
