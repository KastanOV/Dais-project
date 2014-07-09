<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BazarTires.aspx.cs" Inherits="KAS0110.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pneumatiky v Bazaru</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="Customers_id">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Výrobce" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Size" HeaderText="Velikost" SortExpression="Size" />
            <asp:BoundField DataField="Type" HeaderText="Typ" SortExpression="Type" />
            <asp:BoundField DataField="Description" HeaderText="Popis" SortExpression="Description" />
            <asp:BoundField DataField="Customers_id" HeaderText="Customers_id" SortExpression="Customers_id" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowSelectButton="True" />
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
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="lname" HeaderText="Příjmení" SortExpression="lname" />
            <asp:BoundField DataField="fname" HeaderText="Jméno" SortExpression="fname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="Telefón" SortExpression="phone" />
            <asp:BoundField DataField="adress" HeaderText="adress" SortExpression="adress" Visible="False" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" Visible="False" />
            <asp:BoundField DataField="postaCode" HeaderText="postaCode" SortExpression="postaCode" Visible="False" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="KAS0110.Models.Database.BazarTires" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Select" TypeName="KAS0110.Models.Database.BazarTiresTable"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <p></p>
    <h3>Přidat pneumatiky</h3>
    <p></p>
    <table>
        <tr>
            <td>
                Výrobce
            </td>
            <td>
                <asp:TextBox ID="TextBoxManu" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxManu"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Velikost
            </td>
            <td>
                <asp:TextBox ID="TextBoxSize" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxSize"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Typ
            </td>
            <td>
                <asp:TextBox ID="TextBoxType" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxType"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Description
            </td>
            <td>
                <asp:TextBox ID="TextBoxDesc" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxDesc"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <p>Nejprve zapište údaje potom přiřaďte klienta</p>
    <p>Vyhledávání
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
    </p>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSource3" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
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
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="lname" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
