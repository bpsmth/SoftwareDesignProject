<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="materialdetails.aspx.vb" Inherits="Librarians_materialdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 189px;
        }
        .auto-style2 {
            width: 194px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" 
            SelectCommand="SELECT * FROM [Materials] WHERE ([ISBN] = @ISBN)" 
            DeleteCommand="DELETE FROM [Materials] WHERE [ISBN] = @ISBN" 
            InsertCommand="INSERT INTO [Materials] ([ISBN], [MaterialType], [Title], [Author], [Publisher], [Copyright], [Description], [Availability], [ImageText], [CallNumber]) VALUES (@ISBN, @MaterialType, @Title, @Author, @Publisher, @Copyright, @Description, @Availability, @ImageText, @CallNumber)" 
            UpdateCommand="UPDATE [Materials] SET [MaterialType] = @MaterialType, [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [Description] = @Description, [Availability] = @Availability, [ImageText] = @ImageText, [CallNumber] = @CallNumber WHERE [ISBN] = @ISBN">
            
            <DeleteParameters>
                <asp:Parameter Name="ISBN" Type="Int64" />
            </DeleteParameters>

            <InsertParameters>
                <asp:Parameter Name="ISBN" Type="Int64" />
                <asp:Parameter Name="MaterialType" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Copyright" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Availability" Type="String" />
                <asp:Parameter Name="ImageText" Type="String" />
                <asp:Parameter Name="CallNumber" Type="String" />
            </InsertParameters>

            <SelectParameters>
                <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="Int64" />
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="MaterialType" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Publisher" Type="String" />
                <asp:Parameter Name="Copyright" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Availability" Type="String" />
                <asp:Parameter Name="ImageText" Type="String" />
                <asp:Parameter Name="CallNumber" Type="String" />
                <asp:Parameter Name="ISBN" Type="Int64" />
            </UpdateParameters>

        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" 
            SelectCommand="SELECT [MaterialType] FROM [MaterialTypes]">
        </asp:SqlDataSource>



        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT Patrons.UserId, Patrons.FirstName, Patrons.LastName, Patrons.City, Patrons.State FROM Rentals INNER JOIN Patrons ON Rentals.UserId = Patrons.UserId WHERE (Rentals.ISBN = @ISBN)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ISBN" QueryStringField="ISBN" Type="Int64"/>
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" Width="361px">
            
            
            <EditItemTemplate>
                <table>
                    <tr>
                        <td align="right"> ISBN: </td><td align="left"><asp:TextBox ID="tb_ISBN" runat="server" enabled="false" Text='<%# Bind("ISBN")%>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Material Type: </td>
                        <td align="left">
                            <asp:DropDownList ID="ddl_MaterialType" runat="server" DataSourceID="SqlDataSource2"
                                DataTextField="MaterialType" DataValueField="MaterialType" SelectedValue='<%# Bind("MaterialType") %>' >
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"> Title: </td><td align="left"><asp:TextBox ID="tb_Title" runat="server" Text='<%# Bind("Title") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Author: </td><td align="left"><asp:TextBox ID="tb_Author" runat="server" Text='<%# Bind("Author") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Publisher: </td><td align="left"><asp:TextBox ID="tb_Publisher" runat="server" Text='<%# Bind("Publisher") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Copyright: </td><td align="left"> <asp:TextBox ID="tb_Copyright" runat="server" Text='<%# Bind("Copyright") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Description: </td><td align="left">  <asp:TextBox ID="tb_Description" runat="server" Text='<%# Bind("Description") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Availability: </td><td align="left"> <asp:TextBox ID="tb_Availability" runat="server" Text='<%# Bind("Availability") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Image Text: </td><td align="left"><asp:TextBox ID="tb_Image" runat="server" Text='<%# Bind("ImageText")%>' /></td>
                    </tr>
                    <tr>
                        <td align="right"> Call Number: </td><td align="left"><asp:TextBox ID="tb_CallNumber" runat="server" Text='<%# Bind("CallNumber") %>' /></td>
                    </tr>                    

                </table>  
                
                    <br />

                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="true" CommandName="Update" Text="Update" />
                
                    &nbsp; &nbsp;
                
                    <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />         

            </EditItemTemplate>


            <InsertItemTemplate>

            </InsertItemTemplate>

            <ItemTemplate>

                <table>
                    <tr>
                        <td align="right" class="auto-style1"> ISBN: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_ISBN" runat="server" enabled="false" Text='<%# Bind("ISBN")%>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Material Type: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_MaterialType" runat="server" Text='<%# Bind("MaterialType") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Title: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_Title" runat="server" Text='<%# Bind("Title") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Author: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_Author" runat="server" Text='<%# Bind("Author") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Publisher: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_Publisher" runat="server" Text='<%# Bind("Publisher") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Copyright: </td><td align="left" class="auto-style2"> <asp:Label ID="lbl_Copyright" runat="server" Text='<%# Bind("Copyright") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Description: </td><td align="left" class="auto-style2">  <asp:Label ID="lbl_Description" runat="server" Text='<%# Bind("Description") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Availability: </td><td align="left" class="auto-style2"> <asp:Label ID="lbl_Availability" runat="server" Text='<%# Bind("Availability") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Image Text: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_Image" runat="server" Text='<%# Bind("ImageText")%>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style1"> Call Number: </td><td align="left" class="auto-style2"><asp:Label ID="lbl_CallNumber" runat="server" Text='<%# Bind("CallNumber") %>' /></td>
                    </tr>

                </table>
                <br />

                    <asp:Button ID="EditButton" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit" />
                    
                    &nbsp;
                    
                    <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this material?')" />

                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="User ID" ReadOnly="True" SortExpression="UserId" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    </Columns>
                </asp:GridView>

                <br />
                <br />

                <asp:DataList ID="MaterialPhotoDataList" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>

                        <a href='<%# Eval("ImageText", "../images/{0}")%>' target="blank">
                        <asp:Image ID="MaterialImage1" runat="server" 
                            ImageUrl='<%# Eval("ImageText", "~/images/{0}")%>' 
                            Height="200px"
                            AlternateText="Image Unavailable"
                            ToolTip='<%# Eval("Title")%>'/>
                        </a>
                    </ItemTemplate>
                </asp:DataList>

            </ItemTemplate>
        </asp:FormView>
    </p>
    <asp:Label ID="lbl_DeletedMaterial" runat="server" Text=""></asp:Label>
</asp:Content>

