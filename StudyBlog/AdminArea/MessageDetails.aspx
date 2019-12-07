<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="MessageDetails.aspx.cs" Inherits="StudyBlog.AdminArea.MessageDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <asp:Repeater ID="repMsgDetails" runat="server">
            <ItemTemplate>
                <div>
                    <div>
                        <h2>Message Details :</h2>
                    </div>
                    <div class="clearfix"> </div>
                    <div style="padding:5px">
                        <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Email : "></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Date : "></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("Message_Date") %>'></asp:Label>
                        <br />
                        <hr />
                        <br />
                    </div>
                    <div class="clearfix"> </div>
                    <div style="padding:5px">
                        <h3>Message :</h3>
                        <hr />
                        <br />
                    </div>
                    <div style="padding: 10px;">
                        <asp:TextBox ID="Label7" width="900px" height="500px" runat="server" TextMode="MultiLine" ReadOnly="true" Text='<%# Eval("Message_Details","") %>'></asp:TextBox>
                       
                    </div>
                    <div class="clearfix"> </div>
                    <div style="padding:5px">
                        <hr />
                        <asp:Button ID="Btnback" runat="server" Text="Back" PostBackUrl="Message.aspx" />
                        <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
