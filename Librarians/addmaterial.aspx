<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="addmaterial.aspx.vb" Inherits="Librarians_addmaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 188px;
        }
        .auto-style2 {
            width: 208px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" 
        
        SelectCommand="SELECT [MaterialType] FROM [MaterialTypes]">

        </asp:SqlDataSource>

    <br />
    <br />

    <table class="center">
        <tr>
            <td align="right"> Type of Material: </td> 
            <td align="left"><asp:DropDownList ID="ddl_MaterialType" runat="server" DataSourceID="SqlDataSource2" DataTextField="MaterialType" DataValueField="MaterialType">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td align="right"> *Title: </td><td align="left"><asp:TextBox ID="tb_Title" runat="server"></asp:TextBox></td>
        
            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_TitleRequired" runat="server"
                    ControlToValidate="tb_Title" ErrorMessage="Please enter the Title of the material being added."
                    ToolTip="Please enter the Title of the material being added.">
                </asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>
            <td align="right"> Author: </td><td align="left"><asp:TextBox ID="tb_Author" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td align="right"> *Publisher: </td><td align="left"><asp:TextBox ID="tb_Publisher" runat="server"></asp:TextBox></td>

            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_PublisherRequired" runat="server"
                    ControlToValidate="tb_Publisher" ErrorMessage="Please enter the Publisher of the material being added."
                    ToolTip="Please enter the Publisher of the material being added.">
                </asp:RequiredFieldValidator>
            </td>
        </tr>

         <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>
            <td align="right"> Copyright: </td><td align="left"><asp:TextBox ID="tb_Copyright" runat="server"></asp:TextBox></td> 
        </tr>

        <tr>
            <td align="right"> Description: </td><td align="left"><asp:TextBox ID="tb_Description" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td align="right"> *Availability: </td><td align="left"><asp:TextBox ID="tb_Availability" runat="server"></asp:TextBox></td>

            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_AvailabilityRequired" runat="server"
                    ControlToValidate="tb_Availability" ErrorMessage="Please enter the Availability of the material being added using either Y or N."
                    ToolTip="Please enter the Availability of the material being added using either Y or N.">
                    <span class="rfd">Please indicate the Availability using values Y or N.</span>
                </asp:RequiredFieldValidator>
            </td>
        </tr>
            
        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>
            <td align="right"> *Call Number: </td><td align="left"><asp:TextBox ID="tb_CallNumber" runat="server"></asp:TextBox></td>
            
            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_CallNumberRequired" runat="server"
                    ControlToValidate="tb_CallNumber" ErrorMessage="Please enter the Call Number of the material being added."
                    ToolTip="Please enter the Call Number of the material being added.">
                </asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>
            <td align="right"> *ISBN: </td><td align="left"><asp:TextBox ID="tb_ISBN" runat="server"></asp:TextBox></td>

            <td align="left">
                <asp:RequiredFieldValidator ID="rfd_ISBNRequired" runat="server"
                    ControlToValidate="tb_ISBN" ErrorMessage="Please enter the ISBN of the material being added."
                    ToolTip="Please enter the ISBN of the material being added.">
                </asp:RequiredFieldValidator>
        </tr>

    </table>

    <br />

    Image to Upload: <asp:FileUpload ID="fileUpload" runat="server" />
    <br />
    <br />

    <asp:Button ID="btn_Add" runat="server" Text="Add New Material" />

    &nbsp;

    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" />

   
    <br />
</asp:Content>

