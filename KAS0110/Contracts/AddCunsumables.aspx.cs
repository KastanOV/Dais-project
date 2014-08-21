using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAS0110.Models.Linq;

namespace KAS0110
{
    public partial class WebForm23 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ConsumablesReady con = new ConsumablesReady()
            {
                Name = TextBoxName.Text,
                Price = Int32.Parse(TextBoxPrice.Text)
            };
            DataClassesDataContext db = new DataClassesDataContext();
            db.ConsumablesReadies.InsertOnSubmit(con);
            db.SubmitChanges();
            Response.Redirect("~/Contracts/AddCunsumables");
        }
    }
}