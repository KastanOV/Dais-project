using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAS0110.Models.Linq;

namespace KAS0110
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                id = Int32.Parse(Server.UrlDecode(Request.QueryString["GarageNumber"]));
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }
            LoadInfo();
        }
        private void LoadInfo()
        {
            DataClassesDataContext db = new DataClassesDataContext();
            var data = (from i in db.Contracts
                       join j in db.Customers on i.Customers_id equals j.id
                       where i.GarageNumber == id && i.CustomerExit == null
                       select new { j.adress, j.city, j.CompanyName, j.DIC, j.fname, j.ICO, j.lname, j.postalCode }).First();
            CompanyName.Text = data.CompanyName;
            CustName.Text = data.lname + " " + data.fname;
            Adress.Text = data.adress + " " + data.city + " " + data.postalCode;
            IC.Text = data.ICO;
            DIC.Text = data.DIC;

        }
    }
}