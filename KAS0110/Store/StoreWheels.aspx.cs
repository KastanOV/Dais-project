using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string manu = TextBoxmanufacturer.Text;
            string discDesc = TextBoxDiscDesc.Text;
            string tireDesc = TextBoxTireDesc.Text;
            string password = TextBox2.Text;
            int Customer_ID = Int32.Parse(GridView1.SelectedDataKey.Value.ToString());
            int Employee_ID = Int32.Parse(DropDownList1.SelectedValue.ToString());

            StoredWheels wheel = new StoredWheels();
            StoredWheelsTable stTable = new StoredWheelsTable();
            EmployeeTable empTable = new EmployeeTable();
            bool CheckedPassword = empTable.CheckPasword(Employee_ID, password);

            if (CheckedPassword)
            {
                wheel.Tiremanufacturer = manu;
                wheel.DiscDescription = discDesc;
                wheel.TireDecription = tireDesc;
                wheel.Customers_id = Customer_ID;
                wheel.Employees_id_Store = Employee_ID;
                stTable.Insert(wheel);
                Response.Redirect("~/Customers/Customers");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně');", true);
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}