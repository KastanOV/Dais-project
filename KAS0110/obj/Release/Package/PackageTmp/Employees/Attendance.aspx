<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="KAS0110.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Docházka</h2>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="lname" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Size="Large">
        </asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
        <asp:Button ID="Arrival" runat="server" Text="Příchod" OnClick="Arrival_Click" Height="50px" Width="120px" />   <asp:Button ID="exit" runat="server" Text="Odchod" OnClick="exit_Click" Height="50px" Width="120px" />
    </p>

</asp:Content>
