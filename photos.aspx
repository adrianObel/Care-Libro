<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="photos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
    <ul class="nav nav-list">
        <li class="nav-header">Menú</li>
        <li><a href="#">Noticias</a></li>
        <li><a href="#">Amigos</a></li>
        <li class="active"><a href="#">Fotos</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Fotos de @nombre</h1>
    </div>
    <asp:Panel ID="Panel1" class="well" runat="server">
        <div class="row">
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo1" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo2" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo3" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo4" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
        <div class="row">
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo5" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo6" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo7" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo8" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
        <div class="row">
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo9" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo10" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo11" Width="96px" Height="95px" runat="server" /></a>
            </div>
            <div class="span3">
                <a data-toggle="modal" href="#modal-photo">
                    <asp:Image ID="photo12" Width="96px" Height="95px" runat="server" /></a>
            </div>
        </div>
    </asp:Panel>
    <div id="modal-photo" class="modal fade" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>
                Fotos de @nombre</h3>
        </div>
        <div class="modal-body form-horizontal">
            <div id="photoCarousel" class="carousel slide">
                <div class="carousel-inner">
                    <div class="active item">
                        <asp:Image ID="photo_modal_1" runat="server" /></div>
                    <div class="item">
                        <asp:Image ID="photo_modal_2" runat="server" /></div>
                    <div class="item">
                        <asp:Image ID="photo_modal_3" runat="server" /></div>
                </div>
                <a class="carousel-control left" href="#photoCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#photoCarousel" data-slide="next">&rsaquo;</a>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
            </div>
        </div>
    </div>
</asp:Content>
