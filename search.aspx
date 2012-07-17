<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            padding-top: 60px;
            padding-bottom: 40px;
        }
        .sidebar-nav
        {
            padding: 9px 0;
        }
    </style>
    <title>Care' Libro</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                        class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </a><a class="brand" href="newsfeed.aspx">Care' Libro</a>
                    <div class="nav-collapse">
                        <ul class="nav pull-right">
                            <div class="btn-group">
                                <asp:Button ID="dropdown_menu_button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                                    runat="server" Text="Nombre" />
                                <ul class="dropdown-menu">
                                    <li>
                                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/newsfeed.aspx" runat="server"><i class="icon-home"></i>Home</asp:HyperLink></li>
                                    <li>
                                        <asp:HyperLink ID="profile" NavigateUrl="~/profile.aspx" runat="server"><i class="icon-user"></i>Mi perfil</asp:HyperLink></li>
                                    <li class="divider"></li>
                                    <li>
                                        <asp:HyperLink ID="edit_profile" NavigateUrl="~/profilemodification.aspx" runat="server"><i class="icon-wrench"></i>Modificar perfil</asp:HyperLink>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="logout" OnClick="logout_Click" runat="server"><i class="icon-remove"></i>Salir</asp:LinkButton></li>
                                </ul>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="hero-unit">
            <h1>
                Resultados de la busqueda</h1>
            <br />
            <asp:Label ID="search_label" runat="server" Text="Tu busqueda fue sobre @query, aqui estan los resultados: "
                Font-Size="Large"></asp:Label>
            <h3>
                Puedes hacer otra busqueda desde aqui:</h3>
            <br />
            <div class="form-horizontal">
                <asp:TextBox ID="search_box" placeholder="Buscar en Care' Libro" runat="server"></asp:TextBox>
                <asp:Button ID="search_button" class="btn btn-success btn-large" OnClick="search_Click" runat="server" Text="Buscar" />
            </div>
        </div>
        <div class="well">
            <asp:PlaceHolder ID="search_place_holder" runat="server"></asp:PlaceHolder> 
        </div>
    </div>
    </form>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script src="js/bootstrap-scrollspy.js" type="text/javascript"></script>
    <script src="js/bootstrap-modal.js" type="text/javascript"></script>
    <script src="js/bootstrap-transition.js" type="text/javascript"></script>
    <script src="js/bootstrap-carousel.js" type="text/javascript"></script>
</body>
</html>
