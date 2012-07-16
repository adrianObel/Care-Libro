<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="profilemodification.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li><a href="#aboutme">Sobre mí</a></li>
        <li><a href="#interest_menu">Intereses</a></li>
        <li><a href="#education_menu">Educacion</a></li>
        <li><a href="#hobbies_menu">Hobbies</a></li>
        <li><a href="#favorites">Favoritos</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Cambie sus datos de perfil aqui:</h1>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <section id="aboutme">
            <h3>
                Sobre mi:</h3>
            <hr />
            <asp:TextBox ID="about_me" class="modtextfield" runat="server" TextMode="MultiLine"></asp:TextBox><br />
            <h3>
                Relacion</h3>
            <asp:DropDownList ID="relationship" runat="server" CssClass="span3">
                <asp:ListItem>Soltero</asp:ListItem>
                <asp:ListItem>En una relación</asp:ListItem>
                <asp:ListItem>Casado</asp:ListItem>
                <asp:ListItem>Viudo</asp:ListItem>
                <asp:ListItem>Concubino</asp:ListItem>
                <asp:ListItem>Arrejuntao&#39;</asp:ListItem>
                <asp:ListItem>Es complicado</asp:ListItem>
            </asp:DropDownList>
            <h3>
                Estoy buscando...</h3>
            <asp:DropDownList ID="looking_for" runat="server" CssClass="span3">
                <asp:ListItem>Mujeres</asp:ListItem>
                <asp:ListItem>Hombres</asp:ListItem>
                <asp:ListItem>Hombres o Mujeres</asp:ListItem>
            </asp:DropDownList>
            <h3>
                Número de Telefono</h3>
            <asp:TextBox ID="phone" placeholder="+58 (123)4567890" runat="server"></asp:TextBox>
            <h3>Imagen de perfil</h3>
                <asp:FileUpload id="FileUploadControl" runat="server" />
    <asp:Button runat="server" id="UploadButton" class="btn btn-primary" text="Subir" onclick="UploadButton_Click" />
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="Estatus de la subida: " />
            </section>
            <section id="interest_menu">
            <h3>
                Intereses</h3>
            <hr />
            <asp:TextBox ID="interest" runat="server" TextMode="MultiLine" class="modtextfield" placeholder="Ejemplo: Noticias, programacion, negocios, etc."></asp:TextBox>
            </section>
            <section id="education_menu">
            <h3>
                Educacion</h3>
            <hr />
            <asp:TextBox ID="education" class="modtextfield" runat="server" TextMode="MultiLine"
                placeholder="Ejemplo: Universidad Tecnologica del Centro, Colegio Sagrado Corazon, etc."></asp:TextBox>
            </section>
            <section id="hobbies_menu">
            <h3>
                Hobbies</h3>
            <hr />
            <asp:TextBox ID="hobbies" class="modtextfield" runat="server" TextMode="MultiLine"
                placeholder="Ejemplo: Futbol, leer, cantar, etc."></asp:TextBox>
            </section>
            <section id="favorites">
            <h3>
                Peliculas preferidas</h3>
            <hr />
            <asp:TextBox ID="fav_movies" class="modtextfield" runat="server" TextMode="MultiLine" placeholder="Ejemplo: Pulp Fiction, A Clockwork Orange, Scarface, etc."></asp:TextBox>
            <h3>
                Artistas preferidos</h3>
            <hr />
            <asp:TextBox ID="fav_artists" runat="server" class="modtextfield" TextMode="MultiLine" placeholder="Ejemplo: David Gilmour, Steven Tyler, Ozzy Osbourne, etc."></asp:TextBox>
            <h3>
                Libros preferidos</h3>
            <hr />
            <asp:TextBox ID="fav_books" class="modtextfield" runat="server" TextMode="MultiLine"
                placeholder="Ejemplo: El principito, Don Quijote, Mein Kampf, etc."></asp:TextBox>
            <h3>
                Animales preferidos</h3>
            <hr />
            <asp:TextBox ID="fav_animals" class="modtextfield" runat="server" TextMode="MultiLine" placeholder="Ejemplo: Gatos, perros, unicornios, etc."></asp:TextBox><br />
            <br />
            </section>
        </div>
        <button class="btn btn-primary btn-large savebutton" data-toggle="modal"
        href="#modal-modification">
            Guardar</button>
        <div id="modal-modification" class="modal fade" style="display: none;">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h3>
                    ¿Seguro?</h3>
            </div>
            <div class="modal-body form-horizontal">
                <h1>
                    ¿Estas seguro que deseas modificar tu perfil?</h1>
                <br />
                <center>
                    <asp:Button ID="save_modifications" OnClick="save_modifications_Click" class="btn btn-primary btn-large"
                         runat="server" Text="Guardar" />
                    <asp:Button class="btn btn-danger btn-large" data-dismiss="modal"
                        ID="cancel_modifications" runat="server"
                        Text="Cancelar"/></center>
            </div>
        </div>
    </div>
</asp:Content>
