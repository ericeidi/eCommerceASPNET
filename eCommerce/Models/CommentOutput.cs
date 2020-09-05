using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eCommerce.Models
{
    public class CommentOutput
    {
        [ForeignKey("User")]
        public User User { get; set; }
        public String UserFullName { get; set; }

        [ForeignKey("Product")]
        public Product Product { get; set; }
        public int Rating { get; set; }
        public string Image { get; set; }
        public string Content { get; set; }
        public DateTime? CreatedAt { get; set; }
    }
}
