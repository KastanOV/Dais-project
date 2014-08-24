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
        DataClassesDataContext db = new DataClassesDataContext();

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
            HiddenFieldContractID.Value = ContractId.ToString();
            DateTime time = DateTime.Now;
            string Year = time.Year.ToString();           
            
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
            if (ZpusobPlatby == "H")
            {
                string datum = time.Day.ToString() + "." + time.Month.ToString() + "." + time.Year.ToString();
                LabelDatumVystaveni.Text =  datum;
                LabelDatumSplatnosti.Text = datum;
                LabelDatumDUZP.Text = datum;
                LabelZpusobPlatby.Text = "Hotově";
            }
            else if (ZpusobPlatby == "P")
            {
                string datum = time.Day.ToString() + "." + time.Month.ToString() + "." + time.Year.ToString();
                LabelDatumVystaveni.Text =  datum;
                LabelDatumDUZP.Text = datum;
                TimeSpan DaysInc = new TimeSpan(14, 0, 0, 0);
                time = time + DaysInc;
                datum = time.Day.ToString() + "." + time.Month.ToString() + "." + time.Year.ToString();
                LabelDatumSplatnosti.Text = datum;
                LabelZpusobPlatby.Text = "Převodem";
            }
            int TotalWithoutVat;
            InvoiceItemsTable PriceComp = new InvoiceItemsTable();
            TotalWithoutVat = PriceComp.TotalPriceWitoutVat(ContractId);
            int TotalWithVat = (int)((double)TotalWithoutVat * (double)1.21);
            LabelTotalPriceWithoutVat.Text = TotalWithoutVat.ToString() + " Kč";
            LabelTotalPriceWithVat.Text = TotalWithVat.ToString() + " Kč";
        }

        private void CreateNewInvoiceID()
        {
            

            var ContractToUpdateInvoiceID = (from i in db.Contracts
                                             where i.id == ContractId
                                             select i).First();
            int LastInvoiceID;

            try
            {
                LastInvoiceID = (from i in db.Contracts
                                 where i.CustomerArrival.Year == DateTime.Now.Year
                                 select i.VoiceID).Max(x => x.Value);
            }
            catch
            {
                LastInvoiceID = 1;
            }

            LastInvoiceID += 1;

            ContractToUpdateInvoiceID.VoiceID = LastInvoiceID;
            db.SubmitChanges();

            string InvoiceNumber = "00000";
            
            int Length = LastInvoiceID.ToString().Length;
            
            LabelDokladCislo.Text = "007/";
            LabelVariabilniSymbol.Text = "0007";
        }
    }
}