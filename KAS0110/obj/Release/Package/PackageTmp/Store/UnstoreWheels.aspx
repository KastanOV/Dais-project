<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnstoreWheels.aspx.cs" Inherits="KAS0110.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Vyskladnit pneumatiky</h2>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="lname" DataValueField="id" Font-Size="Large"></asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectEmployeesInWork" TypeName="KAS0110.Models.Database.EmployeeTable"></asp:ObjectDataSource>
    <br />
    <asp:Button ID="Button1" runat="server" Height="47px" OnClick="Button1_Click" Text="Vyskladnit pneumatiky" Width="240px" />
</asp:Content>
