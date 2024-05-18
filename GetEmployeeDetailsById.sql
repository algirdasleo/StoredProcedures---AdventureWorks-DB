CREATE PROCEDURE GetEmployeeDetailsById
    @EmployeeId INT
AS 
BEGIN
    SELECT 
        hre.BusinessEntityID AS EmployeeId,
        CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
        hre.Gender AS Gender,
        hre.NationalIDNumber AS NationalID,
        hre.JobTitle AS JobTitle,
        hrd.Name AS Department,
        hrd.GroupName AS DepartmentGroup,
        hre.HireDate AS HireDate,
        hre.BirthDate AS BirthDate,
        pea.EmailAddress AS EmailAddress,
        ppp.PhoneNumber AS PhoneNumber,
        CONCAT(pa.AddressLine1, ' ', pa.AddressLine2, ' ', pa.City, ' ', psp.Name, ' ', pa.PostalCode) AS Address
    FROM 
        HumanResources.Employee hre
    JOIN
        HumanResources.EmployeeDepartmentHistory edh ON hre.BusinessEntityID = edh.BusinessEntityID
    JOIN
        HumanResources.Department hrd ON edh.DepartmentID = hrd.DepartmentID
    JOIN
        Person.person p ON hre.BusinessEntityID = p.BusinessEntityID
    JOIN
        Person.EmailAddress pea ON hre.BusinessEntityID = pea.BusinessEntityID
    JOIN
        Person.PersonPhone ppp ON hre.BusinessEntityID = ppp.BusinessEntityID
    JOIN
        Person.BusinessEntityAddress bea ON hre.BusinessEntityID = bea.BusinessEntityID
    JOIN
        Person.Address pa ON bea.AddressID = pa.AddressID
    JOIN 
        Person.StateProvince psp ON pa.StateProvinceID = psp.StateProvinceID
    WHERE 
        hre.BusinessEntityID = @EmployeeId;
END
GO

