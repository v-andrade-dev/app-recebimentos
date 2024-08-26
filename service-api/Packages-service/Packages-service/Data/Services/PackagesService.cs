using Microsoft.EntityFrameworkCore;
using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IPackagesService : IServiceBase<Packages>
    {
        public Task<List<Packages>> GetAllPackages();
    }

    public class PackagesService : ServiceBase<Packages>, IPackagesService
    {
        private readonly IPackagesRepo BaseRepo;

        public PackagesService(IPackagesRepo repo) : base(repo) 
        {
            BaseRepo = repo;
        }

        public async Task<List<Packages>> GetAllPackages()
        {
            return await BaseRepo.GetAll().Include(ds => ds.Residence).ToListAsync();
        }

    }
}
