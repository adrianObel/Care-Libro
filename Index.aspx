  <!--
    Care-Libro. A social network proyect builted in ASP.net, C# and Boostrap CSS.
    Copyright (C) 2012 Roger Gonzalez - Adrian Obelmejias

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses>.
    -->
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            padding-top: 60px;
            padding-bottom: 40px;
        }
    </style>
    <title>Care' Libro</title>
</head>
<body>
    <form id="form1" runat="server" class="navbar-form">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </a>
                <div class="nav-collapse">
                    <ul class="nav pull-right">
                        <asp:TextBox ID="email" runat="server" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" style="height:25px; color:Black;"></asp:TextBox>
                        <asp:CheckBox ID="remember" runat="server" 
                            oncheckedchanged="remember_CheckedChanged" />
                        <asp:Label ID="Label1" runat="server" Text="Recordar contraseña"></asp:Label>
                        <asp:Button ID="login" runat="server" Text="Ingresar" class="btn btn-primary" 
                            onclick="login_Click"
                            />
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="modal-registro" class="modal fade" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>
                ¡Awwwww Yeah! ¡Registrate en Care' Libro!</h3>
        </div>
        <div class="modal-body form-horizontal">
            <div class="control-group">
                <asp:Label ID="name_modal" runat="server" Text="Nombre" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="name" runat="server" class="span3"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="lstname_modal" runat="server" Text="Apellidos" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="lstname" runat="server" class="span3"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="email_modal" runat="server" Text="Correo Electronico" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="mail" runat="server" class="span3"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="re_email_modal" runat="server" Text="Vuelve a escribir tu correo electronico"
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="TextBox1" runat="server" class="span3"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="pass_modal" runat="server" Text="Contraseña" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="password_field" runat="server" class="span3" TextMode="Password" style="height:25px; color:Black;"></asp:TextBox>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="gender_modal" runat="server" Text="Sexo" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="sex" runat="server" class="span2">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                        <asp:ListItem>Otro</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="dob_modal" runat="server" Text="Fecha de nacimiento" class="control-label"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="day" placeholder="Dia" runat="server" class="span1">
                        
                    </asp:DropDownList>
                    <asp:DropDownList ID="month" runat="server" class="span1">
                        
                    </asp:DropDownList>
                    <asp:DropDownList ID="year" runat="server" class="span1">
                     
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="modal-footer">
             <asp:LinkButton  ID="register" class="btn btn-primary" runat="server" 
                onclick="register_Click">Register</asp:LinkButton>
             <a href="#" class="btn btn-danger"
                data-dismiss="modal">Cerrar</a>
        </div>
    </div>
    </form>
    <div class="container">
        <div> 
            <div class="hero-unit">
                <h1>
                    Bienvenido a Care' Libro</h1>
                <p>
                    Tu nueva red social</p>
                <p>
                    <button class="btn btn-primary btn-large" data-toggle="modal" href="#modal-registro">
                        Registrarse</button>
                </p>
            </div>
        </div>
        <div>
            <div class="row">
                <div class="span4">
                    <h2>
                        Conectate con tus amigos</h2>
                    <p>
                        ¡Con Care' Libro puedes conectarte con todos tus amigos!, solo debes enviarles una
                        invitacion para unirse a nuestra comunidad y ¡Ya está listo!
                    </p>
                    <p>
                </div>
                <div class="span4">
                    <h2>
                        Sube y comenta fotos</h2>
                    <p>
                        ¡Que todos sepan lo que piensas sobre algun evento! ¡Puedes subir tus propias fotos
                        y comentar las fotos de los demas!
                    </p>
                    <p>
                </div>
                <div class="span4">
                    <h2>
                        ¡No te pierdas de nada!</h2>
                    <p>
                        ¡Con nuestra aplicacion movil (aun en desarrollo) puedes manejar tu Care' Libro
                        desde tu dispositivo con iOS, Android, Symbian o Windows Mobile! ¿Que mas pudieras
                        pedir?</p>
                    <p>
                </div>
            </div>
            <hr>
        </div>
    </div>
    <footer class="container">
        <p>&copy; Roger Gonzalez, Adrian Obelmejias. Care'Libro 2012.</p>
        <p>"Ah, ok" -Adrian Obelmejias</p>
        <p>"Look behind you, a three-headed monkey!" -Roger Gonzalez</p>
      </footer>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap-modal.js" type="text/javascript"></script>
</body>
</html>