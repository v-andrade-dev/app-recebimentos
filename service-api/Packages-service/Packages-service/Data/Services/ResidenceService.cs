using Packages_service.Data.Repositories;
using Packages_service.Models;

namespace Packages_service.Data.Services
{
    public interface IResidenceService : IServiceBase<Residence> 
    {
    
    }

    public class ResidenceService : ServiceBase<Residence>, IResidenceService
    {
        public ResidenceService(IResidenceRepo repo) : base(repo) { }
    }
}
