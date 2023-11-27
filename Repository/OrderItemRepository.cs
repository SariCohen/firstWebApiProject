using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class OrderItemRepository : IOrderItemRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public OrderItemRepository()
        {
            _store214493777Context = new Store214493777Context();
        }

        public async Task AddItems(OrderItem[] orderItems)
        {
            foreach (var item in orderItems)
            {
                await _store214493777Context.OrderItems.AddAsync(item);
                await _store214493777Context.SaveChangesAsync();
            }
            return;
        }
    }
}
