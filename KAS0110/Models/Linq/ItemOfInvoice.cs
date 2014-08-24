using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Models.Linq
{
    /// <summary>
    /// Tohle je na hovno udelame konstruktor ale az zitra ted jdu spat :)
    /// </summary>
    public class ItemOfInvoice
    {
        public string Name { get; private set; }
        public int ItemPrice { get; private set; }
        public int ItemsCount { get; private set; }
        public decimal ItemPriceWithVat { get; private set; }
        public decimal PriceAllItemsInRowWithVat { get; private set; }
        public int PriceAllItemsInRowWithoutVat { get; private set; }

        public ItemOfInvoice(string Name, int ItemPrice, int ItemsCount)
        {
            this.Name = Name;
            this.ItemPrice = ItemPrice;
            this.ItemPriceWithVat = (ItemPrice * (decimal)1.21);
            this.ItemsCount = ItemsCount;
            this.PriceAllItemsInRowWithVat = (ItemPriceWithVat * (decimal)ItemsCount);
            this.PriceAllItemsInRowWithoutVat = (ItemPrice * this.ItemsCount);
        }
    }
}