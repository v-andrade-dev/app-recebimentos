namespace Packages_service.DTO
{
    public class OwnerCreateDto
    {
        public required string Name { get; set; }
        public required string Document { get; set; }
        public required string Email { get; set; }
        public int ResidenceId { get; set; }
    }
}
