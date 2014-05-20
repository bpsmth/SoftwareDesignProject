<%@ Page Title="" Language="VB" MasterPageFile="~/Mobile/mobile.master" AutoEventWireup="false" CodeFile="mobmaterials.aspx.vb" Inherits="Mobile_mobmaterials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a href="./Default.aspx">Mobile Home</a>
    <br />
     
    <% If Not IsPostBack Then%>
    Search Materials:
    <asp:TextBox ID="mobTb" runat="server" CausesValidation="True"></asp:TextBox>
    <% Else%>
    Search Again:<asp:TextBox ID="mobTb2" runat="server" CausesValidation="True"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
            <asp:BoundField DataField="MaterialType" HeaderText="MaterialType" SortExpression="MaterialType" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="Copyright" HeaderText="Copyright" SortExpression="Copyright" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
            <asp:BoundField DataField="CallNumber" HeaderText="CallNumber" SortExpression="CallNumber" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_SLPL1 %>" SelectCommand="SELECT [ISBN], [MaterialType], [Title], [Author], [Publisher], [Copyright], [Description], [Availability], [CallNumber] FROM [Materials]"></asp:SqlDataSource>
       <% End If %> 

</asp:Content>

