<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrintBill.aspx.cs" Inherits="KAS0110.WebForm24" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="ButtonPrint" runat="server" Text="Tisknout" CssClass="form-control" OnClick="ButtonPrint_Click" />
    <asp:HiddenField ID="HiddenFieldContractID" runat="server" />
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
            <asp:TableCell Width="30%" VerticalAlign="Top">
                <h3>Datum</h3>
                <hr />
                Vystavení:<asp:Label ID="LabelDatumVystaveni" runat="server" Text="Label"></asp:Label> <br />
                Splatnosti:<asp:Label ID="LabelDatumSplatnosti" runat="server" Text="Label"></asp:Label><br />
                DUZP:<asp:Label ID="LabelDatumDUZP" runat="server" Text="Label"></asp:Label><br />
                Způsob platby:<asp:Label ID="LabelZpusobPlatby" runat="server" Text="Label" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell Width="30%" VerticalAlign="Top">
                <h3>Bankovní účet</h3>
                <hr />
                Číslo účtu: <b>166414289</b> <br />
                Konstantní symbol: <b>0308</b> <br />
                Variabilní symbol: <asp:Label ID="LabelVariabilniSymbol" Font-Bold="true" runat="server" Text="00072015" Font-Size="Medium"></asp:Label>
            </asp:TableCell>
            <asp:TableCell Width="40%" VerticalAlign="Top" HorizontalAlign="Left">
                <h3>Odběratel</h3>
                <hr />
                <asp:Label ID="LabelOdberatelJmeno" runat="server" Text="Josef Břitfa" ></asp:Label> <br />
                <asp:Label ID="LabelOdberatelAdresa" runat="server" Text="Startovní 4"></asp:Label> <br />
                <asp:Label ID="LabelOdberatelMesto" runat="server" Text="Ostrava"></asp:Label> <br />
                <hr />
                <asp:Label ID="LabelOdberatelIC" runat="server" Text="IC:72356985"></asp:Label> <br />
                <asp:Label ID="LabelOdberatelDIC" runat="server" Text="DIC:CZ65158865955"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <p>Fakturujeme Vám za dodané zboží či služby:</p>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSourceItemsOfInvoice" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Název položky" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="ItemPrice" HeaderText="Cena bez DPH" ReadOnly="True" SortExpression="ItemPrice" />
            <asp:BoundField DataField="ItemPriceWithVat" HeaderText="Cena s DPH" ReadOnly="True" SortExpression="ItemPriceWithVat" />
            <asp:BoundField DataField="ItemsCount" HeaderText="Počet kusů" ReadOnly="True" SortExpression="ItemsCount" />
            <asp:BoundField DataField="PriceAllItemsInRowWithoutVat" HeaderText="Cena celkem bez DPH" ReadOnly="True" SortExpression="PriceAllItemsInRowWithoutVat" Visible="False" />
            <asp:BoundField DataField="PriceAllItemsInRowWithVat" HeaderText="Cena celkem s DPH" ReadOnly="True" SortExpression="PriceAllItemsInRowWithVat" />
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
    <asp:ObjectDataSource ID="ObjectDataSourceItemsOfInvoice" runat="server" SelectMethod="GetItems" TypeName="KAS0110.Models.Linq.InvoiceItemsTable">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldContractID" Name="ContractID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br /><br /><br />
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell Width="60%">

            </asp:TableCell>
            <asp:TableCell Width="20%">
                Celkem bez DPH 
            </asp:TableCell>
            <asp:TableCell Width="20%">
                <asp:Label ID="LabelTotalPriceWithoutVat" runat="server" Text="Label" Font-Size="Medium" Font-Bold="false"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="60%">

            </asp:TableCell>
            <asp:TableCell Width="20%">
               <p><b>Celkem s DPH </b> </p> 
            </asp:TableCell>
            <asp:TableCell Width="20%">
                <asp:Label ID="LabelTotalPriceWithVat" runat="server" Text="Label" Font-Size="Large" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </asp:Content>
