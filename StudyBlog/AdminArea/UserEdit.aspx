<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="StudyBlog.AdminArea.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <div>
            <div>
                <h2>Edit User Info</h2>
            </div>
            <div>
                <table style="width: 100%;">
                        <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label7" runat="server" Text="UserName : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label2" runat="server" Text="Email : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label3" runat="server" Text="Password : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtPassword" runat="server" ></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label5" runat="server" Text="Mobile Number : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtMobileNo" runat="server" ></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label1" runat="server" Text="select Image : "></asp:Label></td>
                        <td style="width:70%;padding:5px;">
                            <asp:Image ID="imgPhoto" Width="100px" Height="100px" runat="server" />
                            <asp:FileUpload ID="fuNewPhoto" runat="server" ToolTip="select Photo"/>
                            <asp:RequiredFieldValidator ID="rfvfuNewPhoto" runat="server" ErrorMessage="*" ToolTip="Select Photo" ControlToValidate="fuNewPhoto"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revfuNewPhoto" runat="server" Text="*" ToolTip="Image formate only" ControlToValidate="fuNewPhoto" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</asp:Content>
