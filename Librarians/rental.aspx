<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="rental.aspx.vb" Inherits="Librarians_rental" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="center">

    <tr>
        <td align="right"> *Username: </td><td align="left"><asp:TextBox ID="tb_UserName" runat="server"></asp:TextBox></td>
        
        <td align="left">
            <asp:RequiredFieldValidator ID="rfd_UserNameRequired" runat="server"
                ControlToValidate="tb_UserName" ErrorMessage="Please enter the UserName of the person renting the material."
                ToolTip="Please enter the UserName of the person renting the tool.">
            </asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td align="right"> *ISBN: </td><td align="left"><asp:TextBox ID="tb_ISBN" runat="server"></asp:TextBox></td>

        <td align="left">
            <asp:RequiredFieldValidator ID="rfd_ISBNRequired" runat="server"
                ControlToValidate="tb_ISBN" ErrorMessage="Please enter the ISBN of the material being rented."
                ToolTip="Please enter the ISBN of the material being rented.">
            </asp:RequiredFieldValidator>
        </td>
    </tr> 

    </table>

    <br />

    <asp:Button ID="btn_Rent" runat="server" Text="Rent Material" />

    &nbsp;
    
    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" />

</asp:Content>

