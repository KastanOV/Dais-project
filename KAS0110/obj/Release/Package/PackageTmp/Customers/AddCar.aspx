<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="KAS0110.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Přidat automobil do vozového parku klienta</h2>
    <h3>Tento formular zatim nefunguje!</h3>
    <table>
        <tr>
            <td>
                SPZ
            </td>
            <td>
                <asp:TextBox ID="TextBoxSpz" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Spatny format SPZ (1X23456)" ControlToValidate="TextBoxSpz" ValidationExpression="[0-9][A-Z][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Rozměr letní pneu
            </td>
            <td>
                <asp:TextBox ID="TextBoxSummerSize" runat="server"></asp:TextBox><asp:RegularExpressionValidator runat="server" ErrorMessage="Spatný rozměr pneu" ControlToValidate="TextBoxSummerSize" ValidationExpression="[1-3][0-9][0,5][0-9][0,5][1,2][0-9]" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Rozměr Zimní pneu
            </td>
            <td>
                <asp:TextBox ID="TextBoxWinterSize" runat="server"></asp:TextBox><asp:RegularExpressionValidator runat="server" ErrorMessage="Spatný rozměr pneu" ControlToValidate="TextBoxWinterSize" ValidationExpression="[1-3][0-9][0,5][0-9][0,5][1,2][0-9]" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Výrobce Automobilu
            </td>
            <td>
                <asp:TextBox ID="TextBoxCarManufacturer" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxCarManufacturer"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Typ automobilu
            </td>
            <td>
                <asp:TextBox ID="TextBoxCarType" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxCarType"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Preferované pneumatiky
            </td>
            <td>
                <asp:TextBox ID="TextBoxPreferedTyreManufacturer" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxPreferedTyreManufacturer"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Hloubka dezenu Zimni pneu
            </td>
            <td>
                <asp:TextBox ID="TextBoxTreadDepthWinter" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxTreadDepthWinter"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Hloubka dezenu letní pneu
            </td>
            <td>
                <asp:TextBox ID="TextBoxTreadDepthSummer" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBoxTreadDepthSummer"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Content>
