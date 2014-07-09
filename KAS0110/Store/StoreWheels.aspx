<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StoreWheels.aspx.cs" Inherits="KAS0110.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Uskladnit kola</h2>
    <h3>Nejpreve vytvořte popis pneumatiky potom vyberte klienta</h3>
    <table>
        <tr>
            <td>
                Výrobce
            </td>
            <td>
                <asp:TextBox ID="TextBoxmanufacturer" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bez toho to nepojede" ControlToValidate="TextBoxmanufacturer" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                Popis Disku
            </td>
            <td>
                <asp:TextBox ID="TextBoxDiscDesc" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bez toho to nepojede" ControlToValidate="TextBoxDiscDesc" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Popis Pneumatiky
            </td>
            <td>
                <asp:TextBox ID="TextBoxTireDesc" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bez toho to nepojede" ControlToValidate="TextBoxTireDesc" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
     </table>
    <p></p>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="lname" DataValueField="id" Font-Size="Large"></asp:DropDownList>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectEmployeesInWork" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
    <p>
        &nbsp;</p>
<p>
        Vyhledávání <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="adress" HeaderText="adress" SortExpression="adress" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
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
    </p>
    <p>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.CustomerTable">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="lname" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    </p>
     
</asp:Content>
