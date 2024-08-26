using Microsoft.EntityFrameworkCore;
using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IResidenceService : IServiceBase<Residence> 
    {
        public Task<List<Residence>> GetAllResidences();
    }

    public class ResidenceService : ServiceBase<Residence>, IResidenceService
    {
        private readonly IResidenceRepo BaseRepo;

        public ResidenceService(IResidenceRepo repo) : base(repo) 
        {
            BaseRepo = repo;
        }

        public async Task<List<Residence>> GetAllResidences()
        {
            return await BaseRepo.GetAll().ToListAsync();
        }
    }
}
