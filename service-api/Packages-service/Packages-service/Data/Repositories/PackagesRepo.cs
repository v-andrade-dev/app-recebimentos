using Packages_service.Data.DbConfig;
using Packages_service.Models;

namespace Packages_service.Data.Repositories
{
    public interface IPackagesRepo : IRepoBase<Packages>
    {

    }

    public class PackagesRepo : RepoBase<Packages>, IPackagesRepo
    {
        public PackagesRepo(AppDbContext context) : base(context) { }
    }
}
