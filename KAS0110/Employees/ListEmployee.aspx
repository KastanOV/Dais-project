<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListEmployee.aspx.cs" Inherits="KAS0110.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" datakeynames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="lname" HeaderText="Příjmení" SortExpression="lname" />
            <asp:BoundField DataField="fname" HeaderText="Jméno" SortExpression="fname" />
            <asp:BoundField DataField="login" HeaderText="Login" SortExpression="login" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Editovat" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="KAS0110.Models.Database.Employee" SelectMethod="Select" TypeName="KAS0110.Models.Database.EmployeeTable" UpdateMethod="Update"></asp:ObjectDataSource>
    
</asp:Content>
