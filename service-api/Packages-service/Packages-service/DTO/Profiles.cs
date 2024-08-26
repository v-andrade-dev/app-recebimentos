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

            CreateMap<Residence, ResidenceReadDto>();
            CreateMap<Owner, OwnerReadDto>().ForMember(dest => dest.Residence, opt => opt.MapFrom(src => src.Residence));
            CreateMap<Packages, PackagesReadDto>().ForMember(dest => dest.Residence, opt => opt.MapFrom(src => src.Residence));

        }
    }
}
