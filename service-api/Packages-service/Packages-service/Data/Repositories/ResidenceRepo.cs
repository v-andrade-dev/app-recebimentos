using Packages_service.Data.DbConfig;
using Packages_service.Models;

namespace Packages_service.Data.Repositories
{
    public interface IResidenceRepo : IRepoBase<Residence>
    {

    }

    public class ResidenceRepo : RepoBase<Residence>, IResidenceRepo
    {
        public ResidenceRepo(AppDbContext context) : base(context) { }
    }
}
