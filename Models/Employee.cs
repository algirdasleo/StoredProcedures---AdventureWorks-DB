namespace API.Models
{
    public class Employee
    {
        // Employee information
        public int EmployeeId { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public char? Gender { get; set; }
        public string NationalIDNumber { get; set; } = string.Empty;
        public string JobTitle { get; set; } = string.Empty;

        // Department information
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; } = string.Empty;
        public string DepartmentGroup { get; set; } = string.Empty;

        // Dates
        public DateTime HireDate { get; set; }
        public DateTime BirthDate { get; set; }

        // Contact information
        public string EmailAddress { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;

        // Address information
        public string AddressLine1 { get; set; } = string.Empty; 
        public string? AddressLine2 { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public int StateProvinceID { get; set; }
        public string PostalCode { get; set; } = string.Empty;
    }
}