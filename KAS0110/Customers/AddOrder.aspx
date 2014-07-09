<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="KAS0110.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Vytvořit objednávku</h2>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBoxCount" runat="server" Width="63px"></asp:TextBox> Počet kusů
        k objednání
    </p>
    <p><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSourceDropDownList" DataTextField="lname" DataValueField="id" Font-Size="Large"></asp:DropDownList> Zaměstnanec který objednávku vytvořil</p>
    <p><asp:TextBox ID="TextBoxSearchCustomers" runat="server" AutoPostBack="True"></asp:TextBox> Vyhledávání klientů</p>
    <asp:GridView ID="GridViewCustomers" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSourceCustomers" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="lname" HeaderText="Příjmení" SortExpression="lname" />
            <asp:BoundField DataField="fname" HeaderText="jméno" SortExpression="fname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="Telefón" SortExpression="phone" />
            <asp:BoundField DataField="adress" HeaderText="adress" SortExpression="adress" Visible="False" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" Visible="False" />
            <asp:BoundField DataField="postaCode" HeaderText="postaCode" SortExpression="postaCode" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
    
    <asp:ObjectDataSource ID="ObjectDataSourceDropDownList" runat="server" SelectMethod="SelectEmployeesInWork" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceCustomers" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSearchCustomers" Name="lname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
