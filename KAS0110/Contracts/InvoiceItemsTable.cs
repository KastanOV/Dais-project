using KAS0110.Models.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Contracts
{
    public class InvoiceItemsTable
    {
        private int ContractID;

        public InvoiceItemsTable(int Contract_Id)
        {
            ContractID = Contract_Id;
        }
        List<ItemOfInvoice> GetItems()
        {
            DataClassesDataContext db = new DataClassesDataContext();

            var items = from i in db.Items
                        where i.Contract_id == ContractID
                        select i;
            var WorkItems = from i in db.WorkItems
                            where i.Contract_id == ContractID
                            select i;
            var Consumables = from i in db.Consumables
                              where i.Contract_id == ContractID
                              select i;
            List<ItemOfInvoice> RetrunItems = new List<ItemOfInvoice>();

            foreach (var i in items)
            {
                ItemOfInvoice it = new ItemOfInvoice()
                {
                    
                };
            }

        }
        
    }
}