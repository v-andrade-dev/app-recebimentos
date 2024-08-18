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

        // GET: api/Residences
        /*[HttpGet]
        public async Task<ActionResult<IEnumerable<Residence>>> GetResidences()
        {
            return await _context.Residences.ToListAsync();
        }*/

        // GET: api/Residences/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Residence>> GetResidence(int id)
        {
            var residence = await baseService.GetItemByID(id);

            if (residence == null)
            {
                return NotFound();
            }

            return residence;
        }

        // PUT: api/Residences/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        /*[HttpPut("{id}")]
        /*public async Task<IActionResult> PutResidence(int id, Residence residence)
        {
           if (id != residence.Id)
            {
                return BadRequest();
            }

            _context.Entry(residence).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ResidenceExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }*/

        // POST: api/Residences
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
       /* [HttpPost]
        public async Task<ActionResult<Residence>> PostResidence(Residence residence)
        {
            /*_context.Residences.Add(residence);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetResidence", new { id = residence.Id }, residence);
        }

        // DELETE: api/Residences/5
        /*[HttpDelete("{id}")]
        public async Task<IActionResult> DeleteResidence(int id)
        {
          /*  var residence = await _context.Residences.FindAsync(id);
            if (residence == null)
            {
                return NotFound();
            }

            _context.Residences.Remove(residence);
            await _context.SaveChangesAsync();

            return NoContent();
        }*/
    }
}
