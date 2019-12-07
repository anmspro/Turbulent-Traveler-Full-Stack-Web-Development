<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="StudyBlog.AdminArea.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <!--mainpage chit-chating-->
    <br />
    <br />
    <div class="chit-chat-layer1">
	    <div class="col-md-6 chit-chat-layer1-left" style="margin-top:100px">
                   <div class="work-progres">
                                <div class="chit-chat-heading" style="margin-top:70px">
                                      Add Categorie
                                </div>
                      <div class="clearfix"> </div>
                       <br />
                                <div class="table-responsive">
                                    <asp:Label ID="Label1" runat="server" class="col-md-10 control-label" >Categorie Name</asp:Label>
                                    <div class="clearfix"> </div>
                                    <br />
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Categorie Name.." required=""></asp:TextBox>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                       <div class="clearfix"> </div>
                       <br />
                       <br />
                       <div class="form-group">
                           <div class="clearfix"> </div>
                           <div class="col-sm-10">
                               <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-info" OnClick="btnSave_Click" />
                           </div>
                       </div>
                       <div class="clearfix"> </div>
                       <br />
                       <br />
                       <br />
                       <br />
                       
                   </div>
            <br />
          </div>
          <div class="col-md-6 chit-chat-layer1-rit">    	
      	      <div class="geo-chart" style="margin-top:100px">
					    <section id="charts1" class="charts">
				    <div class="wrapper-flex">
				
				        <div class="col geo_main">
				            <h3 id="geoChartTitle">All Categories</h3>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%" CssClass="table table-hover" EmptyDataText="There is no record">
                                <HeaderStyle />
                                    <AlternatingRowStyle />
                                        <Columns>
                                            <asp:TemplateField HeaderText="No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Categorie_Name" HeaderText="Name" />
                                        </Columns>
                            </asp:GridView>
				        </div>
				
				
				    </div><!-- .wrapper-flex -->
				    </section>				
			    </div>
              <div class="clearfix"> </div>
          </div>
         <div class="clearfix"> </div>
        <br />
        <br />
    </div>
</asp:Content>
