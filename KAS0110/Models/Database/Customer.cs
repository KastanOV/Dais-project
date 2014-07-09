using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class Customer
    {
        public int id { get; set; }
        public string email { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string phone { get; set; }
        public string adress { get; set; }
        public string city { get; set; }
        public int postaCode { get; set; }

        public override string ToString()
        {
            return lname;
        }
    }
}