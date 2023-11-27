using Entities.Models;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class OrederItemService : IOrederItemService
    {
        private readonly IOrderItemRepository _orderItemRepository;

        public OrederItemService(IOrderItemRepository orderItemRepository)
        {
            _orderItemRepository = orderItemRepository;
        }
        public async Task AddOrderItems(OrderItem[] orderItems)
        {
            await _orderItemRepository.AddItems(orderItems);
            return;
        }
    }
}
