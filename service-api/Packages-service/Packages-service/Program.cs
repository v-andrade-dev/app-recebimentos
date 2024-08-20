using Packages_service.Data.DbConfig;
using Packages_service.Data.Repositories;
using Packages_service.Data.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<AppDbContext>();
builder.Services.AddScoped(typeof(IRepoBase<>), typeof(RepoBase<>));

builder.Services.AddScoped<IResidenceRepo, ResidenceRepo>();
builder.Services.AddScoped<IResidenceService, ResidenceService>();
builder.Services.AddScoped<IOwnerRepo, OwnerRepo>();
builder.Services.AddScoped<IOwnerService, OwnerService>();
builder.Services.AddScoped<IPackagesRepo, PackagesRepo>();
builder.Services.AddScoped<IPackagesService, PackagesService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
