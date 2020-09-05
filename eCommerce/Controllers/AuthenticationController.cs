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
    public class AuthenticationController : ControllerBase
    {
        private ResponseObject ps;
        private readonly AppDbContext appDbContext;

        public AuthenticationController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        // POST: api/Authentication/login
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] User user)
        {
            ps = new ResponseObject();

            if(user.Email != null && user.Password != null)
            {
                var userData = await appDbContext.Users.FirstOrDefaultAsync(u => u.Email == user.Email);
                if (userData != null)
                {
                    if (PasswordHash.VerifyHashedPassword(userData.Password, user.Password))
                    {
                        //save the user's ID to the session
                        await HttpContext.Session.LoadAsync();
                        HttpContext.Session.SetInt32("UserId", userData.Id);
                        await HttpContext.Session.CommitAsync();

                        ps.IsLoggedIn = true;
                        ps.Message = "Login successfuly.";
                        return StatusCode(200, ps);
                    }
                    else
                    {
                        ps.IsLoggedIn = false;
                        ps.Message = "Wrong password.";
                        return StatusCode(401, ps);
                    }
                }
                else
                {
                    ps.IsLoggedIn = false;
                    ps.Message = "Account does not exist.";
                    return StatusCode(401, ps);
                }
            }
            else
            {
                ps.IsLoggedIn = false;
                ps.Message = "Please input email and password.";
                return StatusCode(401, ps);
            }
        }

        // GET: api/Authentication
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");
            var statusCode = (userId ?? 0) > 0 ? 200 : 401;
            ps.IsLoggedIn = (userId ?? 0) > 0 ? true : false;
            return StatusCode(statusCode, ps);
        }

        // DELETE: api/ApiWithActions/logout
        [HttpDelete("logout")]
        public async Task<IActionResult> Delete()
        {
            ps = new ResponseObject();
            await HttpContext.Session.LoadAsync();
            HttpContext.Session.Remove("UserId");
            ps.IsLoggedIn = false;
            return StatusCode(200, ps);
        }
    }
}
