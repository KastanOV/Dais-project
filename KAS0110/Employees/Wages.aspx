<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wages.aspx.cs" Inherits="KAS0110.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Výplata</h2>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="login" DataValueField="id" Font-Size="Large" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectWages" TypeName="KAS0110.Models.Database.AttendanceTable">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Arrival" HeaderText="Arrival" SortExpression="Arrival" />
            <asp:BoundField DataField="Exit" HeaderText="Exit" SortExpression="Exit" />
            <asp:BoundField DataField="Wage" HeaderText="Wage" SortExpression="Wage" />
            <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" Visible="False" />
            <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" SortExpression="EmployeeId" Visible="False" />
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
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Vyplatit mzdu" OnClick="Button1_Click" />
</asp:Content>
