using Packages_service.Data.DbConfig;
using Packages_service.Models;

namespace Packages_service.Data.Repositories
{
    public interface IOwnerRepo : IRepoBase<Owner>
    {

    }

    public class OwnerRepo : RepoBase<Owner>, IOwnerRepo
    {
        public OwnerRepo (AppDbContext context) :base (context) 
        { 
        }
    }
}
