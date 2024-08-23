using System.ComponentModel.DataAnnotations.Schema;

namespace Packages_service.Models
{
    [Table("Residences")]
    public class Residence : BaseModel
    {
        public int Number {  get; set; }
        public string? Complement { get; set; }

        public ICollection<Owner> Owners { get; set; }
        public ICollection<Packages> Packages { get; set; }

    }
}
