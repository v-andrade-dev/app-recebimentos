using Microsoft.AspNetCore.Http.HttpResults;
using Packages_service.Data.Repositories;

namespace Packages_service.Data.Services
{
    public interface IServiceBase<T>
    {
        public Task<List<T>> GetAll();
        public Task<T?> GetItemByID(int id);
        public Task<T> Create(T model);
        public Task<T> UpdateItem(T model);
        public Task<bool> Delete(int id);
    }

    public abstract class ServiceBase<T> : IServiceBase<T> where T : class
    {
        private readonly IRepoBase<T> repo;

        public ServiceBase(IRepoBase<T> repo) 
        {
            this.repo = repo;
        }

        public async Task<List<T>> GetAll() 
        {
            return await repo.GetAll();
        }

        public async Task<T?> GetItemByID(int id)
        {
            return await repo.GetItemByID(id);
        }

        public async Task<T> Create(T model)
        {
            return await repo.Create(model);      
        }

        public async Task<T> UpdateItem(T model)
        {
            return await repo.Update(model);
        }

        public async Task<bool> Delete(int id)
        {
            var item = await GetItemByID(id);
            if (item != null) return await repo.Delete(item);
            
            return false;
        }

    }
}
