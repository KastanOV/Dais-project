using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class StoredWheels
    {
        public int id { get; set; }
        public string Tiremanufacturer { get; set; }
        public string DiscDescription{ get; set; }
        public string TireDecription { get; set; }
        public DateTime StoreDate { get; set; }
        public int Customers_id { get; set; }
        public int Employees_id_Store { get; set; }
        public string EmpStoreFname {get; set;}
        public string EmpStoreLname {get; set;}
        public string EmpUnStoreFname {get; set;}
        public string EmpUnStoreLname {get; set;}
        public DateTime? UnstoreDate { get; set; }
        public int? Employees_id_Unstore { get; set; }

        //StoredWheelsDescription.id, 
        //StoredWheelsDescription.Customers_id, 
        //Tiremanufacturer,
        //DiscDescription,
        //StoreDate, 
        //emp1.lname, 
        //emp1.fname, 
        //UnstoreDate, 
        //emp2.lname, 
        //emp2.fname,
        //Employees_id_Unstore
    }
}