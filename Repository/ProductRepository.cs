using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly Store214493777Context _store214493777Context;
        public ProductRepository()
        {
            _store214493777Context = new Store214493777Context();
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
