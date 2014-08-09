using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAS0110.Models.Linq;

namespace KAS0110
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WorkItemsReady newitem = new WorkItemsReady()
            {
                Name = TextBoxName.Text,
                Description = TextBoxDescription.Text,
                Price = Int32.Parse(TextBoxPrice.Text)
            };
            db.WorkItemsReadies.InsertOnSubmit(newitem);
            db.SubmitChanges();
            Response.Redirect("~/Contracts/WorkItemsReady.aspx");
        }
    }
}