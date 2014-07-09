using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            try
            {
                id = Int32.Parse(Server.UrlDecode(Request.QueryString["id"]));
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            EmployeeTable empTable = new EmployeeTable();
            StoredWheelsTable stTable = new StoredWheelsTable();
            if (empTable.CheckPasword(Int32.Parse(DropDownList1.SelectedValue), TextBox1.Text))
            {
                int cstID = Int32.Parse(Server.UrlDecode(Request.QueryString["id"]));
                int empID = Int32.Parse(DropDownList1.SelectedValue);
                if (stTable.UnstoreTires(cstID, empID))
                {
                    Response.Redirect("~/Customers/Customers");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně');", true);
                }
            }
        }
    }
}