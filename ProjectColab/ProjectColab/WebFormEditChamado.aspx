﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="40%" Width="90%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="black" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#FFFFFF" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="resumo" HeaderText="resumo" SortExpression="resumo" />
                    <asp:BoundField DataField="quantidadeeq" HeaderText="quantidadeeq" SortExpression="quantidadeeq" />
                    <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Chamado" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALChamado" UpdateMethod="Select">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>





            <div class="mid">
                    <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="comenttext"></asp:TextBox>
                    <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>





                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <div class="sec-mid">
                            <ul>
                                <li class="descricao" ><a><%# DataBinder.Eval(Container.DataItem, "descricao")%></a></li>
                                <li class="data_hora"><a><%# DataBinder.Eval(Container.DataItem, "data_hora")%></a></li>
                            </ul>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>


                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
            </div>
</asp:Content>
