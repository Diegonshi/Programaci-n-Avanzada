<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BancoDelSolWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/customStyle.css" rel="stylesheet" />
</head>
<body id="bgi-home">
    <div class="master-container" id="flex-container-row-sb">
        <div class="col-lg-3 flex-col-sa">
            <div class="head-content">
                <asp:Label Text="Nombre del banco y el logo" runat="server" />
            </div>
            <div class="body-content">
                Lorem feugait clita euismod nonumy lorem kasd aliquyam illum duo sea consetetur stet rebum duo dolores sed exerci sed elit ipsum takimata sed sed duis et kasd ut voluptua diam duis duo elitr vulputate facilisis vulputate amet veniam labore dolor gubergren tempor lorem consectetuer et dolor erat dolor takimata vero nobis sea ut amet dolor sit zzril dolore stet aliquyam
            </div>
            <div class="footer-content">
                Diam elitr lorem sed sit sed sit eos dolor ea dolor accusam vero amet accumsan ea praesent delenit feugait ea
            </div>
        </div>

        <div class="col-lg-3 flex-col-sa">
            <div class="head-content">
                <asp:Label Text="Nombre del banco y el logo" runat="server" />
            </div>
            <div class="body-content">
                <form id="frmlogin" runat="server">
                    <div class="logo-img">
                        <img id="logo-prop" src="img/preubaFoto.gif" />
                    </div>
                    <div class="run-form form-group">
                        <label>RUN</label>
                        <asp:TextBox ID="txtRunlogin" runat="server" CssClass="form-control"></asp:TextBox>

                        <!--Validador-->
                    <asp:CustomValidator ID="cvRunLogin" ControlToValidate="txtRunLogin" ValidateEmptyText="true" CssClass="text-danger" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvRunLogin_ServerValidate"></asp:CustomValidator>
                    </div>
                    <div class="pass-form form-group">
                        <label>CONTRASEÑA</label>
                        <asp:TextBox ID="txtPasslogin" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                        <!--Validador-->
                    <asp:RequiredFieldValidator ControlToValidate="txtPassLogin" ID="valPassLogin" runat="server" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnIngresar" runat="server" Text="INGRESAR" CssClass="btn btn-primary form-control" OnClick="btnIngresar_Click" />                
                    <center>
                     <a href="#">Olvidé mi contraseña Cliente</a>
                        <a href="pages/HomeEjecutivo.aspx">Olvidé mi contraseña Ejecutivo</a>
                    </center>
                </form>
            </div>
            <div class="footer-content">
                Diam elitr lorem sed sit sed sit eos dolor ea dolor accusam vero amet accumsan ea praesent delenit feugait ea
            </div>
        </div>
    </div>


    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
