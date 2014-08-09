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



    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FileConnection %>" SelectCommand="SELECT Employees.login, EmployeeAttendance.[Exit], Employees.id FROM Employees INNER JOIN EmployeeAttendance ON Employees.id = EmployeeAttendance.Employees_id WHERE (EmployeeAttendance.[Exit] IS NULL)"></asp:SqlDataSource>
    </p>
</asp:Content>
