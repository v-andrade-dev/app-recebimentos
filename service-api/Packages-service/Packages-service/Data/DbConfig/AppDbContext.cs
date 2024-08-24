using Microsoft.EntityFrameworkCore;
using Packages_service.Models;

namespace Packages_service.Data.DbConfig
{
    public class AppDbContext : DbContext
    {
        public DbSet<Residence> Residences { get; set; }
        public DbSet<Owner> Owners { get; set; }
        public DbSet<Packages> Packages { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite(connectionString: "Data Source=app-recebimentosBd.sqlite");
            optionsBuilder.LogTo(Console.WriteLine);
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Owner>().HasOne(o => o.Residence).WithMany(r => r.Owners).HasForeignKey(o => o.ResidenceID);
            //modelBuilder.Entity<Packages>().HasOne(p => p.Residence).WithMany(r => r.Packages).HasForeignKey(p => p.ResidenceID);

        }

    }
}
