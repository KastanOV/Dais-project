<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="KAS0110.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Objednávky</h2>
    <p>    </p>
    <p> 
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Zobrazit vyřízené objednávky" AutoPostBack="True" />
    </p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id,Status" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Customer_LastName" HeaderText="Příjmení" ReadOnly="True" SortExpression="Customer_LastName" />
            <asp:BoundField DataField="Customer_Phone" HeaderText="Telefon" ReadOnly="True" SortExpression="Customer_Phone" />
            <asp:BoundField DataField="Customer_email" HeaderText="Email" ReadOnly="True" SortExpression="Customer_email" />
            <asp:BoundField DataField="Employee_Login" HeaderText="Vyřídil" ReadOnly="True" SortExpression="Employee_Login" />
            <asp:BoundField DataField="Employee_Lname" HeaderText="Příjmení" ReadOnly="True" SortExpression="Employee_Lname" />
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="Customers_id" HeaderText="Customers_id" SortExpression="Customers_id" Visible="False" />
            <asp:BoundField DataField="Employees_id" HeaderText="Employees_id" SortExpression="Employees_id" Visible="False" />
            <asp:BoundField DataField="date" HeaderText="Datum objednání" ReadOnly="True" SortExpression="date" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowSelectButton="True" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="KAS0110.Models.Database.OrderExteneded" SelectMethod="Select" TypeName="KAS0110.Models.Database.OrderTable" UpdateMethod="UpdateOrder">
        <SelectParameters>
            <asp:ControlParameter ControlID="CheckBox1" Name="vyrizeneObj" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectTiresInOrder" TypeName="KAS0110.Models.Database.OrderTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:ObjectDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="EAN" HeaderText="EAN" SortExpression="EAN" />
            <asp:BoundField DataField="count" HeaderText="Počet" SortExpression="count" />
            <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" Visible="False" />
            <asp:BoundField DataField="Sirka" HeaderText="Sirka" SortExpression="Sirka" Visible="False" />
            <asp:BoundField DataField="Vyska" HeaderText="Vyska" SortExpression="Vyska" Visible="False" />
            <asp:BoundField DataField="Prumer" HeaderText="Prumer" SortExpression="Prumer" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Název pneumatiky                    " SortExpression="Name" />
            <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" Visible="False" />
            <asp:BoundField DataField="OnStore" HeaderText="OnStore" SortExpression="OnStore" Visible="False" />
            <asp:BoundField DataField="ExternalStore" HeaderText="ExternalStore" SortExpression="ExternalStore" Visible="False" />
            <asp:BoundField DataField="NakupniCena" HeaderText="NakupniCena" SortExpression="NakupniCena" Visible="False" />
            <asp:BoundField DataField="ProdejniCena" HeaderText="ProdejniCena" SortExpression="ProdejniCena" Visible="False" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" Visible="False" />
            <asp:BoundField DataField="Season" HeaderText="Season" SortExpression="Season" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
            <asp:BoundField DataField="ImageURL" HeaderText="ImageURL" SortExpression="ImageURL" Visible="False" />
            <asp:BoundField DataField="OrderPrice" HeaderText="Slíbená cena" SortExpression="OrderPrice" />
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
</asp:Content>
