using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string tmp = e.ToString();
            tmp = null;
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            StringBuilder redir = new StringBuilder();
            redir.Append("~/Employees/EditEmployee.aspx?id=");
            redir.Append(GridView1.SelectedValue.ToString());
            Response.Redirect(redir.ToString());
        }

        
        
    }
}