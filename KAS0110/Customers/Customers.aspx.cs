using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tmp = Int32.Parse(GridView2.SelectedValue.ToString());
            StoredWheelsTable tb = new StoredWheelsTable();
            EmployeeTable emptable = new EmployeeTable();
            if (!tb.UnstoreCheck(tmp))
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Sorry ale nelze vyskladnit pneumatiky které zde nejsou');", true);
                return;
            }
            string newpath = "~/Store/UnstoreWheels.aspx?id=" + tmp;
            Response.Redirect(newpath);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int tmp;
            try
            {
                tmp = Int32.Parse(GridView1.SelectedValue.ToString());
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve vyberte klienta');", true);
                return;
            }
            string redir = "~/Customers/AddCar.aspx?id=" + tmp;
            Response.Redirect(redir);
            
        }
    }
}