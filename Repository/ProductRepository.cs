using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly Store214493777Context _store214493777Context;
        public ProductRepository()
        {
            _store214493777Context = new Store214493777Context();
        }

        public async Task<List<Product>> GetAllProducts()
        {
            return await _store214493777Context.Products.ToListAsync();
        }
    }
}
