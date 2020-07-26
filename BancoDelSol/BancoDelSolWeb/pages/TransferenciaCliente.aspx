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
                        <asp:BoundField DataField="Num_Cuenta" HeaderText="Numero de la cuenta" />
                        <asp:BoundField DataField="Saldo" HeaderText="Saldo" />
                        <asp:BoundField DataField="Credito" HeaderText="Credito" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnTransferenciaTercero" runat="server" Text="Transferir a Terceros" CommandArgument='<%# Eval("Num_Cuenta")%>' CommandName="transferenciaTerceros" CssClass="btn btn-success"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-footer">
            </div>

            <!--Transferencia a Terceros-->
            <div class="card-footer" id="divTransferenciaTercero" runat="server">
                <div>
                    <label>Cuenta seleccionada:
                        <asp:Label ID="lblNumCunetaTercero" runat="server"></asp:Label>
                    </label>
                </div>
                <div>
                    <label>Ingrese el Run al que quiere Transferir</label>
                    <asp:TextBox ID="txtRunTercero" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvRunTercero" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtRunTercero" OnServerValidate="cvRunTercero_ServerValidate"></asp:CustomValidator>
                </div>
                <div>
                    <label>Ingrse la cuenta de destino:</label>
                    <asp:TextBox ID="txtCuentaTercero" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvCuentaTercero" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtCuentaTercero" OnServerValidate="cvCuentaTercero_ServerValidate"></asp:CustomValidator>
                </div>
                <div>
                    <label>Monto a Transferir:</label>
                    <asp:TextBox ID="txtMontoTerceros" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:CustomValidator ID="cvMontoTercero" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtMontoTerceros" OnServerValidate="cvMontoTercero_ServerValidate"></asp:CustomValidator>

                </div>
                <div>
                    <label>Ingrese su contraseña:</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvContrasena" runat="server" ErrorMessage="CustomValidator" ValidateEmptyText="true" ControlToValidate="txtContrasena" OnServerValidate="cvContrasena_ServerValidate"></asp:CustomValidator>
                </div>

                <div>
                    <asp:Button ID="btnTransferirTercero" runat="server" Text="Transferir" CssClass="btn btn-success form-control" OnClick="btnTransferirTercero_Click"/>
                    
                </div>
            </div>
            <center>
            <asp:Label ID="lblConfirmacionTransferencia" runat="server" Visible="false"></asp:Label>
            </center>
        </div>
    </div>
</asp:Content>
