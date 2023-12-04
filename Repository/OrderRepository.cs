using Entities.Models;


namespace Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public OrderRepository(Store214493777Context store214493777Context)
        {
            _store214493777Context = store214493777Context;
        }

        public async Task<Order> AddOrder(Order order)
        {
            await _store214493777Context.Orders.AddAsync(order);
            await _store214493777Context.SaveChangesAsync();
            return order;
        }
    }
}
