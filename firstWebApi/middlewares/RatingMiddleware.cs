//using Entities.Models;
//using Services;

//namespace firstWebApi.middlewares
//{
//    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
//    public class RatingMiddleware
//    {
//        private readonly RequestDelegate _next;
//        private IRatingService _ratingService;

//        public RatingMiddleware(RequestDelegate next)
//        {
//            _next = next;
//        }

//        public async Task<Task> Invoke(HttpContext httpContext, IRatingService ratingService)
//        {
//            _ratingService = ratingService;
//            Rating rating = new Rating()
//            {               
//                Host = httpContext.Request.Host.ToString(),
//                Method = httpContext.Request.Method,
//                Path = httpContext.Request.Path,
//                Referer = httpContext.Request.Host + httpContext.Request.Protocol,
//                UserAgent = httpContext.Request.Headers["User-Agent"],
//                RecordDate = new DateTime()
//            };            
//            _ratingService.AddRating(rating);
//            return _next(httpContext);
//        }
//    }

//    // Extension method used to add the middleware to the HTTP request pipeline.
//    public static class RatingMiddlewareExtensions
//    {
//        public static IApplicationBuilder UseRatingMiddleware(this IApplicationBuilder builder)
//        {
//            return builder.UseMiddleware<RatingMiddleware>();
//        }
//    }
//}

using Entities.Models;
using Services;

namespace firstWebApi.middlewares
{
    public class RatingMiddleware
    {
        private IRatingService _ratingService;
        private readonly RequestDelegate _next;
        public RatingMiddleware(RequestDelegate next)
        {
            _next = next;
        }
        public async Task<Task> Invoke(HttpContext httpContext, IRatingService ratingService)
        {
            _ratingService = ratingService;
            Rating rating = new Rating();
            rating.Host = httpContext.Request.Host.ToString();
            rating.Method = httpContext.Request.Method;
            rating.Path = httpContext.Request.Path;
            rating.Referer = httpContext.Request.Host + httpContext.Request.Protocol;
            rating.UserAgent = httpContext.Request.Headers["User-Agent"];
            rating.RecordDate = DateTime.Now;
            await _ratingService.AddRating(rating);
            return _next(httpContext);
        }
    }
    public static class RatingMiddlewareExtentions
    {
        public static IApplicationBuilder UseRatingMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<RatingMiddleware>();
        }
    }
}

