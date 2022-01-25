<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Sale_Management.Categories" %>
 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            border: 3px solid #f1f1f1;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button:hover {
            opacity: 0.8;
        }

        .cnbtn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #ec3f3f;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            cursor: pointer;
        }

        .addbtn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            cursor: pointer;
        }

        .updatebtn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #ffa500;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            cursor: pointer;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cnbtn {
                width: 100%;
            }
        }

        .frmalg {
            margin: auto;
            width: 40%;
        }
    </style>
    <h2><%: Title %>.</h2>
    
        
        <div id="BtnCrud">
            <asp:Button runat="server" ID="btn_Add" CssClass="addbtn" Text="ADD" OnClick="Add_Click" Width="110px" />
            <asp:Button runat="server" ID="btn_Update" CssClass="updatebtn" Text="UPDATE" OnClick="Update_Click" Width="110px" />      
            <asp:Button runat="server" ID="btn_delete" Text="DELETE" class="cnbtn" OnClick="Delete_Click" Width="110px" />
        </div>
     <asp:GridView ID="GridView1" runat="server" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                           
                        <asp:CheckBox ID="chk" runat="server" OnCheckedChanged="chk_CheckedChange" AutoPostBack="True" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
        </asp:GridView>

        <div id="AddFrom" class="addForm">
            <table class="auto-style1">
                
                 <tr>
                    <td>
                        <asp:Label ID="lib_name" runat="server" Text="Name :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_name" runat="server" Width="100%" placeholder="Enter Name"></asp:TextBox>
                    </td>

                </tr>
                  
            </table>
                    <div id="BtnAdd">

                        <asp:Button runat="server" ID="btn_save" CssClass="addbtn" Text="Save" OnClick="Save_Click" Width="110px" />
                        <asp:Button runat="server" ID="btn_cancel" Text="Cancel" class="cnbtn" OnClick="Cancel_Click" Width="110px" />
                        </div>


        </div>
    
</asp:Content>
