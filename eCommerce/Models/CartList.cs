using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class CartList
    {
        private List<Item> items = null;
        public List<Item> Items
        {
            get => items; set => items = value;
        }

        public CartList()
        {
            items = new List<Item>();
        }

        public void Add(Item item)
        {
            items.Add(item);
        }

        public void Remove(Item item)
        {
            items.Remove(item);
        }

        public int Count
        {
            get => items.Count;
        }

        public Item this[int i]
        {
            get => items[i];
            set => items[i] = value;
        }
    }
}
