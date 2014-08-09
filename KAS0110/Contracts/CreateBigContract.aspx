<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBigContract.aspx.cs" Inherits="KAS0110.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Nová faktura</h1>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableHeaderCell>
                <b>Renáta Kašturová</b><br />
                Statovní 4 <br />
                Ostrava <br />
            </asp:TableHeaderCell>
            <asp:TableHeaderCell>
                IC:123456 <br />
                DIC: CZ1235456 <br />
                www.servisplzenska.cz
            </asp:TableHeaderCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Vyřizuje <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="login" DataValueField="id" CssClass="form-control"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                
                
            </asp:TableCell>
            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="CompanyName" runat="server" Text="" ></asp:Label><br />
                <asp:Label ID="CustName" runat="server" Text="Label" ></asp:Label><br />
                <asp:Label ID="Adress" runat="server" Text="Label" ></asp:Label><br />
                <asp:Label ID="IC" runat="server" Text="Label" ></asp:Label><br />
                <asp:Label ID="DIC" runat="server" Text="Label" ></asp:Label><br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

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
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="id" CssClass="form-control"></asp:DropDownList>
    Pocet kusu<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Asi by jsi tady mel napsat cislo kokote" ForeColor="Red" ControlToValidate="TextBox1" ValidationExpression="\d*"></asp:RegularExpressionValidator>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="1"></asp:TextBox>
    <asp:Button ID="ButtonAddWork" runat="server" Text="Přidat položku do faktury" CssClass="form-control" OnClick="ButtonAddWork_Click" />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT [id], [Name] FROM [WorkItemsReady] ORDER BY [Name]"></asp:SqlDataSource>
    <h3>Cena materiálu</h3>

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
</asp:Content>
