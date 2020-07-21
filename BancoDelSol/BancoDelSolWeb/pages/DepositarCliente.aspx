<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Cliente.Master" AutoEventWireup="true" CodeBehind="DepositarCliente.aspx.cs" Inherits="BancoDelSolWeb.pages.TransferirCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
        <div class="container">
            <label>Transferencias</label>
            <div>
                <div class="form-group">
                    <label class="form-control">Cunta Origen</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-control">Saldo disponible</label>
                    <input type="text" name="name" value="" class="form-control" disabled />
                </div>
            </div>
            <div>
                <div class="form-group">
                    <label class="form-control">Cunta de Destino</label>
                    <input type="text" name="name" value="" class="form-control"/>
                </div>
                <div class="form-group">
                    <label class="form-control">Tipo de Cuenta</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div>
                    <div class="form-group">
                        <label class="form-control">Monto a Transferir</label>
                        <input class="form-control" type="text" name="name" value="" />
                    </div>
                </div>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Transferir" />
            </div>
    </div>
</asp:Content>
