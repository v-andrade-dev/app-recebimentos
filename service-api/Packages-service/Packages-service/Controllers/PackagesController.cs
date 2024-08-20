using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Packages_service.Data.Services;
using Packages_service.Models;

namespace Packages_service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PackagesController : ControllerBase
    {
        private readonly IPackagesService baseService;

        public PackagesController(IPackagesService service)
        {
            baseService = service;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Packages>>> GetAll()
        {
            return await baseService.GetAll();
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Packages>> GetItemById([FromRoute] int id)
        {
            var packages = await baseService.GetItemByID(id);

            if (packages == null)
            {
                return NotFound();
            }

            return Ok(packages);
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] Packages packages)
        {
            if (id != packages.Id)
            {
                return BadRequest();
            }

            await baseService.UpdateItem(packages);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult<Packages>> Create([FromBody] Packages packages)
        {
            await baseService.Create(packages);

            return CreatedAtAction("GetPackages", new { id = packages.Id }, packages);
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
