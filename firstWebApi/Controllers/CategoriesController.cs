using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace firstWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        ICategoryService _categoryService;

        public CategoriesController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        
        [HttpGet]
        public async Task<ActionResult<List<Category>>> Get()
        {
            List<Category> lc = await _categoryService.GetAllCategories(); 
            if(lc == null)
            {
                return NoContent();
            }
            return Ok(lc);
        }

        [HttpGet("{id}")]
        public string GetCategoryById(int id)
        {
            return "value";
        }

    }
}
