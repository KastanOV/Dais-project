using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class BazarTiresTable
    {
        string SQL_INSERT = "insert into BazarTires(Manufacturer,Size,\"Type\",\"Description\",Customers_id) values (@p_Manufacturer, @p_Size, @p_Type, @p_Description, @p_Customers_id)";
        string SQL_DELETE = "delete from BazarTires where id = @p_id";
        string SQL_SELECT = "select * from BazarTires ";
        
        string connectionString;

        public BazarTiresTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public int Delete(BazarTires tir)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_DELETE);
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = tir.id;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int Insert(BazarTires tir)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            PrepareCommand(command, tir);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public List<BazarTires> Select()
        {
            
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT);

            SqlDataReader reader = db.Select(command);

            List<BazarTires> cust = Read(reader);
            reader.Close();
            db.Close();
            return cust;
        }

        private List<BazarTires> Read(SqlDataReader reader)
        {
            List<BazarTires> Tires = new List<BazarTires>();

            while (reader.Read())
            {
                BazarTires tir = new BazarTires();
                tir.id = reader.GetInt32(0);
                tir.Manufacturer = reader.GetString(1);
                tir.Size = reader.GetInt32(2);
                tir.Type = reader.GetString(3);
                tir.Description = reader.GetString(4);
                tir.Customers_id = reader.GetInt32(5);
                Tires.Add(tir);
            }
            return Tires;
        }
        private void PrepareCommand(SqlCommand command, BazarTires tir)
        {
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = tir.id;
            command.Parameters.Add(new SqlParameter("@p_Manufacturer", SqlDbType.VarChar, 10));
            command.Parameters["@p_Manufacturer"].Value = tir.Manufacturer;
            command.Parameters.Add(new SqlParameter("@p_Size", SqlDbType.Int));
            command.Parameters["@p_Size"].Value = tir.Size;
            command.Parameters.Add(new SqlParameter("@p_Type", SqlDbType.VarChar, 50));
            command.Parameters["@p_Type"].Value = tir.Type;
            command.Parameters.Add(new SqlParameter("@p_Description", SqlDbType.VarChar, 200));
            command.Parameters["@p_Description"].Value = tir.Description;
            command.Parameters.Add(new SqlParameter("@p_Customers_id", SqlDbType.Int));
            command.Parameters["@p_Customers_id"].Value = tir.Customers_id;

        }
    }
}