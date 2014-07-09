using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class OrderTable
    {
        string SQL_INSERT_NEW = "exec NewOrder @p_CustomerID, @p_EmployeesID, @p_ean, @p_count, @p_price";
        string SQL_SELECT_NEW = "select O_ID.id,O_ID.\"DATETIME\", \"status\", CST.lname, CST.email, CST.phone, EMP.login, EMP.Lname from \"Order\" O_ID join Customers CST on O_ID.Customers_id = CST.id join Employees EMP on O_ID.Employees_id = EMP.id where \"status\" = 'n' order by \"DATETIME\" desc";
        string SQL_SELECT_ALL = "select O_ID.id,O_ID.\"DATETIME\", \"status\", CST.lname, CST.email, CST.phone, EMP.login, EMP.Lname from \"Order\" O_ID join Customers CST on O_ID.Customers_id = CST.id join Employees EMP on O_ID.Employees_id = EMP.id where \"status\" != 'n' order by \"DATETIME\" desc";
        string SQL_UPDATE = "update \"Order\" set \"status\" = @p_status where id = @p_id";
        string SQL_SELECT_ORDER_EANS = "select SuplierTiresOKpneu_EAN,ProductCount,PricePerPiece from OrderSuplierTiresOKPneu where order_Id = @p_order_Id;";
        //string SQL_IS_GARAGE_EMPTY = "select count(*) from \"Contract\" where CustomerExit is null and GarageNumber = @p_gar";
        //string SQL_CHECK = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is null;";
        //string SQL_LIST = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is not null";
        string connectionString;

        public OrderTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
        public List<OkPneuTireOrderExtended> SelectTiresInOrder(int OrderId)
        {
            List<OkPneuTireOrderExtended> TiresList = new List<OkPneuTireOrderExtended>();
            SchoolDatabase db = new SchoolDatabase();
            OkPneuTireTable dbOKPneu = new OkPneuTireTable();

            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_ORDER_EANS);
            command.Parameters.Add(new SqlParameter("@p_order_Id", SqlDbType.Int));
            command.Parameters["@p_order_Id"].Value = OrderId;
            SqlDataReader reader = db.Select(command);
            while (reader.Read())
            {
                string EAN = reader.GetString(0);
                int count = reader.GetInt32(1);
                decimal price = reader.GetDecimal(2);
                OkPneuTireOrderExtended tmpOE = new OkPneuTireOrderExtended();
                OkPneuTire tmp = new OkPneuTire();
                tmp = dbOKPneu.Select(EAN);
                tmpOE.count = count;
                tmpOE.OrderPrice = price;
                tmpOE.EAN = EAN;
                tmpOE.Name = tmp.Name;

                TiresList.Add(tmpOE);
            }
            reader.Close();
            db.Close();
            return TiresList;
        }
        public int InsertNewOrder(int Cust_id, int Empl_id, string EAN, int count, decimal price)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT_NEW);
            PrepareCommand(command, Cust_id, Empl_id, EAN, count, price);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int UpdateOrder(OrderExteneded ord)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = ord.id;
            command.Parameters.Add(new SqlParameter("@p_status", SqlDbType.Char, 1));
            command.Parameters["@p_status"].Value = ord.Status;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public List<OrderExteneded> Select(bool vyrizeneObj)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command;
            if(!vyrizeneObj) command = db.CreateCommand(SQL_SELECT_NEW);
            else command = db.CreateCommand(SQL_SELECT_ALL);
            SqlDataReader reader = db.Select(command);
            List<OrderExteneded> emp = Read(reader);
            reader.Close();
            db.Close();
            return emp;
        }
        private List<OrderExteneded> Read(SqlDataReader reader)
        {
            List<OrderExteneded> oe = new List<OrderExteneded>();

            while (reader.Read())
            {
                OrderExteneded o = new OrderExteneded();
                o.id = reader.GetInt32(0);
                o.date = reader.GetDateTime(1);
                string tmp = reader.GetString(2);
                o.Status = tmp[0];
                o.Customer_LastName = reader.GetString(3);
                o.Customer_email = reader.GetString(4);
                o.Customer_Phone = reader.GetString(5);
                o.Employee_Login = reader.GetString(6);
                o.Employee_Lname = reader.GetString(7);

                oe.Add(o);
            }
            return oe;
        }
        private void PrepareCommand(SqlCommand command, int Cust_id, int Empl_id, string EAN, int count, decimal price)
        {
            command.Parameters.Add(new SqlParameter("@p_CustomerID", SqlDbType.Int));
            command.Parameters["@p_CustomerID"].Value = Cust_id;
            command.Parameters.Add(new SqlParameter("@p_EmployeesID", SqlDbType.Int));
            command.Parameters["@p_EmployeesID"].Value = Empl_id;
            command.Parameters.Add(new SqlParameter("@p_ean", SqlDbType.VarChar, 14));
            command.Parameters["@p_ean"].Value = EAN;
            command.Parameters.Add(new SqlParameter("@p_count", SqlDbType.Int));
            command.Parameters["@p_count"].Value = count;
            command.Parameters.Add(new SqlParameter("@p_price", SqlDbType.Money));
            command.Parameters["@p_price"].Value = price;
            
        }
    }
}