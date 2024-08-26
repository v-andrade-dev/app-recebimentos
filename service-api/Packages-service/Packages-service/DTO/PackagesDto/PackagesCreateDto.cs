namespace Packages_service.DTO
{
    public class PackagesCreateDto
    {
        public required string OwnerName { get; set; }
        public string? Shipper { get; set; }
        public DateTime EntryDate { get; set; }
        public required int ResidenceID { get; set; }

    }
}
