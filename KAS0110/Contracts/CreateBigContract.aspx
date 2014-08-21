<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBigContract.aspx.cs" Inherits="KAS0110.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Nová faktura</h1>
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
    </asp:Table>
        Za práci odpovída - <asp:Label ID="LabelEmployeeName" runat="server" Text="Label"></asp:Label>
    </asp:Panel>

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

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [WorkItemsReady] ORDER BY [Name]"></asp:SqlDataSource>
    

    <p>
        <asp:SqlDataSource ID="SqlDataSourceWork" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" DeleteCommand="DELETE FROM [WorkItems] WHERE [id] = @id" InsertCommand="INSERT INTO [WorkItems] ([Name], [Description], [Price], [COUNT], [Contract_id]) VALUES (@Name, @Description, @Price, @COUNT, @Contract_id)" SelectCommand="SELECT [Name], [id], [Description], [Price], [COUNT], [Contract_id] FROM [WorkItems] WHERE ([Contract_id] = @Contract_id)" UpdateCommand="UPDATE [WorkItems] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [COUNT] = @COUNT, [Contract_id] = @Contract_id WHERE [id] = @id">
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
    </p>
    <h3>Cena spotřebního materiálu</h3>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell Width="30%">
                <asp:DropDownList ID="DropDownListCustomables" runat="server" DataSourceID="SqlDataSourceCustomables" DataTextField="Name" DataValueField="id" CssClass="form-control"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell Width="10%">
            </asp:TableCell>
            <asp:TableCell Width="30%">
                <asp:Button ID="ButtonAddMaterial" runat="server" Text="+"  Font-Size="Large" OnClick="ButtonAddMaterial_Click" />
                <asp:TextBox ID="TextBoxMaterialSummary" runat="server" Text="0" Width="50" >  </asp:TextBox>
                <asp:Button ID="ButtonDropMaterial" runat="server" Text="-" Font-Size="Large" OnClick="ButtonDropMaterial_Click"/>
            </asp:TableCell>
            <asp:TableCell Width="30%">
                <asp:Button ID="ButtonAddCustomable" runat="server" Text="Přidat materiál" CssClass="form-control" OnClick="ButtonAddItems_Click"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceCunsumableGridView" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="Count" />
            <asp:BoundField DataField="Contract_id" HeaderText="Contract_id" SortExpression="Contract_id" Visible="False" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSourceCunsumableGridView" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" DeleteCommand="DELETE FROM [Consumables] WHERE [id] = @id" InsertCommand="INSERT INTO [Consumables] ([Name], [Price], [Count], [Contract_id]) VALUES (@Name, @Price, @Count, @Contract_id)" SelectCommand="SELECT [Name], [Price], [Count], [Contract_id], [id] FROM [Consumables] WHERE ([Contract_id] = @Contract_id)" UpdateCommand="UPDATE [Consumables] SET [Name] = @Name, [Price] = @Price, [Count] = @Count, [Contract_id] = @Contract_id WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Count" Type="Int32" />
            <asp:Parameter Name="Contract_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ContractID" Name="Contract_id" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Count" Type="Int32" />
            <asp:Parameter Name="Contract_id" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCustomables" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [ConsumablesReady]"></asp:SqlDataSource> 
</asp:Content>

