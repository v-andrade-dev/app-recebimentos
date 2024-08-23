using System.ComponentModel.DataAnnotations.Schema;

namespace Packages_service.Models
{
    public class Packages : BaseModel
    {
        public required string OwnerName { get; set; }
        public string? Shipper { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string? Receiver { get; set; }
        public bool? Finish { get; set; }

        public required int ResidenceID { get; set; }
        public Residence? Residence { get; set; }
    }
}
