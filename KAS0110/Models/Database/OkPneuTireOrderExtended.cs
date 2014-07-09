using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class OkPneuTireOrderExtended : OkPneuTire
    {
        public decimal OrderPrice { get; set; }
        public int count { get; set; }
    }
}