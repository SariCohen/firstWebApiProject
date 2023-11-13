using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Service;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace firstWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        IProductService _productService;

        public ProductsController(IProductService productService)
        {
            _productService = productService;
        }

        // GET: api/<ProductsController>
        [HttpGet]
        public async Task<ActionResult<List<Product>>> GetAllProducts(string? desc, int? minPrice, int? maxPrice, [FromQuery] int?[] categoryIds)
        {
            List<Product> lp = await _productService.GetAllProducts(desc, minPrice, maxPrice, categoryIds);
            if(lp == null)
            {
                return NoContent();
            }
            return Ok(lp);
        }

    }
}
