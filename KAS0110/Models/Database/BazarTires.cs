using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class BazarTires
    {
        public int id { get; set; }
        public string Manufacturer { get; set; }
        public int Size { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public int Customers_id { get; set; }
    }
}