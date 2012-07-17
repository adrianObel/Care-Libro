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
    <asp:Panel ID="Panel1" class="well" runat="server">
        <a href="#">
            <asp:Image ID="friend1" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend2" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend3" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend4" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend5" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend6" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend7" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend8" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend9" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend10" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend11" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend12" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend13" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend14" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend15" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend16" Width="96px" Height="95px" runat="server" /></a>
        <a href="#">
            <asp:Image ID="friend17" Width="96px" Height="95px" runat="server" /></a> <a href="#">
                <asp:Image ID="friend18" Width="96px" Height="95px" runat="server" /></a>
    </asp:Panel>
</asp:Content>
