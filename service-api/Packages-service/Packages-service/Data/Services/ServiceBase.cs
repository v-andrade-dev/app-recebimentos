using Microsoft.AspNetCore.Http.HttpResults;
using Packages_service.Data.Repositories;

namespace Packages_service.Data.Services
{
    public interface IServiceBase<T>
    {
        public Task<T> Create(T model);
        public Task<T> GetItemByID(int id);
        public Task<T> UpdateItemByID(int id, T model);
        public Task Delete(int id);
    }

    public abstract class ServiceBase<T> : IServiceBase<T> where T : class
    {
        private readonly IRepoBase<T> repo;

        public ServiceBase(IRepoBase<T> repo) 
        {
            this.repo = repo;
        }

        public Task<T> Create(T model)
        {
            repo.Create(model);
            return Task.FromResult(model);
          
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<T> GetItemByID(int id)
        {
            //repo.GetItemByID(id);
            return await repo.GetItemByID(id);
        }

        public Task<T> UpdateItemByID(int id, T model)
        {
            throw new NotImplementedException();
        }
    }
}
