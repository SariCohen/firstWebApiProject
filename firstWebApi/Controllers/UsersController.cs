using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Session;
using Service;
using System.Text.Json;
using Zxcvbn;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Login.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    { 
        private readonly IUserService _userService;
        public UsersController(IUserService userService)
        {
            _userService = userService;
        }
        // GET: api/<UsersController>
        [HttpGet]
        public ActionResult<User> Get([FromQuery] string userName, [FromQuery] string password)
        {
            User user = _userService.GetUserByEmailAndPassword(userName, password);
            if(user == null)
                return NoContent();
            return Ok(user);
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public ActionResult<User> Get(int id)
        {
            User user = _userService.GetUserById(id);
            if (user == null)
                return NoContent();
            return Ok(user);
        }

        // POST api/<UsersController>
        [HttpPost]
        public ActionResult<User> Post([FromBody] User user)
        {
            User newUser = _userService.AddUser(user);
            return CreatedAtAction(nameof(Get), new { id = newUser.Id }, newUser);
        }
        [Route("Pwd")]
        [HttpPost]
        public ActionResult<int> Post([FromBody] string password)
        {
            int result = _userService.CheckPwd(password);
            if (result <= 2)
                return BadRequest(result);
            return Ok(result);
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public ActionResult<User> Put(int id, [FromBody] User upUser)
        {
            User user = _userService.UpdateUser(id, upUser);
            if(user == null)
                return NoContent();
            return Ok();
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
