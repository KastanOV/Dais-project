using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        bool st1, st2, st3;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadUI();
        }

        protected void ButtonStani1_Click(object sender, EventArgs e)
        {
            Contract con = new Contract();
            EmployeeTable empTable = new EmployeeTable();
            if (st1)
            {
                try
                {
                    con.CustomerId = Int32.Parse(GridView1.SelectedValue.ToString());
                }
                catch
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat klienta');", true);
                    return;
                }
            }
            if(empTable.CheckPasword(Int32.Parse(DropDownList1.SelectedValue.ToString()), TextBox1.Text))
            {
                ContractTable conTable = new ContractTable();
                con.EmployeesId = Int32.Parse(DropDownList1.SelectedValue.ToString());
                
                con.GarageNumber = 1;
                if (st1)
                {
                    conTable.Arrival(con);
                    Response.Redirect("~/Contracts/Contracts");
                }
                else
                {
                    try
                    {
                        conTable.Exit(con);
                        Response.Redirect("~/Contracts/Contracts");
                    }
                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco tam máte špatně.');", true);
                        return;
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Špatné heslo');", true);
            }
            
        }

        protected void ButtonStani2_Click(object sender, EventArgs e)
        {
            Contract con = new Contract();
            EmployeeTable empTable = new EmployeeTable();
            if (st2)
            {
                try
                {
                    con.CustomerId = Int32.Parse(GridView1.SelectedValue.ToString());
                }
                catch
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat klienta');", true);
                    return;
                }
            }
            if (empTable.CheckPasword(Int32.Parse(DropDownList1.SelectedValue.ToString()), TextBox1.Text))
            {
                ContractTable conTable = new ContractTable();
                con.EmployeesId = Int32.Parse(DropDownList1.SelectedValue.ToString());

                con.GarageNumber = 2;
                if (st2)
                {
                    conTable.Arrival(con);
                    Response.Redirect("~/Contracts/Contracts");
                }
                else
                {
                    try
                    {
                        
                        conTable.Exit(con);
                        Response.Redirect("~/Contracts/Contracts");
                    }
                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco tam máte špatně.');", true);
                        return;
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Špatné heslo');", true);
            }
        }

        protected void ButtonStani3_Click(object sender, EventArgs e)
        {
            Contract con = new Contract();
            EmployeeTable empTable = new EmployeeTable();
            if (st3)
            {
                try
                {
                    con.CustomerId = Int32.Parse(GridView1.SelectedValue.ToString());
                }
                catch
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Nejdříve musíte vybrat klienta');", true);
                    return;
                }
            }
            if (empTable.CheckPasword(Int32.Parse(DropDownList1.SelectedValue.ToString()), TextBox1.Text))
            {
                ContractTable conTable = new ContractTable();
                con.EmployeesId = Int32.Parse(DropDownList1.SelectedValue.ToString());

                con.GarageNumber = 3;
                if (st3)
                {
                    conTable.Arrival(con);
                    Response.Redirect("~/Contracts/Contracts");
                }
                else
                {
                    try
                    {
                        
                        conTable.Exit(con);
                        Response.Redirect("~/Contracts/Contracts");
                    }
                    catch
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Něco tam máte špatně.');", true);
                        return;
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Špatné heslo');", true);
            }
        }

        protected void ButtonAddCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customers/AddCustomer");
        }
        private void LoadUI()
        {
            ContractTable ct = new ContractTable();
            st1 = ct.IsGarageEmpty(1);
            st2 = ct.IsGarageEmpty(2);
            st3 = ct.IsGarageEmpty(3);

            if (st1)
            {
                ButtonStani1.Text = "Příjezd vozidla";
                ButtonStani1.Enabled = true;
                ButtonPrint1.Enabled = false;
            }
            else
            {
                ButtonStani1.Text = "Příjezd vozidla";
                ButtonStani1.Enabled = false;
                ButtonPrint1.Enabled = true;
            }
            if (st2)
            {
                ButtonStani2.Text = "Příjezd vozidla";
                ButtonStani2.Enabled = true;
                ButtonPrint2.Enabled = false;
            }
            else
            {
                ButtonStani2.Text = "Příjezd vozidla";
                ButtonStani2.Enabled = false;
                ButtonPrint2.Enabled = true;
            }
            if (st3)
            {
                ButtonStani3.Text = "Příjezd vozidla";
                ButtonStani3.Enabled = true;
                ButtonPrint3.Enabled = false;
            }
            else
            {
                ButtonStani3.Text = "Příjezd vozidla";
                ButtonStani3.Enabled = false;
                ButtonPrint3.Enabled = true;
            }
        }

        protected void ButtonAddTire1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=1");
        }

        protected void ButtonAddTire2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=2");
        }

        protected void ButtonAddTire3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contracts/CreateBigContract.aspx?GarageNumber=3");
        }
    }
}