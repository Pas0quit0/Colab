﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterProfessor.Master" AutoEventWireup="true" CodeBehind="IndexProfessor.aspx.cs" Inherits="ProjectColab.IndexProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="row">
                  <div class="column middle" >
                      <div class="content">
                          <div class="indicador"><a class="colorfix titulo">DASHBOARD</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <a class="title">CHAMADOS</a>
                         <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn" PostBackUrl="~//4-Professor/WebFormCRUDChamadoProfessor.aspx"/>
                      </div>
                  </div>
                <asp:Button runat="server" CssClass="btnPesquisar btn fixed" Text="+" PostBackUrl="~/4-Professor/WebFormAddChamadoProfessor.aspx"/>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

