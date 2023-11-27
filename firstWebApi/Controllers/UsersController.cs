using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Session;
using Services;
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

        [HttpGet]
        public async Task<ActionResult<User>> Get([FromQuery] string userName, [FromQuery] string password)
        {
            User user = await _userService.GetUserByEmailAndPassword(userName, password);
            if(user == null)
                return NoContent();
            return Ok(user);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<User>> Get(int id)
        {
            User user = await _userService.GetUserById(id);
            if (user == null)
                return NoContent();
            return Ok(user);
        }

        [HttpPost]
        public async Task<ActionResult<User>> Post([FromBody] User user)
        {
            try
            {
                User newUser = await _userService.AddUser(user);
                if (newUser == null)
                    return BadRequest();
                return CreatedAtAction(nameof(Get), new { id = newUser.Id }, newUser);
            }
            catch (Exception ex)
            {
                return StatusCode(500);// BadRequest(ex.Message);
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

        [HttpPut("{id}")]
        public async Task<ActionResult<User>> Put(int id, [FromBody] User UserToUpdate)
        {
            User updatedUser = await _userService.UpdateUser(id, UserToUpdate);
            if(updatedUser == null)
                return NoContent();
            return Ok(updatedUser);
        }


    }
}
