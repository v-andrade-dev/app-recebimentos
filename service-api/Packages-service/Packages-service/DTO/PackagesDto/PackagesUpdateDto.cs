namespace Packages_service.DTO;

public class PackagesUpdateDto
{
    public int Id { get; set; }
    public string? OwnerName { get; set; }
    public string? Shipper { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public string? Receiver { get; set; }
    public int? ResidenceID { get; set; }
}
