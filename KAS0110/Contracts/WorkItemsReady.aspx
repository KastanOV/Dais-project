<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkItemsReady.aspx.cs" Inherits="KAS0110.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Název položky <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chybý název" ControlToValidate="TextBoxName" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox> 
    Popis položky <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chybý popis" ControlToValidate="TextBoxDescription" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="TextBoxDescription" runat="server" CssClass="form-control"></asp:TextBox>
    Cena bez DPH <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="pouze čísla" ControlToValidate="TextBoxPrice" ForeColor="Red" ValidationExpression="\d*"></asp:RegularExpressionValidator>
    <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control"></asp:TextBox> 
    
    <asp:Button ID="Button1" runat="server" Text="Vytvořit novou pložku" CssClass="form-control" OnClick="Button1_Click" /><br />
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" InsertVisible="False" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" InsertCommand="INSERT INTO [WorkItemsReady] ([Name], [Description], [Price]) VALUES (@Name, @Description, @Price)" SelectCommand="SELECT [Name], [Description], [Price], [id] FROM [WorkItemsReady]" UpdateCommand="UPDATE [WorkItemsReady] SET [Name] = @Name, [Description] = @Description, [Price] = @Price WHERE [id] = @original_id AND [Name] = @original_Name AND [Description] = @original_Description AND [Price] = @original_Price" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [WorkItemsReady] WHERE [id] = @original_id AND [Name] = @original_Name AND [Description] = @original_Description AND [Price] = @original_Price" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Price" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
