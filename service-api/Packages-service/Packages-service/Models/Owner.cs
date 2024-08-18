namespace Packages_service.Models
{
    public class Owner : BaseModel
    {
        public required string Name { get; set; }
        public required string Document { get; set; }
        public required int ResidenceID { get; set; }
        public required string Email { get; set; }
    }
}
