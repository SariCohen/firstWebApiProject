using Entities.Models;

namespace Repositories
{
    public interface IRatingRepository
    {
        Rating AddRating(Rating rating);
    }
}