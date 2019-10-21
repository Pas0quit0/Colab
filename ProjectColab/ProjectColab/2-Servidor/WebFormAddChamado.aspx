﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="column middle">
                <div class="indicador"><a class="title">ADICIONAR CHAMADO</a></div>
                <div class="menuAdd">
                    <!-- Primeira parte da criação de chamados-->
                        <div class="AreaToInput">
                            <i class="fa fa-desktop"></i><asp:TextBox ID="resumo" runat="server" Placeholder="DIGITE AQUI O RESUMO DO PROBLEMA" CssClass="inputsearch2 inputToAdd"></asp:TextBox>
                        </div>
                            <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>                
                            <i class="fa fa-desktop"></i><asp:DropDownList ID="labDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputsearch2 inputToAdd" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
                            <i class="fa fa-desktop"></i><asp:DropDownList ID="catDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputsearch2 inputToAdd" DataSourceID="ObjectDataSource1"></asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALCategoria"></asp:ObjectDataSource>
                            <asp:Label ID="MsgErrolab" runat="server" ForeColor="Red"></asp:Label>             
                    
                    <!-- Segunda parte da criação de chamados-->
                        <div class="AreaToInput">                            
                            <i class="fa fa-desktop"></i><asp:TextBox ID="quantidadeeq" runat="server" Placeholder="DIGITE AQUI A QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS" CssClass="inputsearch2 inputToAdd" OnTextChanged="quantidadeeq_TextChanged"></asp:TextBox>
                            <asp:Label ID="MsgErromaqdef" runat="server" ForeColor="Red"></asp:Label>
                        </div>

            <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->                
                <i class="fa fa-desktop"></i><asp:DropDownList ID="statusEI" CssClass="inputsearch2 inputToAdd" runat="server">
                    <asp:ListItem Value="1">Externo</asp:ListItem>
                    <asp:ListItem Value="2">Interno</asp:ListItem>
                </asp:DropDownList>
                <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd btnToAdd" OnClick="add_Click1"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>                
            </div>
         </div>         
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server"></asp:Content>

