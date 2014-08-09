using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class ContractTable
    {
        string SQL_ARRIVAL = "exec ContractArrival @p_CustomerID, @p_EmployeesID,  @p_GarageNumber";
        string SQL_EXIT = "exec ContractExit @p_GarageNumber, @p_Payment, @p_VAT";
        string SQL_IS_GARAGE_EMPTY = "select count(*) from \"Contract\" where CustomerExit is null and GarageNumber = @p_gar";
        string SQL_SELECT = "Select * from Contract order by CustomerArrival desc";
        //string SQL_CHECK = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is null;";
        //string SQL_LIST = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is not null";
        string connectionString;

        public ContractTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["FileConnection"].ConnectionString;
        }

        public int Arrival(Contract con)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_ARRIVAL);

            command.Parameters.Add(new SqlParameter("@p_CustomerID", SqlDbType.Int));
            command.Parameters["@p_CustomerID"].Value = con.CustomerId;
            command.Parameters.Add(new SqlParameter("@p_EmployeesID", SqlDbType.Int));
            command.Parameters["@p_EmployeesID"].Value = con.EmployeesId;
            command.Parameters.Add(new SqlParameter("@p_GarageNumber", SqlDbType.SmallInt));
            command.Parameters["@p_GarageNumber"].Value = con.GarageNumber;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int Exit(Contract con)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_EXIT);

            command.Parameters.Add(new SqlParameter("@p_GarageNumber", SqlDbType.SmallInt));
            command.Parameters["@p_GarageNumber"].Value = con.GarageNumber;
            command.Parameters.Add(new SqlParameter("@p_Payment", SqlDbType.SmallInt));
            command.Parameters["@p_Payment"].Value = con.Payment;
            command.Parameters.Add(new SqlParameter("@p_VAT", SqlDbType.Bit));
            command.Parameters["@p_VAT"].Value = con.VAT;

            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public bool IsGarageEmpty(int gar)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_IS_GARAGE_EMPTY);
            command.Parameters.Add(new SqlParameter("@p_gar", SqlDbType.Int));
            command.Parameters["@p_gar"].Value = gar;
            SqlDataReader reader = db.Select(command);
            
            reader.Read();
            int tmp = reader.GetInt32(0);
            reader.Close();
            db.Close();
            if (tmp == 0) return true;
            else return false;
        }
        public List<Contract> Select()
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT);


            SqlDataReader reader = db.Select(command);

            List<Contract> emp = Read(reader);
            reader.Close();
            db.Close();
            return emp;
        }

        private List<Contract> Read(SqlDataReader reader)
        {
            List<Contract> emps = new List<Contract>();

            while (reader.Read())
            {
                Contract emp = new Contract();
                emp.CustomerId = reader.GetInt32(1);
                emp.EmployeesId = reader.GetInt32(2);
                emp.Arrival = reader.GetDateTime(3);
                //emp.GarageNumber = reader.GetByte(4);
                try
                {
                    
                    emp.Exit = reader.GetDateTime(5);
                    emp.Payment = reader.GetInt32(6);
                    emp.VAT = reader.GetBoolean(7);
                }
                catch
                {
                    emp.Exit = null;
                    emp.Payment = null;
                    emp.VAT = null;
                }
                
                emps.Add(emp);
            }
            return emps;
        }
        private void PrepareCommand(SqlCommand command, Contract con)
        {
            command.Parameters.Add(new SqlParameter("@p_CustomerID", SqlDbType.Int));
            command.Parameters["@p_CustomerID"].Value = con.CustomerId;
            command.Parameters.Add(new SqlParameter("@p_EmployeesID", SqlDbType.Int));
            command.Parameters["@p_EmployeesID"].Value = con.EmployeesId;
            command.Parameters.Add(new SqlParameter("@p_GarageNumber", SqlDbType.SmallInt));
            command.Parameters["@p_GarageNumber"].Value = con.GarageNumber;
            command.Parameters.Add(new SqlParameter("@p_Payment", SqlDbType.SmallInt));
            command.Parameters["@p_Payment"].Value = con.Payment;
        }
    }
}