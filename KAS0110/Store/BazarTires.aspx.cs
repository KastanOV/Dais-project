using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Manufacturer,
            //Size,
            //\"Type\",
            //\"Description\",
            //Customers_id
            BazarTiresTable bTable = new BazarTiresTable();
            BazarTires tir = new BazarTires();
            try
            {
            tir.Manufacturer = TextBoxManu.Text;
            tir.Size = Int32.Parse(TextBoxSize.Text);
            tir.Type = TextBoxType.Text;
            tir.Description = TextBoxDesc.Text;
            tir.Customers_id = Int32.Parse(GridView2.SelectedValue.ToString());
            bTable.Insert(tir);
            Response.Redirect("~/Store/BazarTires");
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně');", true);
            }
        }
    }
}