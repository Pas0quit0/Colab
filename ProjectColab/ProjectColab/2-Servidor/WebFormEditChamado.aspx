﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="column middle">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="editmenu">
                            <div class="iconchamado"><i class=""></i> <a class="title">Chamado #<%# DataBinder.Eval(Container.DataItem, "id")%></a><a class="text status" >Status: <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                            </div> 

                            <!--Botoes--> 
                            <div class="searchplace">
                                <p>ATRIBUIR CHAMADO</p>
                                <asp:DropDownList runat="server" ID="atribuidoID" DataSourceID="ObjectDataSource4" DataTextField="nome" DataValueField="id"  CssClass="inputsearch  "></asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectBolsistaServidor" TypeName="ProjectColab.DAL.DALUsuario"></asp:ObjectDataSource>

                                <asp:LinkButton ID="atribuir" runat="server" CssClass="btnsearch" CommandName="Fechar"  OnClick="atribuir_Click"> ATRIBUIR</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btnsearch bg invert" CommandName="Fechar" CommandArgument='<%#Eval("id")%>'> FECHAR CHAMADO</asp:LinkButton>                     
                            </div>   
                            <!--Nome do usuario-->
                            <div class="rowChamado"><a class="textEditChamado">Aberto por </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>

                            <!--Usuario atribuido-->
                            <div class="rowChamado"><a class="textEditChamado"> Atendente </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>
                           
                            <!--Nome da sala-->
                            <div class="rowChamado"><a class="textEditChamado"> Sala </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomesala")%> </a></div>
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>

                            <!--Resumo do problema-->
                            <div class="rowChamado"><a class="textEditChamado"> Resumo do problema </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
                            <br />-->

                            <!--Quantidade de Equipamento-->
                            <div class="rowChamado"><a class="textEditChamado"> Quantidade de equipamentos </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div> 
                            
                            <!--Data-->
                            <div class="rowChamado"><a class="textEditChamado"> Data de abertura </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
                                
                            
                            <!--Botoes-->                
        
        </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALChamado" SelectMethod="Select" >
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>         
            </div> 
</div>

<!--Comentario externo-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <div class="column middle">
          <div class="searchplace">
                <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="inputsearch2"></asp:TextBox>
                <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="btnsearch" OnClick="add_Click"/>
                 <asp:DropDownList ID="statuscomentario"  runat="server">
                    <asp:ListItem Value="1">Externo</asp:ListItem>
                    <asp:ListItem Value="2">Interno</asp:ListItem>
                </asp:DropDownList>
            </div>       
            <div class="searchplace"><div class="indicador"><a class="title">COMENTÁRIOS EXTERNOS</a></div></div> 
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="containerChat">
                        <i class="fa fa-user-circle iconFix"></i>
                        <p class="data"><span> <%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></span>
                        <%# DataBinder.Eval(Container.DataItem, "data_hora")%></p>
                        <div class="coment">
                        <p class="coment"><%# DataBinder.Eval(Container.DataItem, "descricao")%></p></div>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>

            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
        </div>




<!--Comentario interno-->
    <div class="column middle">       
            <div class="searchplace"><div class="indicador"><a class="title">COMENTÁRIOS INTERNOS</a></div></div> 


            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                        <i class="fa fa-user-circle iconFix"></i>
                        <p class="data"><span> <%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></span>
                        <%# DataBinder.Eval(Container.DataItem, "data_hora")%></p>

                        <p class="coment"><%# DataBinder.Eval(Container.DataItem, "descricao")%></p>

                </ItemTemplate>
            </asp:Repeater>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectInterno" TypeName="ProjectColab.DAL.DALComentario">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            

</asp:Content>