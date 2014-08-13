<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBigContract.aspx.cs" Inherits="KAS0110.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <asp:Table ID="Table1" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableHeaderCell Width="30%">
                <b>Renáta Kašturová</b><br />
                Statovní 4 <br />
                Ostrava <br />
            </asp:TableHeaderCell>
            <asp:TableHeaderCell Width="30%">
                IC:123456 <br />
                DIC: CZ1235456 <br />
                www.servisplzenska.cz
            </asp:TableHeaderCell>
            <asp:TableCell Width="40%">
                <asp:Label ID="CompanyName" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="CustName" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="Adress" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="IC" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="DIC" runat="server" Text="Label"></asp:Label><br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Width="30%">
            <asp:TableCell>
                Vyřizuje
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="login" DataValueField="id" CssClass="form-control"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow >
        
    </asp:Table>
    </asp:Panel>
<h1>Nová faktura</h1>
    

    <h3>Cena prací</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceWork" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="COUNT" HeaderText="COUNT" SortExpression="COUNT" />
            <asp:BoundField DataField="Contract_id" HeaderText="Contract_id" SortExpression="Contract_id" Visible="False" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="id" CssClass="form-control"></asp:DropDownList>
                <p></p>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="1" ></asp:TextBox>
                <p><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ToolTip="Počet kusů" ErrorMessage="Asi by jsi tady mel napsat cislo kokote" ForeColor="Red" ControlToValidate="TextBox1" ValidationExpression="\d*"></asp:RegularExpressionValidator></p>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="ButtonAddWork" runat="server" Text="Přidat položku do faktury" CssClass="form-control" OnClick="ButtonAddWork_Click" />
                <p></p>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT [id], [Name] FROM [WorkItemsReady] ORDER BY [Name]"></asp:SqlDataSource>
    

    <p>
        <asp:SqlDataSource ID="SqlDataSourceWork" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" DeleteCommand="DELETE FROM [WorkItems] WHERE [id] = @id" InsertCommand="INSERT INTO [WorkItems] ([Name], [Description], [Price], [COUNT], [Contract_id]) VALUES (@Name, @Description, @Price, @COUNT, @Contract_id)" SelectCommand="SELECT [Name], [id], [Description], [Price], [COUNT], [Contract_id] FROM [WorkItems] WHERE ([Contract_id] = @Contract_id)" UpdateCommand="UPDATE [WorkItems] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [COUNT] = @COUNT, [Contract_id] = @Contract_id WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="COUNT" Type="Int32" />
                <asp:Parameter Name="Contract_id" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ContractID" Name="Contract_id" PropertyName="Value" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="COUNT" Type="Int32" />
                <asp:Parameter Name="Contract_id" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <asp:HiddenField ID="ContractID" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT Employees.login, EmployeeAttendance.[Exit], Employees.id FROM Employees INNER JOIN EmployeeAttendance ON Employees.id = EmployeeAttendance.Employees_id WHERE (EmployeeAttendance.[Exit] IS NULL)"></asp:SqlDataSource>
    </p>
    <h3>Cena materiálu</h3>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Horizontal" DataKeyNames="id" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="EAN" HeaderText="EAN" SortExpression="EAN" />
            <asp:BoundField DataField="Name" HeaderText="Název" SortExpression="Name" />
            <asp:BoundField DataField="PricePerItem" HeaderText="Cena" SortExpression="PricePerItem" />
            <asp:BoundField DataField="COUNT" HeaderText="Počet kusů" SortExpression="COUNT" />
            <asp:BoundField DataField="Contract_id" HeaderText="Contract_id" SortExpression="Contract_id" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <table>
        <tr>
            <td>
                <asp:TextBox ID="FindTires" AutoCompleteType="Search" AutoPostBack="true" runat="server" CssClass="form-control"></asp:TextBox>
                <p></p>
            </td>
            <td>
                <asp:TextBox ID="TiresItemsCount" runat="server" CssClass="form-control" ToolTip="Počet kusů pneumatik" ></asp:TextBox>
                <p><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Musíte vložit číslo" ForeColor="Red" ControlToValidate="TiresItemsCount" ValidationExpression="\d*"></asp:RegularExpressionValidator></p>
            </td>
            <td>
                <asp:Button ID="ButtonAddItems" runat="server" Text="Přidat pneumatiky do faktury" CssClass="form-control" OnClick="ButtonAddItems_Click" />
                <p></p>
            </td>
        </tr>
    </table>
    

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="EAN" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="EAN" HeaderText="EAN" ReadOnly="True" SortExpression="EAN" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Size" HeaderText="Velikost" SortExpression="Size" />
            <asp:BoundField DataField="OnStore" HeaderText="Sklad" SortExpression="OnStore" />
            <asp:BoundField DataField="Price" HeaderText="Cena" SortExpression="Price" />
            <asp:BoundField DataField="Name" HeaderText="Název" SortExpression="Name" />
            <asp:BoundField DataField="season" HeaderText="Období" SortExpression="season" />
            <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT [EAN], [Manufacturer], [Size], [OnStore], [Price], [Name], [season], [Photo] FROM [SuplierTiresOKpneu] WHERE (([Size] = @Size) AND ([OnStore] &gt; @OnStore)) ORDER BY [Price]">
        <SelectParameters>
            <asp:ControlParameter ControlID="FindTires" Name="Size" PropertyName="Text" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="OnStore" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    /// TODO //////////////////////////////////////////
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT [id], [EAN], [Name], [PricePerItem], [COUNT], [Contract_id] FROM [Items] WHERE ([Contract_id] = @Contract_id)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Items] WHERE [id] = @original_id AND [EAN] = @original_EAN AND [Name] = @original_Name AND [PricePerItem] = @original_PricePerItem AND [COUNT] = @original_COUNT AND [Contract_id] = @original_Contract_id" InsertCommand="INSERT INTO [Items] ([EAN], [Name], [PricePerItem], [COUNT], [Contract_id]) VALUES (@EAN, @Name, @PricePerItem, @COUNT, @Contract_id)" OldValuesParameterFormatString="original_{0}" OnSelecting="SqlDataSource5_Selecting" UpdateCommand="UPDATE [Items] SET [EAN] = @EAN, [Name] = @Name, [PricePerItem] = @PricePerItem, [COUNT] = @COUNT, [Contract_id] = @Contract_id WHERE [id] = @original_id AND [EAN] = @original_EAN AND [Name] = @original_Name AND [PricePerItem] = @original_PricePerItem AND [COUNT] = @original_COUNT AND [Contract_id] = @original_Contract_id">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_EAN" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_PricePerItem" Type="Int32" />
        <asp:Parameter Name="original_COUNT" Type="Int32" />
        <asp:Parameter Name="original_Contract_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="EAN" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="PricePerItem" Type="Int32" />
        <asp:Parameter Name="COUNT" Type="Int32" />
        <asp:Parameter Name="Contract_id" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="ContractID" Name="Contract_id" PropertyName="Value" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="EAN" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="PricePerItem" Type="Int32" />
        <asp:Parameter Name="COUNT" Type="Int32" />
        <asp:Parameter Name="Contract_id" Type="Int32" />
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_EAN" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_PricePerItem" Type="Int32" />
        <asp:Parameter Name="original_COUNT" Type="Int32" />
        <asp:Parameter Name="original_Contract_id" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

