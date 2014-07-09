using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem l1 = new ListItem("Letní pneu", "L", true);
                ListItem l2 = new ListItem("Zimní pneu", "Z", true);
                DropDownList2.Items.Add(l1);
                DropDownList2.Items.Add(l2);
                
            }
        }

        protected void TextBoxSize_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
            string EAN;
            try
            {
                EAN = GridView1.SelectedValue.ToString();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat pneumatiky');", true);
                return;
            }
            string redir = "~/Customers/AddOrder.aspx?EAN=" + EAN;
            Response.Redirect(redir);

        }
    }
}