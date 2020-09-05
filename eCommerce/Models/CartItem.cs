using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class CartItem
    {
        public int Id { get; set; }

        [ForeignKey("Cart")]
        public int CartId { get; set; }
        public Cart Cart { get; set; }

        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public int Quantities { get; set; }
        public int Price { get; set; }
        public int ShippingCost { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdateddAt { get; set; }
        public DateTime? DeletedAt { get; set; }
    }
}
