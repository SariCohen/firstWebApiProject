using AutoMapper;
using DTO;
using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace firstWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderItemController : ControllerBase
    {
        private readonly IOrederItemService _orederItemService;
        private readonly IMapper _mapper;

        public OrderItemController(IOrederItemService orederItemService, IMapper mapper)
        {
            _orederItemService = orederItemService;
            _mapper = mapper;
        }
        [HttpPost]
        public async Task<ActionResult<OrderItem>> Post([FromBody] OrderItem[] orderItems)
        {
            _orederItemService.AddOrderItems(orderItems);
                return Ok();
        }

    }
}
