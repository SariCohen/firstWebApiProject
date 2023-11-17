using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public CategoryRepository()
        {
            _store214493777Context = new Store214493777Context();
        }

        public async Task<List<Category>> GetAllCategories()
        {
            return await _store214493777Context.Categories.ToListAsync();
        }
    }
}
