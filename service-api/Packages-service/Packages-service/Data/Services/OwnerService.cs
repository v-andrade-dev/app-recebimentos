using Microsoft.EntityFrameworkCore;
using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IOwnerService : IServiceBase<Owner>
    {
        public Task<List<Owner>> GetAllOwners();
    }

    public class OwnerService : ServiceBase<Owner>, IOwnerService
    {
        private readonly IOwnerRepo BaseRepo; 
        public OwnerService(IOwnerRepo repo) : base(repo) {
            BaseRepo = repo;
        }

        public async Task<List<Owner>> GetAllOwners()
        {
            return await BaseRepo.GetAll().Include(o => o.Residence).ToListAsync();
           
        } 
    }
}
