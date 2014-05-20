<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="patrondetails.aspx.vb" Inherits="Librarians_patrondetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 168px;
        }
        .auto-style2 {
            width: 198px;
        }
        .auto-style3 {
            width: 178px;
        }
        .auto-style4 {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserId" DataSourceID="SqlDataSource1" Width="272px">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td align="right" class="auto-style1"> First Name: </td><td align="left" class="auto-style4"><asp:TextBox ID="tb_FirstName" runat="server" Text='<%# Bind("FirstName") %>' /></td>
                    </tr> 

                    <tr>
                        <td align="right" class="auto-style1"> Last Name: </td><td align="left" class="auto-style4"><asp:TextBox ID="tb_LastName" runat="server" Text='<%# Bind("LastName") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style1"> Primary Email: </td><td align="left" class="auto-style4"><asp:TextBox ID="tb_PrimaryEmail" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
                    </tr>

                    <tr>
                        <td class="auto-style1"> &nbsp; </td><td class="auto-style4"> &nbsp; </td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style1"> User ID: </td><td align="left" class="auto-style4"><asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("UserId") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style1"> User Name: </td><td align="left" class="auto-style4"><asp:TextBox ID="tb_UserName" runat="server" enabled="false" Text='<%# Bind("UserName") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style1"> Role Name: </td><td align="left" class="auto-style4"><asp:TextBox ID="tb_RoleName" runat="server" enabled="false" Text='<%# Bind("RoleName") %>' /></td>
                    </tr>
                </table>

                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp; &nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>"
                    SelectCommand="SELECT [StateAbbrv] FROM [States]"></asp:SqlDataSource>
            </EditItemTemplate>


            <InsertItemTemplate>
               
            </InsertItemTemplate>


            <ItemTemplate>

                <table style="width: 461px">
                    <tr>
                        <td align="right" class="auto-style3"> First Name: </td><td align="left"><asp:Label ID="lbl_FirstName" runat="server" Text='<%# Bind("FirstName") %>' /></td>
                    </tr> 

                    <tr>
                        <td align="right" class="auto-style3"> Last Name: </td><td align="left"><asp:Label ID="lbl_LastName" runat="server" Text='<%# Bind("LastName") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style3"> Primary Email: </td><td align="left"><asp:Label ID="lbl_PrimaryEmail" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
                    </tr>

                    <tr>
                        <td class="auto-style3"> &nbsp; </td><td> &nbsp; </td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style3"> User ID: </td><td align="left"><asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("UserId") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style3"> User Name: </td><td align="left"><asp:Label ID="lbl_UserName" runat="server" Text='<%# Bind("UserName") %>' /></td>
                    </tr>

                    <tr>
                        <td align="right" class="auto-style3"> Role Name: </td><td align="left"><asp:Label ID="lbl_RoleName" runat="server" Text='<%# Bind("RoleName") %>' /></td>
                    </tr>
                </table>

                <asp:Button ID="EditButton" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit"/>

                &nbsp;

                <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" onclick="DeleteButton_Click" OnClientClick="return confirm('Are you sure you want to delete this patron?')" />

                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="MaterialType" HeaderText="Material Type" SortExpression="MaterialType" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="Due Date" SortExpression="ReturnDate" />
                    </Columns>
                </asp:GridView>

                <br />

            </ItemTemplate>

        </asp:FormView>

        <br />

        <asp:Label ID="lbl_DeletedPatron" runat="server" Text=""></asp:Label>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" 
            DeleteCommand="DELETE FROM [aspnet_Users] WHERE [UserId] = @UserId"
            SelectCommand="SELECT Patrons.FirstName, Patrons.LastName, aspnet_Users.UserName, Patrons.PrimaryEmail, aspnet_Roles.RoleName, Patrons.UserId FROM aspnet_Users INNER JOIN Patrons ON aspnet_Users.UserId = Patrons.UserId INNER JOIN aspnet_Roles ON aspnet_Users.ApplicationId = aspnet_Roles.ApplicationId WHERE (aspnet_Users.UserId = @UserId)"
            UpdateCommand="UPDATE [Patrons] SET [FirstName] = @FirstName, [LastName] = @LastName, [PrimaryEmail] = @PrimaryEmail WHERE [UserId] = @UserId">

            <DeleteParameters>
                <asp:Parameter Name="UserId" Type="Object" />
            </DeleteParameters>

            <SelectParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="PrimaryEmail" Type="String" />
                <asp:Parameter Name="UserId" />
            </UpdateParameters>

        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT Materials.ISBN, Materials.Title, Materials.MaterialType, Rentals.ReturnDate FROM Rentals INNER JOIN Materials ON Rentals.ISBN = Materials.ISBN WHERE (Rentals.UserId = @UserId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>


    </p>
</asp:Content>

