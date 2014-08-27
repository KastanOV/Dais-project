<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExtStore.aspx.cs" Inherits="KAS0110.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Externí sklad pneumatik OK Pneu</h2>
    <asp:HiddenField ID="HiddenTireSize" runat="server" />
    <asp:HiddenField ID="HiddenSelectedDropDownNamufacturer" runat="server" />
    <asp:HiddenField ID="HiddenFieldSeason" runat="server" />
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="TextBoxSize" runat="server" ToolTip="Rozměr pneumatik zadávejte v profi formátu. Např: 1956515 <=> 195/65R15" OnTextChanged="TextBoxSize_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
               <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceDropDownlist" DataTextField="Manufacturer" DataValueField="Manufacturer" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Season_Changed" CssClass="form-control"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <%--<asp:TableRow>
            <asp:TableCell>
                <asp:CheckBox ID="CheckBoxExtStore" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="CheckBoxExtStore_CheckedChanged" /><asp:Label ID="LabelExtStore" runat="server" Text="Pneumatiky jsou skladem u dodavatele"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxLocStore_CheckedChanged" /><asp:Label ID="Label1" runat="server" Text="Pneumatiky jsou v příručním skladu"></asp:Label>
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>--%>
    </asp:Table>
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceTireGridView" ForeColor="#333333" GridLines="None" DataKeyNames="EAN" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="EAN" HeaderText="EAN" ReadOnly="True" SortExpression="EAN" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Název" SortExpression="Name" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="ExternalStore" HeaderText="Ex Sklad" SortExpression="ExternalStore" />
            <asp:BoundField DataField="OnStore" HeaderText="Skladem" SortExpression="OnStore" />
            <asp:BoundField DataField="season" HeaderText="season" SortExpression="season" Visible="False" />
            <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" Visible="False" />
            <asp:BoundField DataField="Price" HeaderText="Cena bez DPH" SortExpression="Price" />
            <asp:CommandField ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSourceDropDownlist" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" SelectCommand="SELECT DISTINCT [Manufacturer] FROM [SuplierTiresOKpneu] WHERE (([Size] = @Size) AND ([ExternalStore] &gt; @ExternalStore))">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenTireSize" Name="Size" PropertyName="Value" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="ExternalStore" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTireGridView" runat="server" ConnectionString="<%$ ConnectionStrings:PneuservisConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [EAN], [Size], [ExternalStore], [OnStore], [Price], [Name], [season], [Photo] FROM [SuplierTiresOKpneu] WHERE (([ExternalStore] &gt; @ExternalStore) AND ([Manufacturer] LIKE  @Manufacturer + '%') AND ([season] =  @season )AND ([Size] = @Size)) ORDER BY [Price]">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="ExternalStore" Type="Int32" />
<asp:ControlParameter ControlID="HiddenSelectedDropDownNamufacturer" PropertyName="Value" Name="Manufacturer" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="HiddenFieldSeason" DefaultValue="" Name="season" PropertyName="Value" />
            <asp:ControlParameter ControlID="HiddenTireSize" Name="Size" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="FindManufacturers" TypeName="KAS0110.Models.Database.OkPneuTireTable"></asp:ObjectDataSource>--%>
    
    <%--<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="KAS0110.Models.Database.OkPneuTireTable" OnSelecting="ObjectDataSource2_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSize" Name="strsize" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="season" PropertyName="SelectedValue" Type="Char" />
            <asp:ControlParameter ControlID="CheckBoxExtStore" Name="OnExternalStore" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="CheckBoxLocStore" Name="OnLokalStore" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="DropDownList1" Name="manu" PropertyName="SelectedValue" Type="String" DbType="String" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
    <p>
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="ButtonAddOrder" runat="server" Text="Vytvořit novou objednávku" OnClick="ButtonAddOrder_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="ButtonAddToStore" runat="server" Text="Přidat Pneumatiku na sklad" OnClick="ButtonAddTireToLocalStore_Click" />
                </asp:TableCell>    
            </asp:TableRow>
        </asp:Table>
        
</asp:Content>
