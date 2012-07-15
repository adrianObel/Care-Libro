<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <asp:Image ID="profilepic" runat="server" Width="150px" Height="150px" /><br />
    <button id="add_friend" class="btn btn-success btn-large friendbutton">
        Agregar como amigo</button><br /><br />
    <asp:Label ID="name" runat="server" Text="Nombre"></asp:Label><br />
    <asp:Label ID="relationship_label" runat="server" Text="Relacion: "></asp:Label>
    <asp:Label ID="relationship" runat="server" Text="Relacion"></asp:Label><br />
    <asp:Label ID="looking_for_label" runat="server" Text="Estoy Buscando: "></asp:Label>
    <asp:Label ID="looking_for" runat="server" Text="Buscando"></asp:Label><br />
    <br />
    <button class="btn btn-primary menubutton" data-toggle="modal" href="#modal-registro">
        Mas...</button>
    <hr />
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li><a href="#">Amigos</a></li>
        <li><a href="#">Fotos</a></li>
    </ul>
    <div id="modal-registro" class="modal fade" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>
                Mas informacion sobre "nombre"</h3>
        </div>
        <div class="modal-body form-horizontal">
            <div class="control-group">
                <asp:Label ID="about_me_label_modal" runat="server" Text="Sobre mi: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="about_me_modal" runat="server" Text="Sobre mi"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="phone_label_modal" runat="server" Text="Numero de telefono: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="phone_modal" runat="server" Text="Telefono"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="interests_label_modal" runat="server" Text="Intereses: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="interests_modal" runat="server" Text="Intereses"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="education_label_modal" runat="server" Text="Eduacacion: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="edutacion_modal" runat="server" Text="Educacion"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="hobbies_label_modal" runat="server" Text="Hobbies: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="hobbies_modal" runat="server" Text="Hobbies"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favmovies_label_modal" runat="server" Text="Peliculas favoritas: "
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favmovies_modal" runat="server" Text="Peliculas"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favartists_label_modal" runat="server" Text="Artistas favoritos: "
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favartists_modal" runat="server" Text="Artistas"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favbooks_label_modal" runat="server" Text="Libros favoritos: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favbooks_modal" runat="server" Text="Libros"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favanimals_label_modal" runat="server" Text="Animales favoritos: "
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favanimals_modal" runat="server" Text="Animales"></asp:Label>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <div class="row">
            <div class="span2">
                <asp:Image ID="FriendImage1" runat="server" Width="128px" /></div>
            <div class="span2">
                <asp:Image ID="FriendImage2" runat="server" Width="128px" /></div>
            <div class="span2">
                <asp:Image ID="FriendImage3" runat="server" Width="128px" /></div>
            <div class="span2">
                <asp:Image ID="FriendImage4" runat="server" Width="128px" /></div>
            <div class="span2">
                <asp:Image ID="FriendImage5" runat="server" Width="128px" /></div>
            <div class="span2">
                <asp:Image ID="FriendImage6" runat="server" Width="128px" /></div>
        </div>
        <h1>
            Escribe algo...
        </h1>
        <p>
            Desde aqui puedes escribir algo en este muro. ¿Que esperas? ¡Deja tu propio mensaje!</p>
        <asp:TextBox ID="write_wall" runat="server" TextMode="MultiLine" placeholder="¿Que quieres decir?"
            Height="60px" Width="835px"></asp:TextBox>
        <p>
            <a class="btn btn-primary btn-large">Enviar &raquo;</a></p>
    </div>
    <div class="well">
        <h2>
            Noticias del muro over here :D</h2>
        <p>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus
            commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
            Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
    </div>
</asp:Content>
