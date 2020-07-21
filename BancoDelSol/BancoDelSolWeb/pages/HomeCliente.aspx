<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Cliente.Master" AutoEventWireup="true" CodeBehind="HomeCliente.aspx.cs" Inherits="BancoDelSolWeb.pages.HomeCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="col-lg-8 flex-col">
        <div class="head-content">
            <h3>Bienvenido/a <asp:Label ID="lblNombreCliente" runat="server"></asp:Label></h3>
            <div>
            <label>Ultima conexión:</label>
                </div>
            <div>
            <h3>Ejecutivo/a <asp:Label ID="lblNombreEjecutivo" runat="server"></asp:Label></h3>
                </div>
        </div>
        <div class="body-content">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../img/workingprogress.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../img/workingprogress.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../img/workingprogress.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <asp:Button ID="btnTransferenciaCliente" runat="server" Text="Transferencia" OnClick="btnTransferenciaCliente_Click"/>
            <asp:Button ID="btnDepositoCliente" runat="server" Text="Depositar" OnClick="btnDepositoCliente_Click" />
        </div>
        <div class="footer-content">

        </div>
    </div>
</asp:Content>
