﻿namespace Packages_service.DTO
{
    public class PackagesCreateDto
    {
        public required string OwnerName { get; set; }
        public string? Shipper { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string? Receiver { get; set; }
        public bool? Finish { get; set; }
        public required int ResidenceID { get; set; }

    }
}