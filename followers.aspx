<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="followers.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li>
            <asp:HyperLink ID="news" NavigateUrl="~/newsfeed.aspx" runat="server">Noticias</asp:HyperLink></li>
        <li class="active">
            <asp:HyperLink ID="followers" NavigateUrl="~/followers.aspx" runat="server">Seguidores</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="photos" NavigateUrl="~/photos.aspx" runat="server">Fotos</asp:HyperLink></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Estos son tus seguidores
        </h1>
        <p>
            Puedes conectarte con ellos dando click sobre su foto de perfil. ¡Intentalo!</p>
    </div>
    <asp:Panel ID="follow_list" class="well" runat="server">
    </asp:Panel>
</asp:Content>
