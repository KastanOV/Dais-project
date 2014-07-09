using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("admin")) Response.Redirect("~/Default");
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            
            try
            {
                Employee emp = new Employee()
                {
                    login = TextBoxLogin.Text,
                    fname = TextBoxFname.Text,
                    lname = TextBoxLname.Text,
                    password = TextBoxPassword.Text,
                    phone = TextBoxPhone.Text,
                    adress = TextBoxAdress.Text,
                    city = TextBoxCity.Text,
                    experience = Byte.Parse(TextBoxExperience.Text)
                };
                EmployeeTable tb = new EmployeeTable();
                tb.Insert(emp);
                Response.Redirect("~/Employees/ListEmployee");
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Máš to špatně');", true);
            }
        }
    }
}