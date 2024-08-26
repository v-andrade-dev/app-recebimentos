using Microsoft.EntityFrameworkCore;
using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IPackagesService : IServiceBase<Packages>
    {
        public Task<List<Packages>> GetAllPackages();
        public new Task<Packages?> GetItemByID(int id);
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

        public new async Task<Packages?> GetItemByID(int id)
        {
            var packages = await GetAllPackages();

            return packages.Find(element => element.Id == id);
        }
    }
}
