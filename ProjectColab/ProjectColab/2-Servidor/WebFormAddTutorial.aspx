﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddTutorial.aspx.cs" Inherits="ProjectColab.WebFormAddTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class ="mid">            
                <p>TITULO DO TUTORIAL</p>   <asp:TextBox ID="titulo" runat="server" CssClass="text"/>  
                <asp:Label ID="MsgErrotitulo" runat="server" ForeColor="Red"></asp:Label>
                <p>URL DO ARQUIVO</p>       <asp:TextBox ID="arquivo" runat="server" CssClass="text"/>          
                <asp:Label ID="MsgErroarquivo" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
                <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx"/>
            </div>
</asp:Content>

