using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class OrderExteneded : Order
    {
        public string Customer_LastName { get; set; }
        public string Customer_Phone { get; set; }
        public string Customer_email { get; set; }
        public string Employee_Login { get; set; }
        public string Employee_Lname { get; set; }
    }
}