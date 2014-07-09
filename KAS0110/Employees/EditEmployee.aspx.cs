using KAS0110.Models.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAS0110
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        int id;
        Employee emp;
        //string SQL_UPDATE = "update Employees set login = @p_login, Fname = @p_fname, Lname = @p_lname, Password =@p_password, Phone = @p_phone, Adress = @p_adress, City = @p_city, Experience = @p_experiance  where @p_id = id ";
        bool first;
        StringBuilder strBuilCommand;
        bool DoUpdate;

        protected void Page_Load(object sender, EventArgs e)
        {
            
                first = true;
                try
                {
                    id = Int32.Parse(Server.UrlDecode(Request.QueryString["id"]));
                }
                catch (ArgumentNullException)
                {
                    Response.Redirect("~/");
                }

                EmployeeTable empTable = new EmployeeTable();
                emp = new Employee();
                emp = empTable.Select(id);
                if (!Page.IsPostBack)
                {
                    DoUpdate = false;
                    TextBoxAdress.Text = emp.adress.ToString();
                    TextBoxCity.Text = emp.city.ToString();
                    TextBoxExperience.Text = emp.experience.ToString();
                    TextBoxFname.Text = emp.fname.ToString();
                    TextBoxLname.Text = emp.lname.ToString();
                    TextBoxLogin.Text = emp.login.ToString();
                    TextBoxPassword.Text = emp.password.ToString();
                    TextBoxPhone.Text = emp.phone.ToString();
                }
                strBuilCommand = new StringBuilder();
                strBuilCommand.Append("update Employees set");
            
            
        }
        
        private void PrepareCommand(SqlCommand command, Employee emp)
        {
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = emp.id;
            command.Parameters.Add(new SqlParameter("@p_login", SqlDbType.VarChar, 10));
            command.Parameters["@p_login"].Value = emp.login;
            command.Parameters.Add(new SqlParameter("@p_fname", SqlDbType.VarChar, 20));
            command.Parameters["@p_fname"].Value = emp.fname;
            command.Parameters.Add(new SqlParameter("@p_lname", SqlDbType.VarChar, 20));
            command.Parameters["@p_lname"].Value = emp.lname;
            command.Parameters.Add(new SqlParameter("@p_password", SqlDbType.VarChar, 20));
            command.Parameters["@p_password"].Value = emp.password;
            command.Parameters.Add(new SqlParameter("@p_phone", SqlDbType.VarChar, 15));
            command.Parameters["@p_phone"].Value = emp.phone;
            command.Parameters.Add(new SqlParameter("@p_adress", SqlDbType.VarChar, 20));
            command.Parameters["@p_adress"].Value = emp.adress;
            command.Parameters.Add(new SqlParameter("@p_city", SqlDbType.VarChar, 20));
            command.Parameters["@p_city"].Value = emp.city;
            command.Parameters.Add(new SqlParameter("@p_experiance", SqlDbType.TinyInt));
            command.Parameters["@p_experiance"].Value = emp.experience;
        }

        protected void Page_Load_Login(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" login = @p_login");
            emp.login = TextBoxLogin.Text;
        }
        

        protected void TextBoxFname_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Fname = @p_fname");
            emp.fname = TextBoxFname.Text;
        }

        protected void TextBoxLname_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Lname = @p_lname");
            emp.lname = TextBoxLname.Text;
        }

        protected void TextBoxPassword_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Password =@p_password");
            emp.password = TextBoxPassword.Text;
        }

        protected void TextBoxPhone_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Phone = @p_phone");
            emp.phone = TextBoxPhone.Text;
        }

        protected void TextBoxAdress_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Adress = @p_adress");
            emp.adress = TextBoxAdress.Text;
        }

        protected void TextBoxCity_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" City = @p_city");
            emp.city = TextBoxCity.Text;
        }

        protected void TextBoxExperience_TextChanged(object sender, EventArgs e)
        {
            DoUpdate = true;
            if (!first)
            {
                strBuilCommand.Append(",");
            }
            else first = false;
            strBuilCommand.Append(" Experience = @p_experiance");

            emp.experience = Byte.Parse(TextBoxExperience.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DoUpdate)
            {
                strBuilCommand.Append(" where @p_id = id");

                SchoolDatabase db = new SchoolDatabase();
                db.Connect();
                string tmp = strBuilCommand.ToString();
                SqlCommand command = db.CreateCommand(tmp);
                PrepareCommand(command, emp);
                int ret = db.ExecuteNonQuery(command);
                db.Close();
            }
            Response.Redirect("~/Employees/ListEmployee.aspx");
        }

    }
}