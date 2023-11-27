using Entities.Models;

namespace Repositories
{
    public interface IOrderItemRepository
    {
        Task AddItems(OrderItem[] orderItems);
    }
}