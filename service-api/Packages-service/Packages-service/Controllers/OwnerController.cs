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
        public async Task<ActionResult<IEnumerable<Owner>>> GetAll()
        {
            return await baseService.GetAll();
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Owner>> GetItemById([FromRoute]int id)
        {
            var owner = await baseService.GetItemByID(id);

            if (owner == null)
            {
                return NotFound();
            }

            return Ok(owner);
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> Update([FromRoute]int id, [FromBody]Owner owner)
        {
            if (id != owner.Id)
            {
                return BadRequest();
            }

            await baseService.UpdateItem(owner);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult<Owner>> Create([FromBody]OwnerCreateDto createDto)
        {
            var model = mapper.Map<Owner>(createDto);
            await baseService.Create(model);
            return Ok(model);

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
