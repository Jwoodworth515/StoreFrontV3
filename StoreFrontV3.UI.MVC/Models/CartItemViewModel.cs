using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFrontV3.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontV3.UI.MVC.Models
{
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)] //ensures the values in the cart are greater than 0
        public int Qty { get; set; }

        public Guitar Product { get; set; }

        //Fully Qualified Constructor (fqctor)
        public CartItemViewModel(int qty, Guitar product)
        {
            //Property = parameter
            Qty = qty;
            Product = product;
        }
    }
}