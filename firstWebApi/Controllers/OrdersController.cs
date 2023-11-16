﻿using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace firstWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        IOrderService _orderService;

        public OrdersController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        //Clean code -Remove unnecessary lines of code.
        // GET api/<OrdersController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<OrdersController>
        [HttpPost]
        public async Task<ActionResult<Order>> Post([FromBody] Order order)
        {
            //clean code newOrder instead of newOrderdr
            Order newOrderdr = await _orderService.AddOrder(order);
             return CreatedAtAction(nameof(Get), new { id = newOrderdr.Id }, newOrderdr);
        }

    }
}
