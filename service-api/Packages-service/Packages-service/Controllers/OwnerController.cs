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
    public class OwnerController : ControllerBase
    {
        private readonly IOwnerService baseService;
        private readonly IMapper mapper;

        public OwnerController(IOwnerService service, IMapper mapper)
        {
            baseService = service;
            this.mapper = mapper;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<OwnerReadDto>>> GetAll()
        {   
            var owners =  await baseService.GetAllOwners();
            var dtos = mapper.Map<List<OwnerReadDto>>(owners);
            return dtos;
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<OwnerReadDto>> GetItemById([FromRoute]int id)
        {
            var owner = await baseService.GetItemByID(id);

            if (owner == null)
            {
                return NotFound();
            }
            var dto = mapper.Map<OwnerReadDto>(owner);
            return Ok(dto);
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult<OwnerReadDto>> Update([FromRoute]int id, [FromBody]OwnerUpdateDto ownerUpdateDto)
        {
            if (id != ownerUpdateDto.Id)
            {
                return BadRequest();
            }

            var model = await baseService.GetItemByID(id);
          
            model.Name = ownerUpdateDto.Name ?? model.Name;
            model.Email = ownerUpdateDto?.Email ?? model.Email;
            model.ResidenceID = ownerUpdateDto.ResidenceId ?? model.ResidenceID;

            await baseService.UpdateItem(model);
            var dto = mapper.Map<OwnerReadDto>(model);
            return Ok(dto);
        }

        [HttpPost]
        public async Task<ActionResult<OwnerReadDto>> Create([FromBody]OwnerCreateDto createDto)
        {
            var model = mapper.Map<Owner>(createDto);
            await baseService.Create(model);

            var dto = mapper.Map<OwnerReadDto>(model);
            return Ok(dto);

            //return CreatedAtAction("GetOwner", new { id = model.Id }, model);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> Delete([FromRoute]int id)
        {
            var owner = await baseService.GetItemByID(id);
            if (owner == null)
            {
                return NotFound();
            }

            await baseService.Delete(id);
            return Ok();
        }
    }
}
