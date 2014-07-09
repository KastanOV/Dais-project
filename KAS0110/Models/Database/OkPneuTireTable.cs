using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace KAS0110.Models.Database
{
    public class OkPneuTireTable
    {
        string SQL_INSERT = "exec InsertNewTire @p_EAN, @p_manufacturer, @p_Size, @p_ExternalStore, @p_code, @p_Photo, @p_Description, @p_OnStore, @p_Price, @p_Name, @p_season;";
        string SQL_UPDATE = "exec UpdateTires @p_EAN, @p_Price, @p_ExternalStore";
        string SQL_SELECT_BY_DETAIL = "select * from SuplierTiresOKpneu where Size = @p_Size";
        string SQL_SELECT_BY_DETAIL_SIZE = "select * from SuplierTiresOKpneu where Size = @p_Size and season = @p_Season and ExternalStore >= @p_OnExternalStore and OnStore >= @p_OnLocalStore and manufacturer = @p_manu";
        string SQL_FIND_MANUFACTURER = "select distinct(manufacturer) from SuplierTiresOKpneu order by manufacturer";
        string SQL_FIND_BY_EAN = "select Name, Price from SuplierTiresOKpneu where EAN = @p_EAN";
        string connectionString;

        public OkPneuTireTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public int Insert(OkPneuTire tire)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            PrepareCommand(command, tire);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int Update(OkPneuTire tire)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            PrepareCommand(command, tire);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public OkPneuTire Select(string EAN)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_FIND_BY_EAN);

            command.Parameters.Add(new SqlParameter("@p_EAN", SqlDbType.VarChar, 14));
            command.Parameters["@p_EAN"].Value = EAN;

            SqlDataReader reader = db.Select(command);
            reader.Read();
            OkPneuTire tire = new OkPneuTire();
            tire.Name = reader.GetString(0);
            tire.ProdejniCena = reader.GetDecimal(1);
            
            reader.Close();
            db.Close();
            return tire;
        }
        public List<ListItem> FindManufacturers()
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_FIND_MANUFACTURER);
            SqlDataReader reader = db.Select(command);
            List<ListItem> tires = new List<ListItem>();
            while (reader.Read())
            {
                ListItem l1 = new ListItem(reader.GetString(0), "x", true);
                tires.Add(l1);
            }
            db.Close();
            return tires;
        }
        public List<OkPneuTire> Select(int size)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT_BY_DETAIL);

            command.Parameters.Add(new SqlParameter("@p_Size", SqlDbType.Int));
            command.Parameters["@p_Size"].Value = size;
            
            SqlDataReader reader = db.Select(command);

            List<OkPneuTire> tires = Read(reader);
            reader.Close();
            db.Close();
            return tires;
        }
        public List<OkPneuTire> Select(string strsize, char season, bool OnExternalStore, bool OnLokalStore, string manu)
        {
            if (strsize == null) return null;
            string pattern = "[1-3][0-9][0,5][3-9][0,5][1,2][0-9]";
            Regex currencyRegex = new Regex(pattern);
            if (currencyRegex.IsMatch(strsize))
            {


                int size = Int32.Parse(strsize);
                int min;
                if (OnExternalStore) min = 4;
                else min = 0;
                int minL;
                if (OnLokalStore) minL = 4;
                else minL = 0;

                SchoolDatabase db = new SchoolDatabase();
                db.Connect();

                SqlCommand command = db.CreateCommand(SQL_SELECT_BY_DETAIL_SIZE);

                command.Parameters.Add(new SqlParameter("@p_Size", SqlDbType.Int));
                command.Parameters["@p_Size"].Value = size;
                command.Parameters.Add(new SqlParameter("@p_Season", SqlDbType.Char, 1));
                command.Parameters["@p_Season"].Value = season;
                command.Parameters.Add(new SqlParameter("@p_OnExternalStore", SqlDbType.Int));
                command.Parameters["@p_OnExternalStore"].Value = min;
                command.Parameters.Add(new SqlParameter("@p_OnLocalStore", SqlDbType.Int));
                command.Parameters["@p_OnLocalStore"].Value = minL;
                command.Parameters.Add(new SqlParameter("@p_manu", SqlDbType.VarChar, 10));
                command.Parameters["@p_manu"].Value = manu;

                SqlDataReader reader = db.Select(command);

                List<OkPneuTire> tires = Read(reader);
                reader.Close();
                db.Close();
                return tires;
            }
            else return null;
        }
        
        private List<OkPneuTire> Read(SqlDataReader reader)
        {
            List<OkPneuTire> Tires = new List<OkPneuTire>();

            while (reader.Read())
            {
                OkPneuTire tire = new OkPneuTire();
                tire.EAN = reader.GetString(0);
                tire.Manufacturer = reader.GetString(1);
                tire.Detail = reader.GetInt32(2);
                tire.ExternalStore = reader.GetInt32(3);
                tire.code = reader.GetString(4);
                tire.OnStore = reader.GetInt32(5);
                tire.ProdejniCena = (decimal) reader.GetSqlMoney(6);
                tire.Name = reader.GetString(7);
                tire.Season = reader.GetString(8);
                tire.Description = reader.GetString(9);
                tire.ImageURL = reader.GetString(10);
                
                Tires.Add(tire);
            }
            return Tires;
        }
        private void PrepareCommand(SqlCommand command, OkPneuTire tire)
        {
            command.Parameters.Add(new SqlParameter("@p_EAN", SqlDbType.VarChar, 14));
            command.Parameters["@p_EAN"].Value = tire.EAN;
            command.Parameters.Add(new SqlParameter("@p_manufacturer", SqlDbType.VarChar, 10));
            command.Parameters["@p_manufacturer"].Value = tire.Manufacturer;
            command.Parameters.Add(new SqlParameter("@p_Size", SqlDbType.Int));
            command.Parameters["@p_Size"].Value = tire.Detail;
            command.Parameters.Add(new SqlParameter("@p_ExternalStore", SqlDbType.Int));
            command.Parameters["@p_ExternalStore"].Value = tire.OnStore;
            command.Parameters.Add(new SqlParameter("@p_code", SqlDbType.VarChar, 15));
            command.Parameters["@p_code"].Value = tire.code;
            command.Parameters.Add(new SqlParameter("@p_Photo", SqlDbType.VarChar, 200));
            command.Parameters["@p_Photo"].Value = tire.ImageURL;
            command.Parameters.Add(new SqlParameter("@p_Description", SqlDbType.VarChar, 2000));
            command.Parameters["@p_Description"].Value = tire.Description;
            command.Parameters.Add(new SqlParameter("@p_OnStore", SqlDbType.Int));
            command.Parameters["@p_OnStore"].Value = tire.OnStore;
            command.Parameters.Add(new SqlParameter("@p_Price", SqlDbType.Money));
            command.Parameters["@p_Price"].Value = tire.ProdejniCena;
            command.Parameters.Add(new SqlParameter("@p_Name", SqlDbType.VarChar, 50));
            command.Parameters["@p_Name"].Value = tire.Name;
            command.Parameters.Add(new SqlParameter("@p_season", SqlDbType.VarChar, 14));
            command.Parameters["@p_season"].Value = tire.Season;
        }
    }
}