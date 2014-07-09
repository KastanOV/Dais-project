using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class Order
    {
        public int id { get; set; }
        public int Customers_id { get; set; }
        public int Employees_id { get; set; }
        public DateTime date { get; set; }
        public char Status { get; set; }
    }
}