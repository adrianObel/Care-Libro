<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="friends.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li>
            <asp:HyperLink ID="news" NavigateUrl="~/newsfeed.aspx" runat="server">Noticias</asp:HyperLink></li>
        <li class="active">
            <asp:HyperLink ID="friends" NavigateUrl="~/friends.aspx" runat="server">Amigos</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="photos" NavigateUrl="~/photos.aspx" runat="server">Fotos</asp:HyperLink></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Estos son tus amigos
        </h1>
        <p>
            Puedes conectarte con ellos dando click sobre su foto de perfil. ¡Intentalo!</p>
    </div>
    <asp:Panel ID="Panel1" class="well" runat="server">
        <div class="row">
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend1" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend2" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend3" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend4" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
        <div class="row">
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend5" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend6" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend7" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend8" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
        <div class="row">
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend9" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend10" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend11" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a href="#">
                    <asp:Image ID="friend12" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
