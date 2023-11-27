using AutoMapper;
using DTO;
using Entities.Models;


namespace firstWebApi
{
    public class Mapper : Profile
    {
        public Mapper()
        { 
            CreateMap<Order, OrderDTO>().ReverseMap();
            CreateMap<Category, CategoryDTO>().ReverseMap();
            CreateMap<Product, ProductDTO>().ReverseMap();


        }
    }
}
