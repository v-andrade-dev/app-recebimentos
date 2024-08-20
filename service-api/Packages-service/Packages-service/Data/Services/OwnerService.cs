using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IOwnerService : IServiceBase<Owner>
    {

    }

    public class OwnerService : ServiceBase<Owner>, IOwnerService
    {
        public OwnerService(IOwnerRepo repo) : base(repo) { }
    }
}
