using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class Employee
    {
        public int id { get; set; }
        public string login { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string password { get; set; }
        public string phone { get; set; }
        public string adress { get; set; }
        public string city { get; set; }
        public byte experience { get; set; }

        public override string ToString()
        {
            return lname;
        }
    }
}