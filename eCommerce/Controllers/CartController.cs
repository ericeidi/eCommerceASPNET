using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eCommerce.Models;
using eCommerce.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace eCommerce.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private ResponseObject ps;
        private readonly AppDbContext appDbContext;

        public CartController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        // GET: api/Cart
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            await HttpContext.Session.LoadAsync();
            var cartListString = HttpContext.Session.GetString("Cart");
            CartList cartList = cartListString != null ? JsonConvert.DeserializeObject<CartList>(cartListString) : new CartList();
            return StatusCode(200, cartList);
        }

        // POST: api/Cart/add
        [HttpPost("add")]
        public async Task<IActionResult> Add([FromBody] Item item)
        {
            ps = new ResponseObject();
            if(item.Quantities <= 0)
            {
                ps.Message = "Quantities must greater than 0.";
                return StatusCode(400, ps);
            }

            if(await checkProduct(item.ProductId))
            {
                ps.Message = "This product is not exist.";
                return StatusCode(400, ps);
            }

            await HttpContext.Session.LoadAsync();
            var cartListString = HttpContext.Session.GetString("Cart");
            CartList cartList = cartListString != null ? JsonConvert.DeserializeObject<CartList>(cartListString) : new CartList();
            cartList.Add(item);
            cartListString = JsonConvert.SerializeObject(cartList);
            HttpContext.Session.SetString("Cart", cartListString);
            await HttpContext.Session.CommitAsync();

            ps.Message = "A new product was added to cart successfully.";
            return StatusCode(200, ps);
        }

        // POST: api/Cart/checkout
        [HttpPost("checkout")]
        public async Task<IActionResult> Checkout([FromBody] Checkout checkout)
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");
            var cartListString = HttpContext.Session.GetString("Cart");
            if (cartListString != null)
            {
                CartList cartList = JsonConvert.DeserializeObject<CartList>(cartListString);
                Cart cart = new Cart();
                cart.UserId = userId;
                cart.Fullname = checkout.Fullname;
                cart.Phone = checkout.Phone;
                cart.Address = checkout.Address;
                cart.CreatedAt = DateTime.Now;
                cart.UpdateddAt = DateTime.Now;
                //check coupon
                int discount = 0;
                if (checkout.CouponCode != null)
                {
                    var coupon = await appDbContext.Coupons.FirstOrDefaultAsync(u => u.Code == checkout.CouponCode);
                    if (coupon != null)
                    {
                        discount = coupon.Value;
                        cart.CouponId = coupon.Id;
                    }
                    else
                    {
                        ps.Message = "This coupon code is not valid.";
                        return StatusCode(400, ps);
                    }
                }
                // save cart
                appDbContext.Carts.Add(cart);
                await appDbContext.SaveChangesAsync();

                var cartId = cart.Id;
                int total = 0;
                foreach(Item item in cartList.Items)
                {
                    Product product = await appDbContext.Products.FirstOrDefaultAsync(u => u.Id == item.ProductId);
                    CartItem cartItem = new CartItem();
                    cartItem.CartId = cartId;
                    cartItem.ProductId = product.Id;
                    cartItem.Quantities = item.Quantities;
                    cartItem.Price = product.Price;
                    cartItem.ShippingCost = product.ShippingCost;
                    cartItem.CreatedAt = DateTime.Now;
                    cartItem.UpdateddAt = DateTime.Now;
                    appDbContext.CartItems.Add(cartItem);
                    await appDbContext.SaveChangesAsync();

                    total += product.Price * item.Quantities + product.ShippingCost;
                }
                // update cart total
                cart.Total = total - discount;
                await appDbContext.SaveChangesAsync();
                // clear session
                HttpContext.Session.Remove("Cart");

                ps.Message = "Purchased successfully.";
                return StatusCode(200, ps);
            }
            else
            {
                ps.Message = "Cart is empty.";
                return StatusCode(400, ps);
            }
        }

        // PUT: api/Cart/update
        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] List<Item> items)
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var cartListString = HttpContext.Session.GetString("Cart");
            if (cartListString != null)
            {
                CartList cartList = JsonConvert.DeserializeObject<CartList>(cartListString);
                foreach(Item item in items)
                {
                    for(int i = 0; i < cartList.Count; i++)
                    {
                        if(item.ProductId == cartList[i].ProductId)
                        {
                            cartList[i].Quantities = item.Quantities;
                        }
                    }
                }
                cartListString = JsonConvert.SerializeObject(cartList);
                HttpContext.Session.SetString("Cart", cartListString);
                await HttpContext.Session.CommitAsync();

                ps.Message = "Cart was updated successfully.";
                return StatusCode(200, ps);
            }
            else
            {
                ps.Message = "Cart is empty.";
                return StatusCode(400, ps);
            }
        }

        // DELETE: api/Cart/remove/5
        [HttpDelete("remove/{id}")]
        public async Task<IActionResult> Remove(int id)
        {
            bool isRemoved = false;
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var cartListString = HttpContext.Session.GetString("Cart");
            if (cartListString != null)
            {
                CartList cartList = JsonConvert.DeserializeObject<CartList>(cartListString);
                for (int i = 0; i < cartList.Count; i++)
                {
                    if (cartList[i].ProductId == id)
                    {
                        cartList.Remove(cartList[i]);
                        isRemoved = true;
                    }
                }

                if(isRemoved)
                {
                    cartListString = JsonConvert.SerializeObject(cartList);
                    HttpContext.Session.SetString("Cart", cartListString);
                    await HttpContext.Session.CommitAsync();

                    ps.Message = "Product was removed from cart successfully.";
                    return StatusCode(200, ps);
                }
                else
                {
                    ps.Message = "Product does not exist in your cart.";
                    return StatusCode(400, ps);
                }
            }
            else
            {
                ps.Message = "Cart is empty.";
                return StatusCode(400, ps);
            }
        }

        [HttpDelete("clear")]
        public async Task<IActionResult> Clear(int id)
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var cartListString = HttpContext.Session.GetString("Cart");
            if (cartListString != null)
            {
                HttpContext.Session.Remove("Cart");
                ps.Message = "Cart was cleared successfully.";
                return StatusCode(200, ps);
            }
            else
            {
                ps.Message = "Cart is empty.";
                return StatusCode(400, ps);
            }
        }


        // GET: api/Cart/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Cart
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Cart/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        

        private async Task<bool> checkProduct(int id)
        {
            var product = await appDbContext.Products.FirstOrDefaultAsync(u => u.Id == id);
            return product == null;
        }

    }
}
