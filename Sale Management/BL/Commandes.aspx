<%@ Page Title="Commandes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Commandes.aspx.cs" Inherits="Sale_Management.BL.Commandes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
.modalBackground{

background-color:black;
opacity:0.6 ! important;
z-index:20;
}
.modalpopup{
padding: 20px 0px 24px 10px;
position:relative;
width:450px;
height:500px;
background-color :White;
border:1px solid black;
}

</style>
    <div style="padding: 15px">

        <table class="nav-justified">
            <tr>
                <td align="center" colspan="2" style="background-color: #333333; font-family: Arial; font-size: xx-large; font-style: normal; color: #FFFFFF; font-weight: 700">Commande Page</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 258px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 258px">
                    <asp:Button ID="btn_insert" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_insert_Click" Text="Insert" Width="120px" />
                    <ajaxToolkit:ModalPopupExtender ID="btn_insert_ModalPopupExtender" runat="server" BehaviorID="btn_insert_ModalPopupExtender" DynamicServicePath="" TargetControlID="btn_insert" PopupControlID="Panel_addCommande" CancelControlID="btn_cancel" BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>
                    </td>
                <td>
                    <asp:Label ID="lib_startDate" runat="server" Font-Bold="True" Font-Size="Large" Text="Start Date:"></asp:Label>
                    <asp:TextBox ID="txt_statDate" runat="server" Font-Size="Large" placeholder="Enter Start Date" Width="200px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txt_statDate_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_statDate" />
                    <asp:Label ID="lib_endDate" runat="server" Font-Bold="True" Font-Size="Large" Text="End Date:"></asp:Label>
                    <asp:TextBox ID="txt_endDate" runat="server" Font-Size="Large" placeholder="Enter End Date" Width="200px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txt_endDate_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_endDate" />


                    <asp:Button ID="btn_search" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_search_Click" Text="Search" Width="120px" />


                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 258px; height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            </table>
        <asp:GridView ID="list_commandes" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
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

        <asp:Panel ID="Panel_addCommande" runat="server" Width="100%" BackColor="White" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" ScrollBars="Auto" CssClass="modalpopup">
            <table class="nav-justified">
                <tr>
                <td align="center" colspan="2" style="background-color: #333333; font-family: Arial; font-size: xx-large; font-style: normal; color: #FFFFFF; font-weight: 700">Insert Commande</td>
                </tr>
                <tr>
                    <td class="modal-sm" align="center" style="width: 40%; height: 20px; font-size: small; font-weight: 700;  font-family: Arial; ">Products</td>
                    <td class="modal-sm" style="height: 20px"></td>
                </tr>
                <tr>
                    <td class="modal-sm" align="center" style="height: 32px; width: 40%">
                        <asp:TextBox ID="txt_search" runat="server" Font-Size="Small" placeholder="Search Product !!" Width="250px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_search_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_search" />
                    </td>
                    <td style="height: 32px" align="left">
                        <asp:Button ID="btn_addClient" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_addClient_Click" Text="..." Width="60px" />
                        <asp:Label ID="lib_idClient" runat="server" Font-Bold="True" Font-Size="Small" Text="ID Client:"></asp:Label>
                        <asp:TextBox ID="txt_statDate0" runat="server" Enabled="False" Font-Size="Small" placeholder="Enter Start Date" ReadOnly="True" Width="50px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_statDate0_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_statDate0" />
                        <asp:Label ID="lib_firstName" runat="server" Font-Bold="True" Font-Size="Small" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="txt_firstName" runat="server" Font-Size="Small" placeholder="" Width="150px" Enabled="False" ReadOnly="True"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_firstName_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_firstName" />
                        <asp:Label ID="lib_lastName" runat="server" Font-Bold="True" Font-Size="Small" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="txt_lastName" runat="server" Font-Size="Small" placeholder="" Width="150px" Enabled="False" ReadOnly="True"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_lastName_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_lastName" />
                        <asp:Label ID="lib_PhoneNumber" runat="server" Font-Bold="True" Font-Size="Small" Text="Phone Number:"></asp:Label>
                        <asp:TextBox ID="txt_phoneNumber" runat="server" Font-Size="Small" placeholder="" Width="150px" Enabled="False" ReadOnly="True"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_phoneNumber_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_phoneNumber" />
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="height: 20px; width: 40%"></td>
                    <td style="height: 20px">&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" algin="center" style="width: 40%; height: 20px;">
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
            
        </asp:GridView>
                    </td>
                    <td style="height: 20px" algin="left">
                        <asp:GridView ID="list_buy" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
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
                        <asp:LinkButton ID="DeleteRow" runat="server" OnClick="DeleteRow_Click" BackColor="Red" Font-Bold="True" Font-Size="Small" ForeColor="White">Delete</asp:LinkButton>
                        <asp:LinkButton ID="EditRow" runat="server" OnClick="EditRow_Click" BackColor="Orange" Font-Bold="True" Font-Size="Small" ForeColor="White">Edit</asp:LinkButton>                    
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 40%">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 40%">&nbsp;</td>
                    <td align="right">
                        <asp:Label ID="lib_Total" runat="server" Font-Bold="True" Font-Size="Small" Text="Total:"></asp:Label>
                        <asp:TextBox ID="txt_total" runat="server" Font-Size="Small" placeholder="" Width="150px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txt_total_CalendarExtender" runat="server" BehaviorID="txt_statDate_CalendarExtender" TargetControlID="txt_total" />
                    </td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 40%">&nbsp;</td>
                    <td align="center">
                        <asp:Button ID="btn_save" runat="server" BackColor="#33CC33" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_save_Click" Text="Save" Width="120px" />
                        <asp:Button ID="btn_cancel" runat="server" BackColor="Red" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" OnClick="btn_insert_Click" Text="Cancel" Width="120px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

    </div>



</asp:Content>
