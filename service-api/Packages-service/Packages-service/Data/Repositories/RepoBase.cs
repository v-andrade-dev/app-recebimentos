using Microsoft.EntityFrameworkCore;
using Packages_service.Data.DbConfig;

namespace Packages_service.Data.Repositories
{
    public interface IRepoBase<T>
    {
        public void Create(T item);

        public Task<T?> GetItemByID(int itemID);

        public void Update(T item);

        public void Delete(int itemID);
    }

    public class RepoBase<T> : IRepoBase<T> where T : class
    {
        private readonly AppDbContext _context;

        public RepoBase(AppDbContext context)
        {
            _context = context;
        }

        public void Create(T item)
        {
            _context.Set<T>().Add(item);
            _context.SaveChanges();
        }

        public void Delete(int itemID)
        {
            throw new NotImplementedException();
        }

        public async Task<T?> GetItemByID(int itemID)
        {
            return await _context.Set<T>().FindAsync(itemID);
        }

        public void Update(T item)
        {
            throw new NotImplementedException();
        }

    }
}
