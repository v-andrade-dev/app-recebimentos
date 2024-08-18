using Microsoft.EntityFrameworkCore;
using Packages_service.Models;

namespace Packages_service.Data.DbConfig
{
    public class AppDbContext : DbContext
    {
        public DbSet<Residence> Residences { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite(connectionString: "Data Source=app-recebimentosBd.sqlite");
            optionsBuilder.LogTo(Console.WriteLine);
            base.OnConfiguring(optionsBuilder);
        }

    }
}
