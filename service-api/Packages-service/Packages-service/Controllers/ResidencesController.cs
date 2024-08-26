using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Packages_service.Data.DbConfig;
using Packages_service.Data.Services;
using Packages_service.DTO;
using Packages_service.Models;

namespace Packages_service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResidencesController : ControllerBase
    {
        private readonly IResidenceService baseService;
        private readonly IMapper mapper;

        public ResidencesController(IResidenceService service, IMapper mapper)
        {
            baseService = service;
            this.mapper = mapper;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ResidenceReadDto>>> GetAll()
        {
            var models = await baseService.GetAllResidences();
            var dtos = mapper.Map<List<ResidenceReadDto>>(models);

            return Ok(dtos);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<ResidenceReadDto>> GetItemById([FromRoute] int id)
        {
            var model = await baseService.GetItemByID(id);

            if (model == null)
            {
                return NotFound();
            }

            var dto = mapper.Map<ResidenceReadDto>(model);

            return Ok(dto);
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult<ResidenceReadDto>> Update([FromRoute] int id, [FromBody]ResidenceUpdateDto residenceDto)
        {
            if (id != residenceDto.Id)
            {
                return BadRequest();
            }

            var model = await baseService.GetItemByID(id);
            model.Number = residenceDto.Number ?? model.Number;
            model.Complement = residenceDto.Complement;

            await baseService.UpdateItem(model);
            var dto = mapper.Map<ResidenceReadDto>(model);
            
            return Ok(dto);
        }

        [HttpPost]
        public async Task<ActionResult<ResidenceReadDto>> Create([FromBody]ResidenceCreateDto createDto)
        {
            var model = mapper.Map<Residence>(createDto);
            await baseService.Create(model);

            var dto = mapper.Map<ResidenceReadDto>(model);
            return Ok(dto);

            //return CreatedAtAction("GetResidence", new { id = residence.Id }, residence);
        }
            
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
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
