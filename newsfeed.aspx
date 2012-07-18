<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="newsfeed.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li class="active">
            <asp:HyperLink ID="news" NavigateUrl="~/newsfeed.aspx" runat="server">Noticias</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="followers"  runat="server">Seguidores</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="photos" NavigateUrl="~/photos.aspx" runat="server">Fotos</asp:HyperLink></li>
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
        <asp:TextBox ID="write_wall" runat="server" TextMode="MultiLine" placeholder="¿Que estas pensando?"></asp:TextBox>
        <p>
        <asp:LinkButton ID="send_message" CssClass="btn btn-primary btn-large" 
        OnClick="send_message_Click" runat="server">Enviar &raquo;</asp:LinkButton></p>
    </div>
    <div class="well">
        <h2>
            Aqui van las historias</h2>
            <ul>
        <asp:PlaceHolder ID="publish_panel" runat="server"></asp:PlaceHolder>
            </ul>
    </div>
</asp:Content>
