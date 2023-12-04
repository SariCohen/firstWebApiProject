using Entities.Models;
using Microsoft.EntityFrameworkCore;


namespace Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public CategoryRepository(Store214493777Context store214493777Context)
        {
            _store214493777Context = store214493777Context;
        }

        public async Task<List<Category>> GetAllCategories()
        {
            return await _store214493777Context.Categories.ToListAsync();
        }
    }
}
