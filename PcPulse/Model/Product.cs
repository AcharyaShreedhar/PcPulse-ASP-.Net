using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PcPulse.Model

{
    public class Product
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public string ProductImage { get; set; }
        public int CategoryID { get; set; }
    }


}