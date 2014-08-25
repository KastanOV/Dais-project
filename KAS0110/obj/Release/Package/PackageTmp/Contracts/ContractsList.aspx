<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContractsList.aspx.cs" Inherits="KAS0110.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Výpis zakázek</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" Visible="False" />
            <asp:BoundField DataField="EmployeesId" HeaderText="EmployeesId" SortExpression="EmployeesId" Visible="False" />
            <asp:BoundField DataField="Arrival" HeaderText="Příjezd" SortExpression="Arrival" />
            <asp:BoundField DataField="GarageNumber" HeaderText="Stání" SortExpression="GarageNumber" />
            <asp:BoundField DataField="Exit" HeaderText="Odjezd" SortExpression="Exit" />
            <asp:BoundField DataField="Payment" HeaderText="Platba" SortExpression="Payment" />
            <asp:CheckBoxField DataField="VAT" HeaderText="Platce DPH" SortExpression="VAT" />
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
    <asp:Label ID="LabelTotalCash" runat="server" Text="Label"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.ContractTable"></asp:ObjectDataSource>
</asp:Content>
