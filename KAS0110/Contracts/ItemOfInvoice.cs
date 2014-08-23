using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAS0110.Contracts
{
    /// <summary>
    /// Tohle je na hovno udelame konstruktor ale az zitra ted jdu spat :)
    /// </summary>
    public class ItemOfInvoice
    {
        private decimal _ItemPriceWithVat;
        private decimal _PriceAllItemsInRowWithVat;
        int _ItemsCount; 
        private int _ItemPrice;

        public string Name { get; set; }
        public int ItemPrice 
        {
            get
            {
                return _ItemPrice;
            }
            set
            {
                _ItemPrice = value;
                _ItemPriceWithVat = (value * (decimal)1.21);
            }
        }
        public int ItemsCount 
        {
            get
            {
                return _ItemsCount; 
            }
            set
            {

            } 
        }
        public decimal ItemPriceWithVat
        {
            get 
            {
                return _ItemPriceWithVat;
            }
        }
        public decimal PriceAllItemsInRowWithVat
        {
            get
            {
                return _PriceAllItemsInRowWithVat;
            }
            set
            {
                _PriceAllItemsInRowWithVat = (value * (decimal)ItemsCount);
            }
        }

    }
}