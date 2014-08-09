<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExtStore.aspx.cs" Inherits="KAS0110.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Externí sklad pneumatik OK Pneu</h2>
    <asp:TextBox ID="TextBoxSize" runat="server" OnTextChanged="TextBoxSize_TextChanged" CssClass="form-control"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Rozměr pneumatik zadávejte v profi formátu. Např: 1956515 <=> 195/65R15"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataValueField="Text" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
    
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
    <br />
    <asp:CheckBox ID="CheckBoxExtStore" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="CheckBoxExtStore_CheckedChanged" /><asp:Label ID="LabelExtStore" runat="server" Text="Pneumatiky jsou skladem u dodavatele"></asp:Label>
    <br />
    <asp:CheckBox ID="CheckBoxLocStore" runat="server" AutoPostBack="True" /><asp:Label ID="LabelLocStore" runat="server" Text="Pneumatiky jsou v příručním skladu"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="EAN">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
            <asp:BoundField DataField="Sirka" HeaderText="Sirka" SortExpression="Sirka" Visible="False" />
            <asp:BoundField DataField="Vyska" HeaderText="Vyska" SortExpression="Vyska" Visible="False" />
            <asp:BoundField DataField="Prumer" HeaderText="Prumer" SortExpression="Prumer" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Detail" HeaderText="Detail" SortExpression="Detail" Visible="False" />
            <asp:BoundField DataField="EAN" HeaderText="EAN" SortExpression="EAN" />
            <asp:BoundField DataField="OnStore" HeaderText="OnStore" SortExpression="OnStore" />
            <asp:BoundField DataField="ExternalStore" HeaderText="ExternalStore" SortExpression="ExternalStore" />
            <asp:BoundField DataField="NakupniCena" HeaderText="NakupniCena" SortExpression="NakupniCena" Visible="False" />
            <asp:BoundField DataField="ProdejniCena" HeaderText="ProdejniCena" SortExpression="ProdejniCena" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Season" HeaderText="Season" SortExpression="Season" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
            <asp:BoundField DataField="ImageURL" HeaderText="ImageURL" SortExpression="ImageURL" Visible="False" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="FindManufacturers" TypeName="KAS0110.Models.Database.OkPneuTireTable"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.OkPneuTireTable" OnSelecting="ObjectDataSource2_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSize" Name="strsize" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="season" PropertyName="SelectedValue" Type="Char" />
            <asp:ControlParameter ControlID="CheckBoxExtStore" Name="OnExternalStore" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="CheckBoxLocStore" Name="OnLokalStore" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="DropDownList1" Name="manu" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <p>
        <asp:Button ID="ButtonAddOrder" runat="server" Text="Vytvořit novou objednávku" OnClick="ButtonAddOrder_Click" /></p>
</asp:Content>
