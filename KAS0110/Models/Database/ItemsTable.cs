using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KAS0110.Models.Linq;

namespace KAS0110.Models.Database
{
    public class ItemsTable
    {
        DataClassesDataContext db;
        public ItemsTable()
        {
            db = new DataClassesDataContext();
        }
        
    }
}