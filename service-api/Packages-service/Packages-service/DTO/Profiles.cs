using AutoMapper;
using Packages_service.Models;

namespace Packages_service.DTO
{
    public class Profiles : Profile
    {
        public Profiles()
        {
            CreateMap<ResidenceCreateDto, Residence>();
            CreateMap<OwnerCreateDto, Owner>();
            CreateMap<PackagesCreateDto, Packages>();
        }
    }
}
