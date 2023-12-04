using Entities.Models;
using Microsoft.EntityFrameworkCore;



namespace Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly Store214493777Context _store214493777Context;
        public ProductRepository(Store214493777Context store214493777Context)
        {
            _store214493777Context = store214493777Context;
        }

        public async Task<List<Product>> GetAllProducts(string? desc, int? minPrice, int? maxPrice, int?[] categoryIds)
        {
            var query = _store214493777Context.Products.Where(product =>
            (desc == null ? (true) : (product.ProdDescription.Contains(desc)))
            && ((minPrice == null) ? (true) : (product.Price >= minPrice))
            && ((maxPrice == null) ? (true) : (product.Price <= maxPrice))
            && ((categoryIds.Length == 0) ? (true) : (categoryIds.Contains(product.CategoryId))))
            .OrderBy(product => product.Price);

            Console.WriteLine(query.ToQueryString());
            List<Product> products = await query.ToListAsync();
            return products;
        }
        public async Task<List<Product>> GetAllProducts()
        {
            List<Product> products = await _store214493777Context.Products.ToListAsync();
            return products;
        }
    }
}
