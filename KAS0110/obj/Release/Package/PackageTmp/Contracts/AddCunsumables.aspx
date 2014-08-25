<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCunsumables.aspx.cs" Inherits="KAS0110.WebForm23" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Název položky <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chybý název" ControlToValidate="TextBoxName" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox> 
    Cena bez DPH <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="pouze čísla" ControlToValidate="TextBoxPrice" ForeColor="Red" ValidationExpression="\d*"></asp:RegularExpressionValidator>
    <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control"></asp:TextBox> 
    
    <asp:Button ID="Button1" runat="server" Text="Vytvořit novou pložku" CssClass="form-control" OnClick="Button1_Click" /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" DeleteCommand="DELETE FROM [ConsumablesReady] WHERE [id] = @original_id AND [Name] = @original_Name AND [Price] = @original_Price" InsertCommand="INSERT INTO [ConsumablesReady] ([Name], [Price]) VALUES (@Name, @Price)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Name], [Price], [id] FROM [ConsumablesReady]" UpdateCommand="UPDATE [ConsumablesReady] SET [Name] = @Name, [Price] = @Price WHERE [id] = @original_id AND [Name] = @original_Name AND [Price] = @original_Price">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Price" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Price" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
