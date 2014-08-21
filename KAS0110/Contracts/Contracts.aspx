<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contracts.aspx.cs" Inherits="KAS0110.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Evidence využití pneuservisu</h2>
    <p></p>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="lname" DataValueField="id" CssClass="form-control"></asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" ToolTip="Heslo" CssClass="form-control"></asp:TextBox>
    <p></p>
    <table>
        <tr>
            <td >
                Stání č. 1 
            </td>
            <td>
                Stání č. 2
            </td>
            <td>
                Stání č. 3
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Button ID="ButtonStani1" runat="server" OnClick="ButtonStani1_Click" CssClass="form-control"/>
            </td>
            <td>
                <asp:Button ID="ButtonStani2" runat="server" OnClick="ButtonStani2_Click" CssClass="form-control"/>
            </td>
            <td>
                <asp:Button ID="ButtonStani3" runat="server" OnClick="ButtonStani3_Click" CssClass="form-control"/>
            </td>
        </tr>
        
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ButtonPrint1" runat="server" Text="Tisk dokladu" CssClass="form-control" OnClick="ButtonAddTire1_Click"/>
            </td>
            <td>
                <asp:Button ID="ButtonPrint2" runat="server" Text="Tisk dokladu" CssClass="form-control" OnClick="ButtonAddTire2_Click"/>
            </td>
            <td>
                <asp:Button ID="ButtonPrint3" runat="server" Text="Tisk dokladu" CssClass="form-control" OnClick="ButtonAddTire3_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p >Vyhledávání klientů<asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" ToolTip="Vyhledávání klientů"></asp:TextBox> <asp:Button ID="ButtonAddCustomer" runat="server" Text="Přídat klienta" OnClick="ButtonAddCustomer_Click" CssClass="form-control"/></p>
    <p></p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="lname" HeaderText="Příjmení" SortExpression="lname" />
            <asp:BoundField DataField="fname" HeaderText="Jméno" SortExpression="fname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" Visible="False" />
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
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSearch" Name="lname" PropertyName="Text" Type="String" />
        </SelectParameters>
</asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectEmployeesInWork" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
</asp:Content>
