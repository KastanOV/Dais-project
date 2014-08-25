using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Linq
{
    public class InvoiceItemsTable
    {
        DataClassesDataContext db = new DataClassesDataContext();
        public List<ItemOfInvoice> GetItems(int ContractID)
        {
            

            var items = from i in db.Items
                        where i.Contract_id == ContractID
                        select i;
            var workItems = from i in db.WorkItems
                            where i.Contract_id == ContractID
                            select i;
            var consumables = from i in db.Consumables
                              where i.Contract_id == ContractID
                              select i;
            List<ItemOfInvoice> ReturnItems = new List<ItemOfInvoice>();

            foreach (var i in items)
            {
                ItemOfInvoice it = new ItemOfInvoice(i.Name, i.PricePerItem, i.COUNT);
                ReturnItems.Add(it);
            }
            foreach (var i in workItems)
            {
                ItemOfInvoice it = new ItemOfInvoice(i.Name, i.Price, i.COUNT);
                ReturnItems.Add(it);
            }
            foreach (var i in consumables)
            {
                ItemOfInvoice it = new ItemOfInvoice(i.Name, i.Price, i.Count);
                ReturnItems.Add(it);
            }
            return ReturnItems;
        }
        public int TotalPriceWitoutVat(int ContractID)
        {
            
            int Total = 0;
            var items = from i in db.Items
                        where i.Contract_id == ContractID
                        select new { i.PricePerItem, i.COUNT };
            
            var consumables = from i in db.Consumables
                              where i.Contract_id == ContractID
                              select new { i.Count, i.Price };
            var workItems = from i in db.WorkItems
                            where i.Contract_id == ContractID
                            select new { i.COUNT, i.Price };
            foreach (var i in items)
            {
                Total += (i.PricePerItem * i.COUNT);
            }
            foreach (var i in workItems)
            {
                Total += (i.COUNT * i.Price);
            }
            foreach (var i in consumables)
            {
                Total += (i.Price * i.Count);
            }
            return Total;
        }
        public int WorkItemsWithoutVat(int ContractID)
        {
            
            int Total = 0;
            var workItems = from i in db.WorkItems
                            where i.Contract_id == ContractID
                            select new { i.COUNT, i.Price };
            foreach (var i in workItems)
            {
                Total += (i.COUNT * i.Price);
            }
            return Total;
        }
        public int CunsumablesItemsWithouVat(int ContractID)
        {
            int Total = 0;
            var items = from i in db.Items
                        where i.Contract_id == ContractID
                        select new { i.PricePerItem, i.COUNT };

            var consumables = from i in db.Consumables
                              where i.Contract_id == ContractID
                              select new { i.Count, i.Price };
            foreach (var i in consumables)
            {
                Total += (i.Price * i.Count);
            }
            foreach (var i in items)
            {
                Total += (i.PricePerItem * i.COUNT);
            }
            return Total;
        }
    }
}