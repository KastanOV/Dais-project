using KAS0110.Models.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            
            Customer cst = new Customer();
            cst.email = TextBoxEmail.Text;
            cst.fname = TextBoxFname.Text;
            cst.lname = TextBoxLname.Text;
            cst.phone = TextBoxPhone.Text;
            cst.adress = TextBoxAdress.Text;
            cst.city = TextBoxCity.Text;
            cst.postalCode = Int32.Parse(TextBoxPostal.Text);
            cst.ICO = TextBoxIC.Text;
            cst.DIC = TextBoxDIC.Text;
            cst.CompanyName = TextBoxCompanyName.Text;

            if (!db.Customers.Any(x => x.email == cst.email))
            {
                db.Customers.InsertOnSubmit(cst);
                db.SubmitChanges();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Klient již existuje');", true);
            }
            
            //CustomerTable cstTable = new CustomerTable();
            //if (cstTable.Insert(cst) == -2) Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Klient již existuje');", true);
            //else if (cstTable.Insert(cst) == -1) Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nemůžu navázat spojení s SQL serverem');", true);
            Response.Redirect("~/Contracts/Contracts");
        }
    }
}