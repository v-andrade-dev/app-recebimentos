namespace Packages_service.DTO;

public class PackagesReadDto
{
    public int Id { get; set; }
    public string OwnerName {  get; set; } = string.Empty;
    public string? Shipper { get; set; }
    public DateTime EntryDate { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public string? Receiver { get; set; }
    public bool? Finish { get; set; }
    public int ResidenceID {  get; set; }
    public ResidenceReadDto Residence { get; set; }
}

