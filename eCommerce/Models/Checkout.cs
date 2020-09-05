using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class Checkout
    {
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string CouponCode { get; set; }
    }
}
