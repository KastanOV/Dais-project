using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Employee emp = new Employee();
            EmployeeTable empTable = new EmployeeTable();
            emp = empTable.Select(Int32.Parse(DropDownList1.Text));
            AttendanceTable atd = new AttendanceTable();
            Label1.Text = "Zaměstnanec " + emp.lname + " " + emp.fname + " Má na kontě " + atd.GetWage(Int32.Parse(DropDownList1.Text)) + " Kč.";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AttendanceTable atd = new AttendanceTable();
            if (atd.payWage(Int32.Parse(DropDownList1.Text))) Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Vyplacení mzdy proběhlo v pořádku');", true);
            else Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně zkus to znova :)');", true);
            Response.Redirect("~/Employees/Wages.aspx");
        }
    }
}