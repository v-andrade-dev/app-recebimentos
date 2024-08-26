using Microsoft.EntityFrameworkCore;
using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IOwnerService : IServiceBase<Owner>
    {
        public Task<List<Owner>> GetAllOwners();
        public new Task<Owner?> GetItemByID(int id);
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
        
        public new async Task<Owner?> GetItemByID(int id)
        {
            var owners = await GetAllOwners();

            return owners.Find(o => o.Id == id);
        }
    }
}
