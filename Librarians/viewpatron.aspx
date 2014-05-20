<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="viewpatron.aspx.vb" Inherits="Librarians_viewpatron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT * FROM [Patrons]"></asp:SqlDataSource>
    </p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" SortExpression="PrimaryEmail" />
            <asp:BoundField DataField="Fines" HeaderText="Fines" SortExpression="Fines" />
            <asp:HyperLinkField DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="patrondetails.aspx?UserId={0}" Text="Select" />
        </Columns>
    </asp:GridView>
</asp:Content>

