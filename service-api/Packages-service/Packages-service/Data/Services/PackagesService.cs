using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IPackagesService : IServiceBase<Packages>
    {

    }

    public class PackagesService : ServiceBase<Packages>, IPackagesService
    {
        public PackagesService(IPackagesRepo repo) : base(repo) { }
    }
}
