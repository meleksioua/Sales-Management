<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Sale_Management.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 15px">

        <table class="nav-justified">
            <tr>
                <td align="center" colspan="2" style="background-color: #333333; font-family: Arial; font-size: xx-large; font-style: normal; color: #FFFFFF; font-weight: 700">Product Page</td>
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
                <td>
                    <asp:Label ID="lib_description" runat="server" Font-Bold="True" Font-Size="Large" Text="Description:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_description" runat="server" Font-Size="Large" placeholder="Enter Description" Width="200px" Height="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lib_categorie" runat="server" Font-Bold="True" Font-Size="Large" Text="Categorie:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="list_categories" runat="server" Font-Size="Large" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lib_prix" runat="server" Font-Bold="True" Font-Size="Large" Text="Prix:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_prix" runat="server" Font-Size="Large" placeholder="Enter Libelle" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_insert" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_insert_Click" Text="Insert" Width="120px" />
                    <asp:Button ID="btn_submit" runat="server" BackColor="#33CC33" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_submit_Click" Text="Submit" Width="120px" />
                    <asp:Button ID="btn_reset" runat="server" BackColor="Red" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_cancel_Click" Text="Cancel" Width="120px" />
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="list_products" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
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
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClick="LinkButtonDelete_Click" BackColor="Red" Font-Bold="True" Font-Size="Medium" ForeColor="White">Delete</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEdit" runat="server" OnClick="LinkButtonEdit_Click" BackColor="Orange" Font-Bold="True" Font-Size="Medium" ForeColor="White">Edit</asp:LinkButton>                    
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
