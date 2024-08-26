using System.ComponentModel.DataAnnotations.Schema;

namespace Packages_service.Models
{
    [Table("Owners")]
    public class Owner : BaseModel
    {
        public required string Name { get; set; }
        public required string Document { get; set; }
        public required string Email { get; set; }
        public required int ResidenceID { get; set; }
        public Residence? Residence { get; set; }
    }
}
