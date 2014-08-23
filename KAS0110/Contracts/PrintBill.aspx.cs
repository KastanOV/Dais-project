using KAS0110.Models.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        int ContractId;
        string ZpusobPlatby;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ContractId = Int32.Parse(Server.UrlDecode(Request.QueryString["ContractId"]));
                ZpusobPlatby = Server.UrlDecode(Request.QueryString["ZpusobPlatby"]);
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }

            DateTime year = DateTime.Now;
            string Year = year.Year.ToString();
            LabelDokladCislo.Text = "007/" + Year;
            LabelVariabilniSymbol.Text = Year + "0007";
            DataClassesDataContext db = new DataClassesDataContext();
            var customer = (from i in db.Contracts
                            join j in db.Customers on i.Customers_id equals j.id
                            where i.id == ContractId
                            select j).First();

            if (customer.ICO != null) LabelOdberatelIC.Text = customer.ICO;
            else LabelOdberatelIC.Text = "";
            if (customer.DIC != null) LabelOdberatelDIC.Text = customer.DIC;
            else LabelOdberatelDIC.Text = "";
            LabelOdberatelAdresa.Text = customer.adress;
            LabelOdberatelMesto.Text = customer.city + " " + customer.postalCode.ToString();

            if (customer.CompanyName == null)
            {
                LabelOdberatelJmeno.Text = customer.lname + " " + customer.fname;
            }
            else
            {
                LabelOdberatelJmeno.Text = customer.CompanyName;
            }
            
            
        }
    }
}