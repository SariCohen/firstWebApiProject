using Entities.Models;
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
        public async Task<ActionResult<User>> Get([FromQuery] string userName, [FromQuery] string password)
        {
            User user = await _userService.GetUserByEmailAndPassword(userName, password);
            if(user == null)
                return NoContent();
            return Ok(user);
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> Get(int id)
        {
            User user = await _userService.GetUserById(id);
            if (user == null)
                return NoContent();
            return Ok(user);
        }

        // POST api/<UsersController>
        [HttpPost]
        public async Task<ActionResult<User>> Post([FromBody] User user)
        {
            try
            {
                User newUser = await _userService.AddUser(user);
                return CreatedAtAction(nameof(Get), new { id = newUser.Id }, newUser);
                //Check: if newUser==null return BadRequest()
            }
            catch (Exception ex)
            {
                //error code 400 (BadRequest) is not suitable for server exceptions; use the 500 error code for internal server Error. 
                //return Status code 500 or throw an exception. 
                return BadRequest(ex.Message);
            }
        }
        [Route("Pwd")]
        [HttpPost]
        public async Task<ActionResult<int>> Post([FromBody] string password)
        {
            int result = await _userService.CheckPwd(password);
            if (result <= 2)
                return BadRequest(result);
            return Ok(result);
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<User>> Put(int id, [FromBody] User upUser)
            //clean code-UserToUpdate
        {
            //clean code- updatedUser
            User user = await _userService.UpdateUser(id, upUser);
            if(user == null)
                return NoContent();
            //Update should return the updated user. OK(user)
            return Ok();
        }

        //Clean code -Remove unnecessary lines of code.
        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
