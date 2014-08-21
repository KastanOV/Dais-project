using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class StoredWheelsTable
    {
        string SQL_INSERT = "insert into StoredWheelsDescription (Tiremanufacturer, DiscDescription, TireDecription, StoreDate, Customers_id, Employees_id_Store) values (@p_Tiremanufacturer, @p_DiscDescription, @p_TireDecription, getdate(), @p_Customers_id, @p_Employees_id_Store);";
        string SQL_UNSTORE_CHECK = "select count(*) from StoredWheelsDescription where id = @p_id and UnStoreDate IS NULL";
        string SQL_SELECT = "select StoredWheelsDescription.id, StoredWheelsDescription.Customers_id, Tiremanufacturer,DiscDescription,TireDecription,StoreDate, emp1.lname, emp1.fname, UnstoreDate, emp2.lname, emp2.fname,Employees_id_Unstore from StoredWheelsDescription left join Employees emp1 on StoredWheelsDescription.Employees_id_Store = emp1.id left join Employees emp2 on StoredWheelsDescription.Employees_id_Unstore = emp2.id where Customers_id = @p_Customers_id";
        string SQL_UNSTORE = "update StoredWheelsDescription set UnstoreDate = getdate(), Employees_id_Unstore = @p_Unstore_id where id = @p_id";
        //string SQL_STORE = "insert into StoredWheelsDescription (Tiremanufacturer, DiscDescription, TireDecription, StoreDate, Customers_id, Employees_id_Store) values (@p_Tiremanufacturer,@p_DiscDescription,@p_TireDecription,getdate(),@p_Customers_id,@p_Employees_id_Store)";
        string connectionString;

        public StoredWheelsTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["PneuservisConnectionString"].ConnectionString;
        }

        public int Insert(StoredWheels st)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            PrepareCommand(command, st);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public bool UnstoreCheck(int id)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UNSTORE_CHECK);

            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;
            SqlDataReader reader = db.Select(command);
            reader.Read();
            int ret = reader.GetInt32(0);
            
            db.Close();
            if (ret == 1) return true;
            else return false;
        }
        public bool UnstoreTires(int id, int EmployeeID)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UNSTORE);

            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;

            command.Parameters.Add(new SqlParameter("@p_Unstore_id", SqlDbType.Int));
            command.Parameters["@p_Unstore_id"].Value = EmployeeID;

            int ret = db.ExecuteNonQuery(command);
            
            db.Close();
            if (ret == 1) return true;
            else return false;
        }
        
        public List<StoredWheels> Select(int id)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT);
            command.Parameters.Add(new SqlParameter("@p_Customers_id", SqlDbType.VarChar, 20));
            command.Parameters["@p_Customers_id"].Value = id;

            SqlDataReader reader = db.Select(command);

            List<StoredWheels> cust = Read(reader);
            reader.Close();
            db.Close();
            return cust;
        }

        private List<StoredWheels> Read(SqlDataReader reader)
        {
            List<StoredWheels> stTable = new List<StoredWheels>();
            //StoredWheelsDescription.id 0, 
            //StoredWheelsDescription.Customers_id 1, 
            //Tiremanufacturer2,
            //DiscDescription 3,
            //TireDecription 4,
            //StoreDate 5, emp1.lname, emp1.fname, UnstoreDate, emp2.lname, emp2.fname,Employees_id_Unstore
            while (reader.Read())
            {
                StoredWheels st = new StoredWheels();
                st.id = reader.GetInt32(0);
                st.Customers_id = reader.GetInt32(1);
                st.Tiremanufacturer = reader.GetString(2);
                st.DiscDescription = reader.GetString(3);
                st.TireDecription = reader.GetString(4);
                st.StoreDate = reader.GetDateTime(5);
                st.EmpStoreFname = reader.GetString(7);
                st.EmpStoreLname = reader.GetString(6);
                try
                {
                    st.UnstoreDate = reader.GetDateTime(8);
                    st.EmpUnStoreFname = reader.GetString(10);
                    st.EmpUnStoreLname = reader.GetString(9);
                    st.Employees_id_Unstore = reader.GetInt32(11);
                }
                catch
                {
                    st.UnstoreDate = null;
                    st.EmpUnStoreFname = null;
                    st.EmpUnStoreLname = null;
                    st.Employees_id_Unstore = null;
                }
                
                stTable.Add(st);
            }
            return stTable;
        }
        private void PrepareCommand(SqlCommand command, StoredWheels st)
        {
            //(@p_Tiremanufacturer, @p_DiscDescription, @p_TireDecription, getdate(), @p_Customers_id, @p_Employees_id_Store)
            command.Parameters.Add(new SqlParameter("@p_Tiremanufacturer", SqlDbType.VarChar, 10));
            command.Parameters["@p_Tiremanufacturer"].Value = st.Tiremanufacturer;
            command.Parameters.Add(new SqlParameter("@p_DiscDescription", SqlDbType.VarChar, 50));
            command.Parameters["@p_DiscDescription"].Value = st.DiscDescription;
            command.Parameters.Add(new SqlParameter("@p_TireDecription", SqlDbType.VarChar, 50));
            command.Parameters["@p_TireDecription"].Value = st.TireDecription;
            command.Parameters.Add(new SqlParameter("@p_Customers_id", SqlDbType.Int));
            command.Parameters["@p_Customers_id"].Value = st.Customers_id;
            command.Parameters.Add(new SqlParameter("@p_Employees_id_Store", SqlDbType.Int));
            command.Parameters["@p_Employees_id_Store"].Value = st.Employees_id_Store;
        }
    
    }
}