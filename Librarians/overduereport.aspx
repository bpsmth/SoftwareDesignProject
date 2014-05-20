<%@ Page Title="" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="overduereport.aspx.vb" Inherits="Librarians_overduereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" 
        SelectCommand="SELECT [RentalID], [UserId], [ISBN], [CheckOutDate], [ReturnDate] FROM [Rentals]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RentalID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="RentalID" HeaderText="Rental ID" InsertVisible="False" ReadOnly="True" SortExpression="RentalID" />
            <asp:BoundField DataField="UserId" HeaderText="User ID" SortExpression="UserId" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="CheckOutDate" HeaderText="Check Out Date" SortExpression="CheckOutDate" />
            <asp:BoundField DataField="ReturnDate" HeaderText="Due Date" SortExpression="ReturnDate" />
        </Columns>
    </asp:GridView>
</asp:Content>

