using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class AttendanceTable
    {
        string SQL_ARRIVAL = "exec AttendanceArrival @p_id";
        string SQL_EXIT = "exec AttendanceExit @p_id";
        //string SQL_CHECK = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is null;";
        string SQL_LIST = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and \"Exit\" is not null order by Arrival desc";
        //string SQL_LIST = "select * from EmployeeAttendance";
        string SQL_INFO = "select TOP 1 * from EmployeeAttendance where Employees_id = @p_EmployeeID order by id desc";
        string SQL_WAGE = "select sum(Wage) from EmployeeAttendance where Employees_id = @p_EmployeeID and Paid = 0";
        string SQL_WAGE_LIST = "select * from EmployeeAttendance where Employees_id = @p_EmployeeID and Paid = 0";
        string SQL_PAY_WAGE = "update EmployeeAttendance set paid  = 1 where Employees_id = @p_EmployeeID and \"Exit\" is not null";
        string SQL_TEST_GITHUB = "NAsrat";        
        
        string connectionString;

        public AttendanceTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public int Arrival(int id)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_ARRIVAL);
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int Exit(int id)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_EXIT);
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public decimal GetWage(int id)
        {
            decimal wage;
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_WAGE);

            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = id;

            SqlDataReader reader = db.Select(command);
            reader.Read();
            try
            {
                wage = reader.GetDecimal(0);
            }
            catch
            {
                wage = 0;
            }
            db.Close();
            return wage;
        }
        public bool payWage(int id)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_PAY_WAGE);

            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = id;

            bool ret;
            if (db.ExecuteNonQuery(command) < 0) ret = false;
            else ret = true;
            db.Close();
            return ret;

        }
        public Attendance EmployeeState(int id)
        {
            Attendance atd = new Attendance();
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INFO);

            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = id;

            SqlDataReader reader = db.Select(command);
            reader.Read();
            try
            {
                atd.Id = reader.GetInt32(0);
                atd.Arrival = reader.GetDateTime(1);
                atd.EmployeeId = reader.GetInt32(5);
                atd.Exit = reader.GetDateTime(2);
                atd.Wage = reader.GetDecimal(3);
                atd.Paid = reader.GetBoolean(4);
                
            }
            catch
            {
                if (atd.Id == 0)
                {
                    atd = null;
                }
                else
                {

                    atd.Exit = null;
                    atd.Wage = null;
                    atd.Paid = null;
                }
            }
            db.Close();
            return atd;
        }

        public List<Attendance> Select(int EmployeeID)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_LIST);
            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = EmployeeID;

            SqlDataReader reader = db.Select(command);

            List<Attendance> emp = Read(reader);
            reader.Close();
            db.Close();
            return emp;
        }
        public List<Attendance> SelectWages(int EmployeeID)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_WAGE_LIST);
            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = EmployeeID;

            SqlDataReader reader = db.Select(command);

            List<Attendance> emp = Read(reader);
            reader.Close();
            db.Close();
            return emp;
        }

        private List<Attendance> Read(SqlDataReader reader)
        {
            List<Attendance> ats = new List<Attendance>();

            while (reader.Read())
            {
                Attendance at = new Attendance();
                at.Id = reader.GetInt32(0);
                at.Arrival = reader.GetDateTime(1);
                at.EmployeeId = reader.GetInt32(5);
                try
                {
                    at.Exit = reader.GetDateTime(2);
                    at.Wage = reader.GetDecimal(3);
                    at.Paid = reader.GetBoolean(4);
                }
                catch
                {
                    at.Exit = null;
                    at.Wage = null;
                    at.Paid = null;
                }
                ats.Add(at);
            }
            return ats;
        }
        private void PrepareCommand(SqlCommand command, Attendance at)
        {
            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = at.Id;
            command.Parameters.Add(new SqlParameter("@p_EmployeeID", SqlDbType.Int));
            command.Parameters["@p_EmployeeID"].Value = at.EmployeeId;

        }
    }
}