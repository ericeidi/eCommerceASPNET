using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eCommerce.Models;
using eCommerce.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eCommerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HistoryController : Controller
    {
        private ResponseObject ps;
        private readonly AppDbContext appDbContext;

        public HistoryController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        // GET: api/History
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");

            if (userId != null)
            {
                var result = (from c in appDbContext.CartItems
                              where c.Cart.Status == 3 && c.Cart.UserId == userId
                              select new HistoryOutput
                              {
                                  CartId = c.CartId,
                                  ProductId = c.Product.Id,
                                  ProductName = c.Product.Name,
                                  Quantities = c.Quantities,
                                  Price = c.Product.Price,
                                  UpdateddAt = c.Cart.UpdateddAt
                              }).ToList();

                return StatusCode(200, result);
            }
            else
            {
                ps = new ResponseObject();
                ps.Message = "Please login into your account.";
                return StatusCode(401, ps);
            }
        }
    }
}
