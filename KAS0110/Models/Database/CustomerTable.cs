using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class CustomerTable
    {
        string SQL_INSERT = "insert into Customers() Values(@p_email, @p_fname,@p_lname, @p_phone, @p_adress, @p_city, @p_postal);";
        string SQL_UPDATE = "update Customers set email = @p_email, fname = @p_fname, lname = @p_lname, phone = @p_phone, adress = @p_adress, city = @p_city, postalCode = @p_postal where @p_id = id ";
        string SQL_SELECT = "select * from Customers where lname like @p_lname";
        string SQL_SELECT_BY_ID= "select * from Customers where id = @p_id";
        //string SQL_DELETE = "delete from Customers where id = @p_id";
        string SQL_CUSTOMER_EXISTS = "select count(*) from Customers where email = @p_email";
        string connectionString;

        public CustomerTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["PneuservisConnectionString"].ConnectionString;
        }

        //public int Delete(int id)
        //{
        //    Database db = new Database(connectionString);
        //    db.Connect();
        //    SqlCommand command = db.CreateCommand(SQL_DELETE);

        //    command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
        //    command.Parameters["@p_id"].Value = id;

        //    int ret = db.ExecuteNonQuery(command);
        //    db.Close();
        //    return ret;
        //}
        public int Insert(Customer cust)
        {
            
            if (!FindCustomerByEmail(cust.email))
            {
                SchoolDatabase db = new SchoolDatabase();
                db.Connect();
                SqlCommand command = db.CreateCommand(SQL_INSERT);
                PrepareCommand(command, cust);
                int ret = db.ExecuteNonQuery(command);
                db.Close();
                return ret;
            }
            else return -2;
        }
        private bool FindCustomerByEmail(string email)
        {
            int tmp;
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_CUSTOMER_EXISTS);
            command.Parameters.Add(new SqlParameter("@p_email", SqlDbType.VarChar, 50));
            command.Parameters["@p_email"].Value = email;
            SqlDataReader reader = db.Select(command);
            reader.Read();
            tmp = reader.GetInt32(0);
            reader.Close();
            db.Close();
            if (tmp > 0) return true;
            else return false;
        }
        public int Update(Customer cust)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            PrepareCommand(command, cust);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public Customer Select(int id)
        {
            
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT_BY_ID);
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;
            SqlDataReader reader = db.Select(command);
            try
            {

            reader.Read();
            Customer cust = new Customer();
            cust.id = reader.GetInt32(0);
            cust.email = reader.GetString(1);
            cust.fname = reader.GetString(2);
            cust.lname = reader.GetString(3);
            cust.phone = reader.GetString(4);
            cust.adress = reader.GetString(5);
            cust.city = reader.GetString(6);
            cust.postaCode = reader.GetInt32(7);
            reader.Close();
            db.Close();
                return cust;   
            }
            catch
            {
                return null;
            }
            
            
        }
        public List<Customer> Select(string lname)
        {
            string tmp = lname + '%';
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT);
            command.Parameters.Add(new SqlParameter("@p_lname", SqlDbType.VarChar, 20));
            command.Parameters["@p_lname"].Value = tmp;

            SqlDataReader reader = db.Select(command);

            List<Customer> cust = Read(reader);
            reader.Close();
            db.Close();
            return cust;
        }

        private List<Customer> Read(SqlDataReader reader)
        {
            List<Customer> custs = new List<Customer>();

            while (reader.Read())
            {
                Customer cust = new Customer();
                cust.id = reader.GetInt32(0);
                cust.email = reader.GetString(1);
                cust.fname = reader.GetString(2);
                cust.lname = reader.GetString(3);
                cust.phone = reader.GetString(4);
                cust.adress = reader.GetString(5);
                cust.city = reader.GetString(6);
                cust.postaCode = reader.GetInt32(7);

                custs.Add(cust);
            }
            return custs;
        }
        private void PrepareCommand(SqlCommand command, Customer cust)
        {
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = cust.id;
            command.Parameters.Add(new SqlParameter("@p_email", SqlDbType.VarChar, 50));
            command.Parameters["@p_email"].Value = cust.email;
            command.Parameters.Add(new SqlParameter("@p_fname", SqlDbType.VarChar, 20));
            command.Parameters["@p_fname"].Value = cust.fname;
            command.Parameters.Add(new SqlParameter("@p_lname", SqlDbType.VarChar, 20));
            command.Parameters["@p_lname"].Value = cust.lname;
            command.Parameters.Add(new SqlParameter("@p_phone", SqlDbType.VarChar, 15));
            command.Parameters["@p_phone"].Value = cust.phone;
            command.Parameters.Add(new SqlParameter("@p_adress", SqlDbType.VarChar, 20));
            command.Parameters["@p_adress"].Value = cust.adress;
            command.Parameters.Add(new SqlParameter("@p_city", SqlDbType.VarChar, 20));
            command.Parameters["@p_city"].Value = cust.city;
            command.Parameters.Add(new SqlParameter("@p_postal", SqlDbType.Int));
            command.Parameters["@p_postal"].Value = cust.postaCode;

        }
    }
}