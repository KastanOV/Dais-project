using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace KAS0110 
{
    /// <summary>
    /// Jebu nato jdu chrapat je treba dodelat vkladani pneumatik na local store a opravit chybu ukladani objednavky aneb FUCK RUCNI ORM
    /// </summary>
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem l1 = new ListItem("Letní pneu", "L", true);
                ListItem l2 = new ListItem("Zimní pneu", "Z", true);
                int month = DateTime.Now.Month;
                if (month > 2 && month < 8)
                {
                    HiddenFieldSeason.Value = "L";
                    DropDownList2.Items.Add(l1);
                    DropDownList2.Items.Add(l2);
                }
                else
                {
                    HiddenFieldSeason.Value = "Z";
                    DropDownList2.Items.Add(l2);
                    DropDownList2.Items.Add(l1);
                }
            }
        }

        protected void TextBoxSize_TextChanged(object sender, EventArgs e)
        {
            HiddenTireSize.Value = TextBoxSize.Text;
        }

        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
            string EAN;
            try
            {
                EAN = GridView1.SelectedValue.ToString();
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat pneumatiky');", true);
                return;
            }
            string redir = "~/Customers/AddOrder.aspx?EAN=" + EAN;
            Response.Redirect(redir);

        }
        protected void ButtonAddTireToLocalStore_Click(object sender, EventArgs e)
        {

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HiddenSelectedDropDownNamufacturer.Value = DropDownList1.SelectedValue;
        }
        protected void DropDownList_Season_Changed(object sender, EventArgs e)
        {
            HiddenFieldSeason.Value = DropDownList2.Text;
        }
        protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }
        protected void CheckBoxExtStore_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void CheckBoxLocStore_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}