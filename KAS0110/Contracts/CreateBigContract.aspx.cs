using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAS0110.Models.Linq;
using System.Threading;

namespace KAS0110
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        int GarageNumber;
        
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GarageNumber = Int32.Parse(Server.UrlDecode(Request.QueryString["GarageNumber"]));
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }
            LoadInfo();
        }
        private void LoadInfo()
        {
            var data = (from i in db.Contracts
                       join j in db.Customers on i.Customers_id equals j.id
                       join k in db.Employees on i.Employees_id equals k.id
                       where i.GarageNumber == GarageNumber && i.CustomerExit == null
                       select new { j.adress, j.city, j.CompanyName, j.DIC, j.fname, j.ICO, j.lname, j.postalCode, i.id, k.Fname, k.Lname, k.login }).First();
            CompanyName.Text = data.CompanyName;
            CustName.Text = data.lname + " " + data.fname;
            Adress.Text = data.adress + " " + data.city + " " + data.postalCode;
            IC.Text = data.ICO;
            DIC.Text = data.DIC;
            ContractID.Value = data.id.ToString();
            LabelEmployeeName.Text = data.Fname + " " + data.Lname + " " + data.login;
            makeTotalPrices();
        }

        protected void ButtonAddWork_Click(object sender, EventArgs e)
        {
            
            var item = (from i in db.WorkItemsReadies
                        where i.id == Int32.Parse(DropDownList2.Text)
                        select i).First();
            WorkItem items = new WorkItem() 
            {
                Name = item.Name,
                Description = item.Description,
                Price = item.Price,
                COUNT = Int32.Parse(TextBox1.Text),
                Contract_id = Int32.Parse(ContractID.Value)
            };
            db.WorkItems.InsertOnSubmit(items);
            db.SubmitChanges();
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + GarageNumber);
        }

        protected void ButtonAddItems_Click(object sender, EventArgs e)
        {
            
            var item = (from i in db.ConsumablesReadies
                        where i.id == Int32.Parse(DropDownListCustomables.SelectedValue)
                        select i).First();
            int ItemsCount = 0;
            try
            {
                ItemsCount = Int32.Parse(TextBoxMaterialSummary.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
            }
            Consumable con = new Consumable()
            {
                Contract_id = Int32.Parse(ContractID.Value),
                Count = ItemsCount,
                Name = item.Name,
                Price = item.Price
            };
            db.Consumables.InsertOnSubmit(con);
            db.SubmitChanges();
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + GarageNumber);
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ButtonAddMaterial_Click(object sender, EventArgs e)
        {
            int tmp = 0;
            try
            {
                tmp = Int32.Parse(TextBoxMaterialSummary.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
                return;
            }
            TextBoxMaterialSummary.Text = (tmp + 1).ToString();
        }

        protected void ButtonDropMaterial_Click(object sender, EventArgs e)
        {
            int tmp = 0;
            try
            {
                tmp = Int32.Parse(TextBoxMaterialSummary.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
                return;
            }
            TextBoxMaterialSummary.Text = (tmp - 1).ToString();
        }

        protected void ButtonSubmitTires_Click(object sender, EventArgs e)
        {
            string tmp;
            try
            {
                tmp = GridView3.SelectedDataKey.Value.ToString();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva nejdříve musíš vybrat gumy');", true);
                return;
            }
            
            DataClassesDataContext db = new DataClassesDataContext();
            SuplierTiresOKpneu tire = new SuplierTiresOKpneu();
            try 
            {
                tire = (from i in db.SuplierTiresOKpneus
                                           where i.EAN == tmp
                                           select i).First();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Vloudila se mi tady chybka sorry');", true);
                return;
            }
            Item item = new Item() 
            { 
                Contract_id = Int32.Parse(ContractID.Value),
                COUNT = Int32.Parse(TextBoxTiresCount.Text),
                EAN = tire.EAN,
                Name = tire.Name,
                PricePerItem = (int)tire.Price
            };
            db.Items.InsertOnSubmit(item);
            db.SubmitChanges();
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + GarageNumber);
        }

        protected void ButtonIncrementTiresCount_Click(object sender, EventArgs e)
        {
            int tmp = 0;
            try
            {
                tmp = Int32.Parse(TextBoxTiresCount.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
                return;
            }
            TextBoxTiresCount.Text = (tmp + 1).ToString();
        }

        protected void ButtonDecrementTiresCount_Click(object sender, EventArgs e)
        {
            int tmp = 0;
            try
            {
                tmp = Int32.Parse(TextBoxTiresCount.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
                return;
            }
            TextBoxTiresCount.Text = (tmp - 1).ToString();
        }
        protected void TireSearchChanged(object sender, EventArgs e)
        {
            try
            {
                TireSize.Value = TextBoxSearchTires.Text;
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kurva přestaňte mi tady psát kokotiny');", true);
                TireSize.Value = "0";
                return;
            }
        }

        protected void ButtonSaveWitoutID_Click(object sender, EventArgs e)
        {
            int ContractIDProp = Int32.Parse(ContractID.Value);
            InvoiceItemsTable Invoice = new InvoiceItemsTable();
            db.ContractExit((short)GarageNumber, (int)(Invoice.WorkItemsWithoutVat(ContractIDProp) + ((double)Invoice.CunsumablesItemsWithouVat(ContractIDProp) * (double)1.21)), false);
            Response.Redirect("~/Contracts/Contracts");
        }

        protected void ButtonSaveAndPrint_Click(object sender, EventArgs e)
        {
            int ContractIDProp = Int32.Parse(ContractID.Value);
            InvoiceItemsTable Invoice = new InvoiceItemsTable();
            db.ContractExit((short)GarageNumber, (int)(((double)Invoice.WorkItemsWithoutVat(ContractIDProp) * (double)1.21 + ((double)Invoice.CunsumablesItemsWithouVat(ContractIDProp) * (double)1.21))), true);
            Response.Redirect("~/Contracts/PrintBill.aspx?ContractId=" + ContractID.Value.ToString() + "&ZpusobPlatby=" + DropDownListZpusobPlatby.SelectedValue.ToString());
        }
        private void makeTotalPrices()
        {
            InvoiceItemsTable Invoice = new InvoiceItemsTable();
            int ContractIDProp = Int32.Parse(ContractID.Value);
            LabelPaymentWithoutVat.Text = ((int)(Invoice.WorkItemsWithoutVat(ContractIDProp) + ((double)Invoice.CunsumablesItemsWithouVat(ContractIDProp) * (double)1.21))).ToString();
            LabelPaymentwithVat.Text = ((int)(((double)Invoice.WorkItemsWithoutVat(ContractIDProp) * (double)1.21 + ((double)Invoice.CunsumablesItemsWithouVat(ContractIDProp) * (double)1.21)))).ToString();
        }
        
        
    }
}