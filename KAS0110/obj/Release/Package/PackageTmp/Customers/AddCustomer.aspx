<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="KAS0110.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Přidat klienta</h2>
    
    <table style="width:500px">
        <tr>
          <td>ConpanyName</td>
          <td>
              <asp:TextBox ID="TextBoxCompanyName" runat="server"></asp:TextBox>
  
          </td> 
        </tr>
        <tr>
          <td>IC</td>
          <td>
              <asp:TextBox ID="TextBoxIC" runat="server"></asp:TextBox>
 
          </td> 
        </tr>
        <tr>
          <td>DIC</td>
          <td>
              <asp:TextBox ID="TextBoxDIC" runat="server"></asp:TextBox>
          </td> 
        </tr> 
        <tr>
          <td>email</td>
          <td>
              <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Špatný email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                  ControlToValidate="TextBoxEmail"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>   
          </td> 
        </tr>
        <tr>
          <td>Jméno</td>
          <td>
              <asp:TextBox ID="TextBoxFname" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                  ControlToValidate="TextBoxFname"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>   
        <tr>
          <td>Příjmení</td>
          <td>
              <asp:TextBox ID="TextBoxLname" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                  ControlToValidate="TextBoxLname"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        
        <tr>
          <td>Telefon</td>
          <td>
              <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Špatný formát " ValidationExpression="\d\d\d\d\d\d\d\d\d" ForeColor="Red" ControlToValidate="TextBoxPhone"></asp:RegularExpressionValidator>
              <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                  ControlToValidate="TextBoxPhone"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
          </td> 
        </tr>
        <tr>
          <td>Adresa</td>
          <td>
              <asp:TextBox ID="TextBoxAdress" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                  ControlToValidate="TextBoxAdress"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
          <td>Město</td>
          <td>
              <asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                  ControlToValidate="TextBoxCity"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
          <td>PSČ</td>
          <td>
              <asp:TextBox ID="TextBoxPostal" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                  ControlToValidate="TextBoxPostal"
                  ErrorMessage="Povinné pole"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxPostal" ErrorMessage="Špatný formát" ValidationExpression="[0-9][0-9][0-9][0-9][0-9]" ForeColor="Red"></asp:RegularExpressionValidator>
            </td> 
        </tr>
    </Table>
    <p> 
        
    </p>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Uložit" OnClick="ButtonSubmit_Click" />
</asp:Content>
