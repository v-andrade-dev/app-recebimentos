using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Packages_service.Data.Services;
using Packages_service.DTO;
using Packages_service.Models;

namespace Packages_service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PackagesController : ControllerBase
    {
        private readonly IPackagesService baseService;
        private readonly IMapper mapper;

        public PackagesController(IPackagesService service, IMapper mapper)
        {
            baseService = service;
            this.mapper = mapper;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<PackagesReadDto>>> GetAll()
        {
            var models = await baseService.GetAllPackages();

            var dtos = mapper.Map<List<PackagesReadDto>>(models);

            return dtos;
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<PackagesReadDto>> GetItemById([FromRoute] int id)
        {
            var packages = await baseService.GetItemByID(id);

            if (packages == null)
            {
                return NotFound();
            }
            
            var dto = mapper.Map<PackagesReadDto>(packages);
            return Ok(dto);
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult<PackagesReadDto>> Update([FromRoute] int id, [FromBody] PackagesUpdateDto packagesDto)
        {
            if (id != packagesDto.Id)
            {
                return BadRequest();
            }

            var model = await baseService.GetItemByID(id);
            model.OwnerName = packagesDto.OwnerName ?? model.OwnerName;
            model.Shipper = packagesDto.Shipper ?? model.Shipper;
            model.DeliveryDate = packagesDto.DeliveryDate;
            model.Receiver = packagesDto.Receiver ?? model.Receiver;
            model.ResidenceID = packagesDto.ResidenceID ?? model.ResidenceID; 

            await baseService.UpdateItem(model);
            var dto = mapper.Map<PackagesReadDto>(model);
            return Ok(dto);
        }

        [HttpPost]
        public async Task<ActionResult<PackagesReadDto>> Create([FromBody] PackagesCreateDto createDto)
        {
            var model = mapper.Map<Packages>(createDto);
            await baseService.Create(model);

            var dto = mapper.Map<PackagesReadDto>(model);

            return Ok(dto);
            //return CreatedAtAction("GetPackages", new { id = packages.Id }, packages);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            var packages = await baseService.GetItemByID(id);
            if (packages == null)
            {
                return NotFound();
            }

            await baseService.Delete(id);
            return Ok();
        }
    }
}
