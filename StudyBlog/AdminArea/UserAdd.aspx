<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserAdd.aspx.cs" Inherits="StudyBlog.AdminArea.UserAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <div>
            <div>
                <h2>Add New User</h2>
            </div>
            <div>
                <table style="width: 100%;">
                        <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label7" runat="server" Text="UserName : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User Name" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label2" runat="server" Text="Email : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter E-mail" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label3" runat="server" Text="Password : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label4" runat="server" Text="Confirm Password : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtcfmPassword" TextMode="Password" runat="server" ></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="txtcfmPassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match !!" ControlToCompare="txtPassword" ControlToValidate="txtcfmPassword" ></asp:CompareValidator>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:20%;padding:5px;"><asp:Label ID="Label5" runat="server" Text="Mobile Number : "></asp:Label></td>
                        <td style="width:70%;padding:5px;"><asp:TextBox ID="txtMobileNo" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobileNo"></asp:RequiredFieldValidator>
                        </td>
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
