using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using API.Services;
using API.Models;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]

    public class EmployeeController : ControllerBase
    {
        private readonly EmployeeService _employeeService;

        public EmployeeController(EmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        [HttpGet("{employeeId}")]
        public async Task<ActionResult<Employee>> GetEmployeeById(int employeeId)
        {
            var employee = await _employeeService.GetEmployeeById(employeeId);
            if (employee == null)
                return NotFound();
            
            return Ok(employee);
        }

        [HttpGet("department/{department}")]
        public async Task<ActionResult<IEnumerable<Employee>>> GetEmployeeByDepartmentId(int departmentId)
        {
            var employees = await _employeeService.GetEmployeesDetailsByDepartment(departmentId);

            if (employees == null)
                return NotFound();

            return Ok(employees);
        }

        [HttpPost]
        public async Task<ActionResult> InsertNewEmployee([FromBody]Employee employee)
        {
            await _employeeService.InsertNewEmployee(employee);
            return Ok();
        }

        [HttpPut("{Id}")]
        public async Task<ActionResult> UpdateEmployee([FromBody]Employee employee)
        {
            await _employeeService.UpdateEmployee(employee);
            return Ok();
        }
    }
}