using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontV3.UI.MVC.Models;

namespace StoreFrontV3.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            //pull session-based cart info into a local variable that we can pass to the view
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            //Does the shoppingCart exist and contain items?
            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //The user either hasn't put anything in the cart, or removed all, or the session expired
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                //Create mesage about empty cart
                ViewBag.Message = "There are no items in your cart";
            }
            else
            {
                ViewBag.Message = null; //explicitly clear out the variable
            }


            return View(shoppingCart);
        }

        public ActionResult UpdateCart(int guitarID, int qty)
        {
            //get the cart from session and place its value in a local shoppingCart variable.
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //target the correct cartItem bookID for key - then change the Qty property with the qty parameter
            shoppingCart[guitarID].Qty = qty;

            //return the local cart to the session and redirect the user back to the shoppingCart to see their changes
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int id)
        {
            //get the cart from session and place it in a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //remove the item from the local cart
            shoppingCart.Remove(id);

            //Update the session
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }
    }
}