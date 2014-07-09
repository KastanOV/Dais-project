using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Database
{
    public class Attendance
    {
        public int Id { get; set; }
        public DateTime Arrival { get; set; }
        public DateTime? Exit { get; set; }
        public decimal? Wage { get; set; }
        public bool? Paid { get; set; }
        public int EmployeeId { get; set; }

        public override string ToString()
        {
            return Arrival.ToString() + "  " + Wage;
        }
    }
}