using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class Cart
    {
        public int Id { get; set; }

        [ForeignKey("User")]
        public int? UserId { get; set; }
        public User User { get; set; }

        [ForeignKey("Coupon")]
        public int? CouponId { get; set; }
        public Coupon Coupon { get; set; }
        public int Total { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int Status { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdateddAt { get; set; }
        public DateTime? DeletedAt { get; set; }
    }
}
