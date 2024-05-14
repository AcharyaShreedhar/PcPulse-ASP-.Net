using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PcPulse.Model
{
    public class CartItemList : IEnumerable<CartItem>
    {
        private List<CartItem> cartItems;

        public CartItemList()
        {
            cartItems = new List<CartItem>();
        }

        public IEnumerator<CartItem> GetEnumerator()
        {
            return cartItems.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return cartItems.GetEnumerator();
        }

        public int Count => cartItems.Count;

        public CartItem this[int index] => cartItems[index];

        public CartItem this[string id] => cartItems.FirstOrDefault(c => c.Product.ProductID.ToString() == id);

        public static CartItemList GetCart()
        {
            CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];

            if (cart == null)
            {
                cart = new CartItemList();
                HttpContext.Current.Session["Cart"] = cart;
            }

            return cart;
        }

        public void AddItem(Product product, int quantity)
        {
            CartItem existingCartItem = this[product.ProductID.ToString()];

            if (existingCartItem != null)
            {
                existingCartItem.AddQuantity(quantity);
            }
            else
            {
                CartItem newItem = new CartItem(product, quantity);
                cartItems.Add(newItem);
            }
        }

        public void RemoveAt(int index)
        {
            cartItems.RemoveAt(index);
        }

        public void Clear()
        {
            cartItems.Clear();
        }
        public void RemoveItem(string productId)
        {
            CartItem itemToRemove = cartItems.FirstOrDefault(item => item.Product.ProductID.ToString() == productId);

            if (itemToRemove != null)
            {
                cartItems.Remove(itemToRemove);
            }
        }
    }
}
