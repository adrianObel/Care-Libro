<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true"
    CodeFile="profilemodification.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="sidebar" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="middle" runat="Server">
    <div class="hero-unit">
        <h1>
            Cambie sus datos de perfil aqui:</h1>
        <br />
        <h3>
            Sobre mi:</h3>
        <hr />
        <asp:TextBox ID="about_me" runat="server" Style="width: 835px; height: 200px;" TextMode="MultiLine"></asp:TextBox><br />
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
    </div>
</asp:Content>
