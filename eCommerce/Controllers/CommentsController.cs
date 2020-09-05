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
    public class CommentsController : ControllerBase
    {

        private ResponseObject ps;
        private readonly AppDbContext appDbContext;

        public CommentsController(AppDbContext appDbContext) => this.appDbContext = appDbContext;

        // GET: api/Comments
        [HttpGet]
        public async Task<IEnumerable<CommentOutput>> Get()
        {
            var result = (from c in appDbContext.Comments
                          where c.DeletedAt == null
                          select new CommentOutput {
                           Rating = c.Rating,
                           Content = c.Content,
                           CreatedAt = c.CreatedAt,
                           Image = c.Image,
                           UserFullName = c.User.Fullname
                          }).ToListAsync();

            return await result;
        }

        // GET: api/Comments/5
        [HttpGet("{id}")]
        public async Task<IEnumerable<CommentOutput>> GetCommentsById(int id)
        {

            var result = (from c in appDbContext.Comments
                          where c.DeletedAt == null && c.ProductId == id
                          select new CommentOutput
                          {
                              Rating = c.Rating,
                              Content = c.Content,
                              CreatedAt = c.CreatedAt,
                              Image = c.Image,
                              UserFullName = c.User.Fullname
                          }).ToListAsync();

            return await result;
        }

        // POST: api/Comments
        [HttpPost()]
        public async Task<IActionResult> Post([FromBody] Comment newComment)
        {
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId != null)
            {
                newComment.UserId = (int) userId;
                newComment.CreatedAt = DateTime.Now;
                newComment.UpdatedAt = DateTime.Now;
                appDbContext.Comments.Add(newComment);
                await appDbContext.SaveChangesAsync();
                return StatusCode(200, newComment);
            }
            else
            {
                ps = new ResponseObject();
                ps.Message = "Please login into your account to comment.";
                return StatusCode(401, ps);
            }
        }

        // DELETE: api/Comments/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await HttpContext.Session.LoadAsync();
            var userId = HttpContext.Session.GetInt32("UserId");

            var comment = await appDbContext.Comments.FromSqlRaw("SELECT * FROM Comments WHERE Id = {0}", id).FirstOrDefaultAsync();

            if (userId != null)
            {
                if (comment.UserId == userId)
                {
                    comment.DeletedAt = DateTime.Now;
                    await appDbContext.SaveChangesAsync();
                    ps = new ResponseObject();
                    ps.Message = "Comment deleted";
                    return StatusCode(200, ps);
                }
                else
                {
                    ps = new ResponseObject();
                    ps.Message = "You cant delete a comment that is not yours";
                    return StatusCode(401, ps);
                }
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
