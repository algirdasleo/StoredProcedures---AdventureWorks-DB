using System;
using System.Data;
using System.Threading.Tasks;
using API.Factories;
using API.Models;
using Dapper;

namespace API.Services
{
    public class EmployeeService
    {
        private readonly SqlConnectionFactory _connectionFactory;

        public EmployeeService(SqlConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<Employee?> GetEmployeeById(int employeeId)
        {
            using (var connection = _connectionFactory.CreateConnection())
            {
                return await connection.QueryFirstOrDefaultAsync<Employee?>
                (
                    "dbo.GetEmployeeDetailsById",
                    new { EmployeeID = employeeId },
                    commandType: CommandType.StoredProcedure
                );
            }
        }

        public async Task<IEnumerable<Employee>> GetEmployeesDetailsByDepartment(int departmentID)
        {
            using (var connection = _connectionFactory.CreateConnection())
            {
                return await connection.QueryAsync<Employee>(
                    "dbo.GetEmployeesDetailsByDepartment",
                    new {DepartmentId = departmentID },
                    commandType: CommandType.StoredProcedure
                );
            }
        }

        public async Task InsertNewEmployee(Employee employee)
        {
            using (var connection = _connectionFactory.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.InsertEmployee",
                    new 
                    {
                        FirstName = employee.FirstName,
                        LastName = employee.LastName,
                        Gender = employee.Gender,
                        NationalIDNumber = employee.NationalIDNumber,
                        JobTitle = employee.JobTitle,
                        DepartmentID = employee.DepartmentID,
                        DepartmentName = employee.DepartmentName,
                        DepartmentGroup = employee.DepartmentGroup,
                        HireDate = employee.HireDate,
                        BirthDate = employee.BirthDate,
                        EmailAddress = employee.EmailAddress,
                        PhoneNumber = employee.PhoneNumber,
                        AddressLine1 = employee.AddressLine1,
                        AddressLine2 = employee.AddressLine2,
                        City = employee.City,
                        StateProvinceID = employee.StateProvinceID,
                        PostalCode = employee.PostalCode
                    }, 
                    commandType: CommandType.StoredProcedure
                );
            }
        }

        public async Task UpdateEmployee(Employee employee)
        {
            using (var connection = _connectionFactory.CreateConnection())
            {
                await connection.ExecuteAsync(
                    "dbo.UpdateEmployeeDetails",
                    new 
                    {
                        EmployeeID = employee.Id, 
                        FirstName = employee.FirstName,
                        LastName = employee.LastName,
                        Gender = employee.Gender,
                        NationalIDNumber = employee.NationalIDNumber,
                        JobTitle = employee.JobTitle,
                        DepartmentID = employee.DepartmentID,
                        DepartmentName = employee.DepartmentName,
                        DepartmentGroup = employee.DepartmentGroup,
                        HireDate = employee.HireDate,
                        BirthDate = employee.BirthDate,
                        EmailAddress = employee.EmailAddress,
                        PhoneNumber = employee.PhoneNumber,
                        AddressID = employee.AddressID,
                        AddressLine1 = employee.AddressLine1,
                        AddressLine2 = employee.AddressLine2,
                        City = employee.City,
                        PostalCode = employee.PostalCode
                    }
                );
            }
        }
    }
}