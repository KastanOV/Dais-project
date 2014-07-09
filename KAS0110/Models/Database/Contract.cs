using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class Contract
    {
        
        public int CustomerId { get; set; }
        public int EmployeesId { get; set; }
        public DateTime Arrival { get; set; }
        public byte GarageNumber { get; set; }
        public DateTime? Exit { get; set; }
        public int? Payment { get; set; }
        public bool? VAT { get; set; }
    }
}