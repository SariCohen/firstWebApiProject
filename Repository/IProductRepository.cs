using DTO;
using Entities.Models;

namespace Repositories
{
    public interface IProductRepository
    {
        Task<List<ProductDTO>> GetAllProducts(string? desc, int? minPrice, int? maxPrice, int?[] categoryIds);
        Task<List<Product>> GetAllProducts();
    }
}