using Entities.Models;

namespace Services
{
    public interface IRatingService
    {
        Rating AddRating(Rating rating);
    }
}