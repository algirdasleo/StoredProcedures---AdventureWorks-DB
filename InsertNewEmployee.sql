CREATE PROCEDURE InsertNewEmployee
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender CHAR(1),
    @NationalIDNumber NVARCHAR(15),
    @JobTitle NVARCHAR(50),
    @DepartmentID INT,
    @DepartmentName NVARCHAR(50),
    @DepartmentGroup NVARCHAR(50),
    @HireDate DATE,
    @BirthDate DATE,
    @EmailAddress NVARCHAR(50),
    @PhoneNumber NVARCHAR(25),
    @AddressLine1 NVARCHAR(60),
    @AddressLine2 NVARCHAR(60),
    @City NVARCHAR(30),
    @StateProvinceID INT,
    @PostalCode NVARCHAR(15)
AS
BEGIN
    DECLARE @BusinessEntityID INT;
    INSERT INTO Person.Person(FirstName, LastName)
    VALUES(@FirstName, @LastName);
    SET @BusinessEntityID = SCOPE_IDENTITY();

    INSERT INTO HumanResources.Employee(BusinessEntityID, Gender, NationalIDNumber, JobTitle, HireDate, BirthDate)
    VALUES(@BusinessEntityID, @Gender, @NationalIDNumber, @JobTitle, @HireDate, @BirthDate);

    INSERT INTO HumanResources.EmployeeDepartmentHistory(BusinessEntityID, DepartmentID, StartDate)
    VALUES(@BusinessEntityID, @DepartmentID, @HireDate);

    INSERT INTO Person.EmailAddress(BusinessEntityID, EmailAddress)
    VALUES(@BusinessEntityID, @EmailAddress);

    INSERT INTO Person.PersonPhone(BusinessEntityID, PhoneNumber)
    VALUES(@BusinessEntityID, @PhoneNumber);

    DECLARE @AddressID INT;
    INSERT INTO Person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode)
    VALUES(@AddressLine1, @AddressLine2, @City, @StateProvinceID, @PostalCode);
    SET @AddressID = SCOPE_IDENTITY();

    INSERT INTO Person.BusinessEntityAddress(BusinessEntityID, AddressID)
    VALUES(@BusinessEntityID, @AddressID);
END