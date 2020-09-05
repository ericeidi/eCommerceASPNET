using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class Coupon
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public int Value { get; set; }

        [DefaultValue(true)]
        public bool Status { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? DeletedAt { get; set; }
    }
}
