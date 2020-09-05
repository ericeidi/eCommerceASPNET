using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eCommerce.Models;
using eCommerce.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace eCommerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {

     
        private readonly AppDbContext appDbContext;

        public ProductsController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        // GET: api/Pruducts
        [HttpGet]
       public async Task<IEnumerable<Product>> Get()
        {
              HttpContext.Session.SetInt32("UserId", 2);


            var result = (from p in appDbContext.Products
                         
                          select new Product {
                            Id = p.Id,
                            Name = p.Name,
                            Description = p.Description,
                            Price = p.Price,
                            ShippingCost = p.ShippingCost,
                            Image = p.Image,
                            CreatedAt = p.CreatedAt,
                            UpdatedAt = p.UpdatedAt,
                            DeletedAt = p.DeletedAt
                          }).ToListAsync();

            return await result;
        }

    // GET: api/Comments/5
         [HttpGet("{id}")]
       public async Task<Product> GetProductById(int id)
        {
            var product = await appDbContext.Products
                                            .Select(p => new Product { Id = p.Id, Name = p.Name, Description = p.Description, Price = p.Price, ShippingCost = p.ShippingCost })
                                            .FirstOrDefaultAsync(u => u.Id == id);
            return product;
        }


        // POST: api/Products
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Products/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
