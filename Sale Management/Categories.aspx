﻿<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Sale_Management.Categories" %>
 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">

        <table class="nav-justified">
            <tr>
                <td align="center" colspan="2" style="background-color: #333333; font-family: Arial; font-size: xx-large; font-style: normal; color: #FFFFFF; font-weight: 700">Categorie Page</td>
            </tr>
            <tr>
                <td style="width: 286px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 286px">
                    <asp:Label ID="lib_libelle" runat="server" Font-Bold="True" Font-Size="Large" Text="Libelle:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_libelle" runat="server" Font-Size="Large" placeholder="Enter Libelle" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 286px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 286px">&nbsp;</td>
                <td>
                    <asp:Button ID="btn_insert" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_insert_Click" Text="Insert" Width="120px" />
                </td>
            </tr>
            <tr>
                <td style="width: 286px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="list_categories" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" Font-Size="Medium" />
            <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle Font-Size="Medium" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClick="LinkButtonDelete_Click">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    
        
    
</asp:Content>
