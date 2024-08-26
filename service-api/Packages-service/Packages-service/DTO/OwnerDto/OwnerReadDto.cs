
namespace Packages_service.DTO;

    public class OwnerReadDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Document { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public ResidenceReadDto? Residence { get; set; }
    }

