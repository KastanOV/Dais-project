using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tmp = Server.UrlDecode(Request.QueryString["EAN"]);
            OkPneuTireTable okTable = new OkPneuTireTable();
            OkPneuTire tire = new OkPneuTire();
            tire = okTable.Select(tmp);
            string labelTmp = tire.Name + " Prodejní cena " + tire.ProdejniCena;
            Label1.Text = labelTmp;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int Empl_id = Int32.Parse(DropDownList1.SelectedValue.ToString());
            int Cust_id = Int32.Parse(GridViewCustomers.SelectedValue.ToString());
            string EAN = Server.UrlDecode(Request.QueryString["EAN"]);
            int count = Int32.Parse(TextBoxCount.Text);
            OkPneuTire tire = new OkPneuTire();
            OkPneuTireTable okTable = new OkPneuTireTable();
            tire = okTable.Select(EAN);
            decimal price = tire.ProdejniCena;
            OrderTable tb = new OrderTable();
            int result = tb.InsertNewOrder(Cust_id, Empl_id, EAN, count, price);
            if(result > 0) Response.Redirect("~/Customers/Orders");
            else Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně');", true);
        }
    }
}