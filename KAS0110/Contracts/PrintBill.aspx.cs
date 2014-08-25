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
            FillInvoice();
            CreateNewInvoiceID();
        }

        private void FillInvoice()
        {
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
                LabelDatumVystaveni.Text = datum;
                LabelDatumSplatnosti.Text = datum;
                LabelDatumDUZP.Text = datum;
                LabelZpusobPlatby.Text = "Hotově";
            }
            else if (ZpusobPlatby == "P")
            {
                string datum = time.Day.ToString() + "." + time.Month.ToString() + "." + time.Year.ToString();
                LabelDatumVystaveni.Text = datum;
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
            int LastInvoiceID;

            var ContractToUpdateInvoiceID = (from i in db.Contracts
                                             where i.id == ContractId
                                             select i).First();
            
            if (ContractToUpdateInvoiceID.VoiceID == null)
            {
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

                string InvoiceNumber;

                switch (LastInvoiceID.ToString().Length)
                {
                    case 1:
                        InvoiceNumber = "0000" + LastInvoiceID.ToString();
                        break;
                    case 2:
                        InvoiceNumber = "000" + LastInvoiceID.ToString();
                        break;
                    case 3:
                        InvoiceNumber = "00" + LastInvoiceID.ToString();
                        break;
                    case 4:
                        InvoiceNumber = "0" + LastInvoiceID.ToString();
                        break;
                    default:
                        InvoiceNumber = LastInvoiceID.ToString();
                        break;
                }
                LabelDokladCislo.Text = DateTime.Now.Year + InvoiceNumber;
                LabelVariabilniSymbol.Text = DateTime.Now.Year + InvoiceNumber;
            }
            else
            {
                LastInvoiceID = (int)ContractToUpdateInvoiceID.VoiceID;
                string InvoiceNumber;

                switch (LastInvoiceID.ToString().Length)
                {
                    case 1:
                        InvoiceNumber = "0000" + LastInvoiceID.ToString();
                        break;
                    case 2:
                        InvoiceNumber = "000" + LastInvoiceID.ToString();
                        break;
                    case 3:
                        InvoiceNumber = "00" + LastInvoiceID.ToString();
                        break;
                    case 4:
                        InvoiceNumber = "0" + LastInvoiceID.ToString();
                        break;
                    default:
                        InvoiceNumber = LastInvoiceID.ToString();
                        break;
                }
                LabelDokladCislo.Text = DateTime.Now.Year + InvoiceNumber;
                LabelVariabilniSymbol.Text = DateTime.Now.Year + InvoiceNumber;
            }
            
        }

        protected void ButtonPrint_Click(object sender, EventArgs e)
        {
            ButtonPrint.Visible = false;
            Page.RegisterStartupScript("PrintPage", "<script language='javascript'>window.print(); window.location.replace(\"Contracts.aspx\");</script>");
            
        }
    }
}