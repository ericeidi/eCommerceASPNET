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
    public class UserController : ControllerBase
    {
        private ResponseObject ps;
        private readonly AppDbContext appDbContext;

        public UserController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        
        // GET: api/User
        [HttpGet]
        public async Task<IActionResult> Get()
        {

            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");
            if(userId != null)
            {
                var user = await appDbContext.Users
                                         .Select(u => new User { Id = u.Id, Email = u.Email, Fullname = u.Fullname, Phone = u.Phone, Address = u.Address })
                                         .FirstOrDefaultAsync(u => u.Id == userId);
                return StatusCode(200, user);
            }
            else
            {
                ps = new ResponseObject();
                ps.Message = "Please login into your account.";
                return StatusCode(401, ps);
            }
        }

        // POST: api/User
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] User user)
        {
            ps = new ResponseObject();

            var existingUser = appDbContext.Users.AsNoTracking().FirstOrDefault(u => u.Email == user.Email);
            if (existingUser != null)
            {
                ps.Message = "Account with this email already exists.";
                return StatusCode(400, ps);
            }

            user.Password = PasswordHash.HashPassword(user.Password);
            user.CreatedAt = DateTime.Now;

            await appDbContext.Users.AddAsync(user);
            await appDbContext.SaveChangesAsync();

            ps.Message = "Account was created successfully.";

            return StatusCode(200, ps);
        }

        // PUT: api/User
        [HttpPut()]
        public async Task<IActionResult> Put([FromBody] User user)
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();

            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId is null)
            {
                ps.Message = "Please login into your account.";
                return StatusCode(401, ps);
            }

            var dbUser = await appDbContext.Users.FirstOrDefaultAsync(u => u.Id == userId);
            dbUser.Email = user.Email ?? dbUser.Email;
            dbUser.Fullname = user.Fullname ?? dbUser.Fullname;
            dbUser.Phone = user.Phone ?? dbUser.Phone;
            dbUser.Address = user.Address ?? dbUser.Address;
            dbUser.UpdatedAt = DateTime.Now;

            await appDbContext.SaveChangesAsync();

            ps.Message = "Account was updated successfully.";
            return StatusCode(200, ps);
        }

        // PUT: api/User/change-password
        [HttpPut("change-password")]
        public async Task<IActionResult> Put([FromBody] ChangePassword obj)
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId != null)
            {
                if(obj.Password != null && obj.PasswordConfirmation != null)
                {
                    var user = await appDbContext.Users.FirstOrDefaultAsync(u => u.Id == userId);
                    if (obj.Password == obj.PasswordConfirmation)
                    {
                        user.Password = PasswordHash.HashPassword(obj.Password);
                        await appDbContext.SaveChangesAsync();

                        ps.Message = "Password was changed successfully.";
                        return StatusCode(200, ps);
                    }
                    else
                    {
                        ps.Message = "Password confirmation doesn\'t match Password.";
                        return StatusCode(400, ps);
                    }
                }
                else
                {
                    ps.Message = "Missing parameters.";
                    return StatusCode(400, ps);
                }
            }
            else
            {
                ps.Message = "Please login into your account.";
                return StatusCode(401, ps);
            }
        }
    }
}
