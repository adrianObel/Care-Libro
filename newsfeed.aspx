<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="newsfeed.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
    <li class="nav-header">Menú</li>
    <li class="active"><a href="#">Noticias</a></li>
    <li><a href="#">Amigos</a></li>
    <li><a href="#">Fotos</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Esta es tu linea de tiempo.
        </h1>
        <p>
            Desde aqui puedes ver lo que hacen tus amigos, sus fotos, sus comentarios... ¡Ademas
            de poder escribir tus propios pensamientos! Intentalo escribiendo aqui:</p>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" placeholder="¿Que estas pensando?"
            Height="60px" Width="835px"></asp:TextBox>
        <p>
            <a class="btn btn-primary btn-large">Enviar &raquo;</a></p>
    </div>
    <div class="well">
        <h2>
            Aqui van las historias</h2>
        <p>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus
            commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
            Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
    </div>
</asp:Content>
