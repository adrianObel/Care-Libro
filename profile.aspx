<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <asp:Image ID="profilepic" class="profileImage" runat="server" Width="150px" Height="150px" /><br />
    
    <br />
    <asp:Label ID="name" runat="server" Text="Nombre"></asp:Label><br />
    <asp:Label ID="relationship_label" runat="server" Text="Relacion: "></asp:Label>
    <asp:Label ID="relationship" runat="server" Text="Relacion"></asp:Label><br />
    <asp:Label ID="looking_for_label" runat="server" Text="Estoy Buscando: "></asp:Label>
    <asp:Label ID="looking_for" runat="server" Text="Buscando"></asp:Label><br />
    <br />
    <button id="add_friend" class="btn btn-success btn-large friendbutton" data-toggle="modal"
        href="#modal-add">
        Agregar como amigo</button><br />
    <asp:PlaceHolder ID="are_friends" runat="server"></asp:PlaceHolder>
    <asp:Button ID="more_info" class="btn btn-primary menubutton" data-toggle="modal"
        href="#modal-more" runat="server" Text="Mas.." />
    <hr />
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li><a href="#">Seguidores</a></li>
        <li><a href="#">Fotos</a></li>
    </ul>
    <div id="modal-add" class="modal fade" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>
                ¿Seguro?</h3>
        </div>
        <div class="modal-body form-horizontal">
            <h1>
                ¿Estas seguro que deseas agregar a @nombre a tus amigos?</h1>
            <br />
            <center>
                <asp:Button ID="add" class="btn btn-primary btn-large" runat="server" Text="Si, añadir" />
                <asp:Button ID="dontadd" class="btn btn-danger btn-large" runat="server" data-dismiss="modal"
                    Text="No" /></center>
        </div>
    </div>
    <div id="modal-more" class="modal fade" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>
                Mas informacion sobre @nombre</h3>
        </div>
        <div class="modal-body form-horizontal">
            <div class="control-group">
                <asp:Label ID="about_me_label_modal" runat="server" Text="Sobre mi: " class="control-label" Font-Bold="True"></asp:Label>
                <div class="controls">
                    <asp:Label ID="about_me_modal" runat="server" Text="Sobre mi"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="phone_label_modal" runat="server" Font-Bold="True" Text="Numero de telefono: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="phone_modal" runat="server" Text="Telefono"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="interests_label_modal" runat="server" Font-Bold="True" Text="Intereses: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="interests_modal" runat="server" Text="Intereses"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="education_label_modal" runat="server" Font-Bold="True" Text="Eduacacion: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="edutacion_modal" runat="server" Text="Educacion"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="hobbies_label_modal" runat="server" Font-Bold="True" Text="Hobbies: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="hobbies_modal" runat="server" Text="Hobbies"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favmovies_label_modal" runat="server" Font-Bold="True" Text="Peliculas favoritas: "
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favmovies_modal" runat="server" Text="Peliculas"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favartists_label_modal" runat="server" Font-Bold="True" Text="Artistas favoritos: "
                    class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favartists_modal" runat="server" Text="Artistas"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favbooks_label_modal" runat="server" Font-Bold="True" Text="Libros favoritos: " class="control-label"></asp:Label>
                <div class="controls">
                    <asp:Label ID="favbooks_modal" runat="server" Text="Libros"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="favanimals_label_modal" runat="server" Font-Bold="True" Text="Animales favoritos: "
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
        <a href="#">
            <asp:Image ID="friendprof1" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof2" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof3" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof4" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof5" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof6" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof7" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friendprof8" Width="96px" Height="95px" runat="server" /></a><br />
        <br />
        <h1>
            Escribe algo...
        </h1>
        <p>
            Desde aqui puedes escribir algo en este muro. ¿Que esperas? ¡Deja tu propio mensaje!</p>
        <asp:TextBox ID="write_wall" runat="server" TextMode="MultiLine" placeholder="¿Que quieres decir?"
            Height="60px" Width="835px"></asp:TextBox>
        <p>
            <asp:LinkButton ID="send_message" OnClick="send_message_Click" class="btn btn-primary btn-large"
                runat="server">Enviar&raquo;</asp:LinkButton>
        </p>
    </div>
    <div class="well">
        <h2>
            Noticias del muro over here :D</h2>
            <ul class="publish_list">
        <asp:PlaceHolder ID="publish_panel" runat="server"></asp:PlaceHolder>
            </ul>
    </div>
</asp:Content>
