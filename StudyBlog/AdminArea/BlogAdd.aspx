<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="BlogAdd.aspx.cs" Inherits="StudyBlog.AdminArea.BlogAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div style="padding:5px; margin:100px 5px 5px 5px;width:100%">
        <h3 style="margin:5px">Add New Blog</h3>
        <table style="width: 100%;">
            <tr>
                <td style="width:20%;padding:5px;">
                    <asp:Label ID="Label1" runat="server" Text="Categories"></asp:Label>
                </td>
                <td style="width:70%;padding:5px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="Categorie_Name" DataValueField="Categorie_Id">
                        <asp:ListItem Value="o">Categories</asp:ListItem>
                    </asp:DropDownList>
                   
                </td>
            </tr>
            <tr>
                <td style="width:20%;padding:5px;">
                    <asp:Label ID="Label2" runat="server" Text="Blog Name"></asp:Label>
                </td>
                <td style="width:70%;padding:5px;">
                    <asp:TextBox ID="txtName" runat="server" Width="70%" Height="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:20%;padding:5px;">
                    <asp:Label ID="Label3" runat="server" Text="Content"></asp:Label>
                </td>
                <td style="width:70%;padding:5px;">
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="70%" Height="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:20%;padding:5px;">
                    <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label>
                </td>
                <td style="width:70%;padding:5px;">
                    <asp:FileUpload ID="fuNewPhoto" runat="server" ToolTip="select Photo"/>
                    <asp:RequiredFieldValidator ID="rfvfuNewPhoto" runat="server" ErrorMessage="*" ToolTip="Select Photo" ControlToValidate="fuNewPhoto"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revfuNewPhoto" runat="server" Text="*" ToolTip="Image formate only" ControlToValidate="fuNewPhoto" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
