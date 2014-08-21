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
        int GarageNumber;
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
            DataClassesDataContext db = new DataClassesDataContext();
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
        }

        protected void ButtonAddWork_Click(object sender, EventArgs e)
        {
            DataClassesDataContext db = new DataClassesDataContext();
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
            DataClassesDataContext db = new DataClassesDataContext();
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

        
    }
}