using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Packages_service.Data.DbConfig;
using Packages_service.Data.Services;
using Packages_service.Models;

namespace Packages_service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResidencesController : ControllerBase
    {
        private readonly IResidenceService baseService;

        public ResidencesController(IResidenceService service)
        {
            baseService = service;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Residence>>> GetAll()
        {
            return await baseService.GetAll();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Residence>> GetItemById(int id)
        {
            var residence = await baseService.GetItemByID(id);

            if (residence == null)
            {
                return NotFound();
            }

            return Ok(residence);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Residence residence)
        {
            if (id != residence.Id)
            {
                return BadRequest();
            }

            await baseService.UpdateItem(residence);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult<Residence>> Create(Residence residence)
        {
            await baseService.Create(residence);

            return CreatedAtAction("GetResidence", new { id = residence.Id }, residence);
        }
            
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var residence = await baseService.GetItemByID(id);
            if (residence == null)
            {
                return NotFound();
            }

            await baseService.Delete(id);
            return Ok();
        }
    }
}
