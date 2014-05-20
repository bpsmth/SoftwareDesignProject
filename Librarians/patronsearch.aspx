<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="patronsearch.aspx.vb" Inherits="Librarians_patronsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:6k183g8ConnectionString %>" SelectCommand="SELECT * FROM [Patrons]"></asp:SqlDataSource>
    Search Patrons By Last Name:<asp:TextBox ID="patsearch" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" />
            <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
            <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="PhoneNumber1" HeaderText="PhoneNumber1" SortExpression="PhoneNumber1" />
            <asp:BoundField DataField="PhoneNumber2" HeaderText="PhoneNumber2" SortExpression="PhoneNumber2" />
            <asp:BoundField DataField="PrimaryEmail" HeaderText="PrimaryEmail" SortExpression="PrimaryEmail" />
            <asp:BoundField DataField="Fines" HeaderText="Fines" SortExpression="Fines" />
        </Columns>
    </asp:GridView>

</asp:Content>

