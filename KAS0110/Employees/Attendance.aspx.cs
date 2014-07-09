using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        AttendanceTable atdTable;
        Attendance atd;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            atdTable = new AttendanceTable();
            atd = new Attendance();
            if (!IsPostBack)
            {
                Arrival.Enabled = false;
                exit.Enabled = false;
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Int32.Parse(DropDownList1.SelectedValue.ToString());
            atdTable = new AttendanceTable();
            atd = new Attendance();
            atd = atdTable.EmployeeState(id);
            if (atd == null) 
            {
                Arrival.Enabled = true;
                exit.Enabled = false;
            }
            else if (atd.Exit == null)
            {
                Arrival.Enabled = false;
                exit.Enabled = true;
            }
            else
            {
                Arrival.Enabled = true;
                exit.Enabled = false;
            }
            

        }

        protected void Arrival_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(DropDownList1.SelectedValue.ToString());
            Employee emp = new Employee();
            EmployeeTable empTable = new EmployeeTable();
            emp = empTable.Select(id);
            if (emp.password == TextBox1.Text)
            {
                atdTable.Arrival(id);
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Jste Příhlášen');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Sorry, ale máš špatné heslo');", true);
                return;
            }
            Arrival.Enabled = false;
            exit.Enabled = true;
            TextBox1.Text = "";
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(DropDownList1.SelectedValue.ToString());
            Employee emp = new Employee();
            EmployeeTable empTable = new EmployeeTable();
            emp = empTable.Select(id);
            if (emp.password == TextBox1.Text) 
            {
                atdTable.Exit(id);
                string info = "alert(\'Jste Odhlášený na účtu máte " + atdTable.GetWage(id).ToString() + " Kč. \');";
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", info, true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Sorry, ale máš špatné heslo');", true);
                return;
            }
            Arrival.Enabled = true;
            exit.Enabled = false;
            TextBox1.Text = "";
            
        }
    }
}