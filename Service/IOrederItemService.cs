using Entities.Models;

namespace Services
{
    public interface IOrederItemService
    {
        Task AddOrderItems(OrderItem[] orderItems);
    }
}