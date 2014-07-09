using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace KAS0110.Models.Database
{
    public class EmployeeTable
    {
        string SQL_INSERT = "insert into Employees Values(@p_login, @p_fname,@p_lname, @p_password, @p_phone, @p_adress, @p_city, @p_experiance);";
        string SQL_UPDATE = "update Employees set login = @p_login, Fname = @p_fname, Lname = @p_lname, Password =@p_password, Phone = @p_phone, Adress = @p_adress, City = @p_city, Experience = @p_experiance  where @p_id = id ";
        string SQL_SELECT = "select * from Employees order by lname";
        string SQL_SELECT_BY_ID = "select * from Employees where id = @p_id";
        string SQL_FIND_PASSWORD_BY_ID = "select password from Employees where id = @p_id";
        string SQL_SELECT_IS_IN_WORK = "select distinct Employees.id, Lname from Employees  join EmployeeAttendance on Employees.id = Employees_id where \"Exit\" is null order by lname";
        string SQL_WAGE_DETAIL = "exec EmployeeDetail @p_id, @v_wage Output, @v_Worktime Output";
        string connectionString;

        public EmployeeTable()
        {
            this.connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public EmployeeDetail GetWageDetail(int id)
        {
            EmployeeDetail ed = new EmployeeDetail();
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand cmd = db.CreateCommand(SQL_WAGE_DETAIL);

            SqlParameter parm = new SqlParameter("@p_id", SqlDbType.Int);
            parm.Value = id;
            parm.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(parm);

            SqlParameter parm2 = new SqlParameter("@v_wage", SqlDbType.Money);
            parm2.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parm2);

            SqlParameter parm3 = new SqlParameter("@v_Worktime", SqlDbType.Float);
            parm3.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parm3);

            cmd.ExecuteNonQuery();
            db.Close();
            string tmp = cmd.Parameters["@v_wage"].Value.ToString();
            cmd.Parameters["@v_Worktime"].Value.ToString();


            return ed;
        }
        public int Insert(Employee emp)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            PrepareCommand(command, emp);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public int Update(Employee emp)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            PrepareCommand(command, emp);
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
        public List<Employee> SelectEmployeesInWork()
        {
            
            List<Employee> empList = new List<Employee>();
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_IS_IN_WORK);
            SqlDataReader reader = db.Select(command);
            try
            {
                
                while (reader.Read())
                {
                    Employee emp = new Employee();
                    emp.id = reader.GetInt32(0);
                    emp.lname = reader.GetString(1);

                    empList.Add(emp);
                }
            }
            catch
            {
                empList = null;
            }
            reader.Close();
            return empList;
        }
        public Employee Select(int id)
        {
            Employee emp = new Employee();
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_BY_ID);

            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = id;
            try
            {
                SqlDataReader reader = db.Select(command);
                reader.Read();
                emp.id = reader.GetInt32(0);
                emp.login = reader.GetString(1);
                emp.fname = reader.GetString(2);
                emp.lname = reader.GetString(3);
                emp.password = reader.GetString(4);
                emp.phone = reader.GetString(5);
                emp.adress = reader.GetString(6);
                emp.city = reader.GetString(7);
                emp.experience = reader.GetByte(8);
            }
            catch
            {
                emp = null;
            }

            return emp;
        }
        public bool CheckPasword(int EmployeeID, string password)
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_FIND_PASSWORD_BY_ID);

            command.Parameters.Add(new SqlParameter("@p_id", SqlDbType.Int));
            command.Parameters["@p_id"].Value = EmployeeID;

            SqlDataReader reader = db.Select(command);
            reader.Read();
            string dbpassword = reader.GetString(0);
            int result = String.Compare(dbpassword, password);
            if (String.Compare(dbpassword, password) == 0) return true;
            else return false;
        }
        public List<Employee> Select()
        {
            SchoolDatabase db = new SchoolDatabase();
            db.Connect();

            SqlCommand command = db.CreateCommand(SQL_SELECT);


            SqlDataReader reader = db.Select(command);

            List<Employee> emp = Read(reader);
            reader.Close();
            db.Close();
            return emp;
        }

        private List<Employee> Read(SqlDataReader reader)
        {
            List<Employee> emps = new List<Employee>();

            while (reader.Read())
            {
                Employee emp = new Employee();
                emp.id = reader.GetInt32(0);
                emp.login = reader.GetString(1);
                emp.fname = reader.GetString(2);
                emp.lname = reader.GetString(3);
                emp.password = reader.GetString(4);
                emp.phone = reader.GetString(5);
                emp.adress = reader.GetString(6);
                emp.city = reader.GetString(7);
                emp.experience = reader.GetByte(8);


                emps.Add(emp);
            }
            return emps;
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
    }
}