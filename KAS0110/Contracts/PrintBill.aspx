<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrintBill.aspx.cs" Inherits="KAS0110.WebForm24" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table runat="server" Width="900" >
        <asp:TableHeaderRow Width="100%">
            <asp:TableHeaderCell Width="30%" HorizontalAlign="Center" VerticalAlign ="Top"><h4>Pneuservis Plzeňská</h4>
                Renáta Kašturová <br />
                 Startovni 4 <br />
                70030
                
            </asp:TableHeaderCell>
            <asp:TableCell Width="30%" HorizontalAlign="Justify" VerticalAlign ="Top">
                IČ:73249769 <br />
                DIČ:CZ7551205079 <br /><br />
                www.servisplzenska.cz
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Justify" VerticalAlign ="Top">
                tel:739247129 <br />
                tel:724333203 <br />
                email:kastura.jaroslav@gmail.com <br />
                <asp:Label ID="LabelDokladCislo" runat="server" Text="Label" Font-Size="Large"></asp:Label>
            </asp:TableCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <hr />
    <h2>Faktura daňový doklad</h2>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell Width="25%" VerticalAlign="Top">
                <h3>Datum</h3>
                <hr />
                Vystavení:<asp:Label ID="LabelDatumVystaveni" runat="server" Text="Label"></asp:Label>
                Splatnosti:<asp:Label ID="LabelDatumSplatnosti" runat="server" Text="Label"></asp:Label>
                DUZP:<asp:Label ID="LabelDatumDUZP" runat="server" Text="Label"></asp:Label>
            </asp:TableCell>
            <asp:TableCell Width="25%" VerticalAlign="Top">
                <h3>Bankovní účet</h3>
                <hr />
                Číslo účtu: <b>166414289</b> <br />
                Konstantní symbol: <b>0308</b> <br />
                Variabilní symbol: <asp:Label ID="LabelVariabilniSymbol" Font-Bold="true" runat="server" Text="00072015" Font-Size="Medium"></asp:Label>
            </asp:TableCell>
            <asp:TableCell Width="50%" VerticalAlign="Top">
                <h3>Odběratel</h3>
                <hr />
                <asp:Label ID="LabelOdberatelJmeno" runat="server" Text="Josef Břitfa"></asp:Label> <br />
                <asp:Label ID="LabelOdberatelAdresa" runat="server" Text="Startovní 4"></asp:Label> <br />
                <asp:Label ID="LabelOdberatelMesto" runat="server" Text="Ostrava"></asp:Label> <br />
                <hr />
                <asp:Label ID="LabelOdberatelIC" runat="server" Text="IC:72356985"></asp:Label> <br />
                <asp:Label ID="LabelOdberatelDIC" runat="server" Text="DIC:CZ65158865955"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <p>Fakturujeme Vám za dodané zboží či služby:</p>
    </asp:Content>
