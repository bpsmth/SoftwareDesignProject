<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="addpatron.aspx.vb" Inherits="Librarians_addpatron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT * FROM [Patrons]"></asp:SqlDataSource>
    </p>
        <br />
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" LoginCreatedUser="false" Width="574px">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />

                <asp:WizardStep ID="UserProfile" runat="server" StepType="Step" Title="User Profile Settings">
                    
                    <table> 
                        <tr>
                            <td align="right">First Name:</td><td align="left"> <asp:TextBox ID="tb_FirstName" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Last Name:</td><td align="left"> <asp:TextBox ID="tb_LastName" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Birth Date:</td><td align="left"> <asp:TextBox ID="tb_BirthDate" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Address 1:</td><td align="left"> <asp:TextBox ID="tb_Address1" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Address 2:</td><td align="left"> <asp:TextBox ID="tb_Address2" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">City:</td><td align="left"> <asp:TextBox ID="tb_City" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">State:</td><td align="left"> <asp:DropDownList ID="ddl_State" runat="server" DataSourceID="ds_ddlState" DataTextField="StateAbbrv" DataValueField="StateAbbrv"></asp:DropDownList></td>
                        </tr>

                        <tr>
                            <td align="right">Zip Code:</td><td align="left"> <asp:TextBox ID="tb_Zip" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Phone Number:</td><td align="left"> <asp:TextBox ID="tb_PhoneNumber1" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Phone Number 2:</td><td align="left"> <asp:TextBox ID="tb_PhoneNumber2" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td align="right">Primary Email:</td><td align="left"> <asp:TextBox ID="tb_Email" runat="server" Columns="50"></asp:TextBox></td>
                        </tr>
                    </table>

                    <asp:SqlDataSource runat="server"
                        ID="ds_ddlState"
                        ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>"
                        SelectCommand="SELECT [StateAbbrv] FROM [States]"></asp:SqlDataSource>


                </asp:WizardStep>

                <asp:CompleteWizardStep runat="server" >
                    <ContentTemplate>
                        <table style="font-size:100%;width:574px;">
                            <tr>
                                <td align="center" colspan="2">Complete</td>
                            </tr>
                            <tr>
                                <td>Your account has been successfully created.</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
</asp:Content>

