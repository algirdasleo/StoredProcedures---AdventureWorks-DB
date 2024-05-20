namespace API.Models
{
    public class EmployeeModel
    {
        // Employee information
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public char Gender { get; set }
        public string NationalIDNumber { get; set; }
        public string JobTitle { get; set; }

        // Department information
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }
        public string DepartmentGroup { get; set; }

        // Dates
        public DateTime HireDate { get; set; }
        public DateTime BirthDate { get; set; }

        // Contact information
        public string EmailAddress { get; set; }
        public string PhoneNumber { get; set; }

        // Address information
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public int StateProvinceID { get; set; }
        public string PostalCode { get; set; }
    }
}