<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="KAS0110.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Přidat zaměstnance</h2>
    
    <table style="width:500px">
         <tr>
          <td>Login</td>
          <td>
              <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                  ControlToValidate="TextBoxLogin"
                  ErrorMessage="Required field."
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
                  ErrorMessage="Required field."
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
                  ErrorMessage="Required field."
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
          <td>Heslo</td>
          <td>
              <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                  ControlToValidate="TextBoxPassword"
                  ErrorMessage="Required field."
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
          <td>Telefon</td>
          <td>
              <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                  ControlToValidate="TextBoxPhone"
                  ErrorMessage="Required field."
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
                  ErrorMessage="Required field."
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
                  ErrorMessage="Required field."
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
          <td>Zkušenosti</td>
          <td>
              <asp:TextBox ID="TextBoxExperience" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server"
                  ControlToValidate="TextBoxExperience"
                  ErrorMessage="Required field"
                  ForeColor="Red">
              </asp:RequiredFieldValidator>
            </td> 
        </tr>
    </Table>
    <p> 
        
    </p>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Uložit" OnClick="ButtonSubmit_Click" />

    
</asp:Content>
