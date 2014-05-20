<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="viewmaterials.aspx.vb" Inherits="Librarians_viewmaterials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT [ISBN], [MaterialType], [Title], [Author], [Publisher], [Copyright], [Description], [Availability], [ImageText], [CallNumber] FROM [Materials]"></asp:SqlDataSource>
    </p>

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
            <asp:BoundField DataField="CallNumber" HeaderText="Call Number" SortExpression="CallNumber" />
            <asp:HyperLinkField DataNavigateUrlFields="ISBN" DataNavigateUrlFormatString="materialdetails.aspx?ISBN={0}" Text="Select" />
        </Columns>
    </asp:GridView>

</asp:Content>

