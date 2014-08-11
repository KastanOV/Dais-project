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
                       select new { j.adress, j.city, j.CompanyName, j.DIC, j.fname, j.ICO, j.lname, j.postalCode, i.id }).First();
            CompanyName.Text = data.CompanyName;
            CustName.Text = data.lname + " " + data.fname;
            Adress.Text = data.adress + " " + data.city + " " + data.postalCode;
            IC.Text = data.ICO;
            DIC.Text = data.DIC;
            ContractID.Value = data.id.ToString();
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
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + id);
        }

        

        protected void ButtonAddItems_Click(object sender, EventArgs e)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            string SelectedEan;
            int TiresCount;
            try
            {
                TiresCount = Int32.Parse(TiresItemsCount.Text);
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Musíte napsat počet kusů pneumatik');", true);
                return;
            }
            try
            {
                SelectedEan = GridView2.SelectedDataKey.Value.ToString();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat pneumatiky');", true);
                SelectedEan = null;
                return;
            }

            var SelectedItem = (from i in db.SuplierTiresOKpneus
                                where i.EAN == SelectedEan
                                select i).First();
            Item NewItem = new Item()
            {
                EAN = SelectedItem.EAN,
                Name = SelectedItem.Name,
                PricePerItem = (int)SelectedItem.Price,
                COUNT = TiresCount,
                Contract_id = Int32.Parse(ContractID.Value),
                
            };
            int? result = 0;
            db.InsertItemsFaktura(NewItem.EAN, NewItem.Name, NewItem.PricePerItem, NewItem.COUNT, NewItem.Contract_id, ref result);
            if (result == 0)
            {
                Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + id);
            }
            else 
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco je špatně zavolejte šéfa');", true);
                Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=" + id);
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        
    }
}