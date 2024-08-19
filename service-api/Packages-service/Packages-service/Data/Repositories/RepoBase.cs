using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using Packages_service.Data.DbConfig;

namespace Packages_service.Data.Repositories
{
    public interface IRepoBase<T>
    {
        public Task<List<T>> GetAll();
        public Task<T?> GetItemByID(int itemID);
        public Task<T> Create(T item);
        public Task<T> Update(T item);
        public Task<bool> Delete(T item);
    }

    public class RepoBase<T> : IRepoBase<T> where T : class
    {
        private readonly AppDbContext _context;
        private DbSet<T> Model => _context.Set<T>();

        public RepoBase(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<T>> GetAll()
        {
            return await Model.ToListAsync();
        }

        public async Task<T?> GetItemByID(int itemID)
        {
            return await Model.FindAsync(itemID);
        }

        public async Task<T> Create(T item)
        {
            Model.Add(item);
            await _context.SaveChangesAsync();
            return await Task.FromResult(item);
        }

        public async Task<T> Update(T item)
        {
            Model.Update(item);
            await _context.SaveChangesAsync();
            return await Task.FromResult(item);
        }

        public async Task<bool> Delete(T item)
        {
           Model.Remove(item);
           await _context.SaveChangesAsync();
           return true;
        }

    }
}
