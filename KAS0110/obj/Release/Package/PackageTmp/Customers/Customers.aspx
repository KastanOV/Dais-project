<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="KAS0110.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Klienti</h2>
    <p>Vyhledávání <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  <asp:Button ID="Button1" runat="server" Text="Přidat vozidlo" OnClick="Button1_Click1" /></p>
    &nbsp;<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="fname" HeaderText="Jméno" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Příjmení" SortExpression="lname" />
            <asp:BoundField DataField="phone" HeaderText="Telefón" SortExpression="phone" />
            <asp:BoundField DataField="adress" HeaderText="Adresa" SortExpression="adress" />
            <asp:BoundField DataField="city" HeaderText="Město" SortExpression="city" />
            <asp:BoundField DataField="postaCode" HeaderText="PSČ" SortExpression="postaCode" />
            <asp:CommandField ButtonType="Button" EditText="Upravit" SelectText="Vybrat" ShowEditButton="True" ShowSelectButton="True" UpdateText="Potvrdit" />
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

    <br />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="id" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="Tiremanufacturer" HeaderText="Výrobce" SortExpression="Tiremanufacturer" />
            <asp:BoundField DataField="DiscDescription" HeaderText="Disk popis" SortExpression="DiscDescription" />
            <asp:BoundField DataField="TireDecription" HeaderText="Pneumatika popis" SortExpression="TireDecription" />
            <asp:BoundField DataField="StoreDate" HeaderText="Datum uskladnění" SortExpression="StoreDate" />
            <asp:BoundField DataField="Customers_id" HeaderText="Customers_id" SortExpression="Customers_id" Visible="False" />
            <asp:BoundField DataField="Employees_id_Store" HeaderText="Employees_id_Store" SortExpression="Employees_id_Store" Visible="False" />
            <asp:BoundField DataField="EmpStoreFname" HeaderText="EmpStoreFname" SortExpression="EmpStoreFname" Visible="False" />
            <asp:BoundField DataField="EmpStoreLname" HeaderText="Uskladnil" SortExpression="EmpStoreLname" />
            <asp:BoundField DataField="EmpUnStoreFname" HeaderText="EmpUnStoreFname" SortExpression="EmpUnStoreFname" Visible="False" />
            <asp:BoundField DataField="UnstoreDate" HeaderText="Datum vyskladnění" SortExpression="UnstoreDate" />
            <asp:BoundField DataField="EmpUnStoreLname" HeaderText="Vyskladnil" SortExpression="EmpUnStoreLname" />
            <asp:BoundField DataField="Employees_id_Unstore" HeaderText="Employees_id_Unstore" SortExpression="Employees_id_Unstore" Visible="False" />
            <asp:CommandField ButtonType="Button" SelectText="Vyskladnit" ShowSelectButton="True" />
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

    <br />

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable" DataObjectTypeName="KAS0110.Models.Database.Customer" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="lname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.StoredWheelsTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    </asp:Content>
