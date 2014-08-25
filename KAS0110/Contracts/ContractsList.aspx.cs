using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAS0110.Models.Linq;

namespace KAS0110
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var DayTotalCash = (from i in db.Contracts
                                where i.CustomerExit.Value.Date == DateTime.Now.Date
                                select i.Payment).Sum();
            LabelTotalCash.Text = "V kase bys měl mít " + DayTotalCash + "Kč + cca 1000Kč od rána :)";
        }
    }
}