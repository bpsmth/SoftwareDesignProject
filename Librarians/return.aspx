<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="return.aspx.vb" Inherits="Librarians_return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<br />
     
    <table class="center">
        <tr>
            <td align="right"> ISBN of material to be returned: </td><td aligh ="left"><asp:TextBox ID="tb_ISBN" runat="server"></asp:TextBox></td>
        
            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_ISBNRequired" runat="server"
                    ControlToValidate="tb_ISBN" ErrorMessage="Please enter the ISBN of the material to be returned."
                    ToolTip="Please enter the ISBN of the material to be returned.">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <br />

    <asp:Button ID="btn_Return" runat="server" Text="Return Material" />
    &nbsp;
    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" />

</asp:Content>

