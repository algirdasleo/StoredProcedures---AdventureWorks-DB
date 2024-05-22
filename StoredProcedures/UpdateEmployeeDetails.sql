CREATE PROCEDURE UpdateEmployeeDetails
    -- Update selected parameters for an employee
    @EmployeeID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender CHAR(1),
    @NationalIDNumber NVARCHAR(15),
    @JobTitle NVARCHAR(100),
    @DepartmentID INT,
    @Department NVARCHAR(50),
    @DepartmentName NVARCHAR(50),
    @DepartmentGroup NVARCHAR(50),
    @HireDate DATE,
    @BirthDate DATE,
    @EmailAddress NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @AddressLine1 NVARCHAR(50),
    @AddressLine2 NVARCHAR(50),
    @City NVARCHAR(50),
    @PostalCode NVARCHAR(50)
AS
BEGIN
    DECLARE @AddressID INT;
    SELECT @AddressID = bea.AddressID
    FROM Person.BusinessEntityAddress bea
    WHERE bea.BusinessEntityID = @EmployeeID;

    IF @FirstName IS NOT NULL OR @LastName IS NOT NULL
    BEGIN
        UPDATE Person.person
        SET FirstName = ISNULL(@FirstName, FirstName),
            LastName = ISNULL(@LastName, LastName)
        WHERE BusinessEntityID = @EmployeeID
    END;

    IF @Gender IS NOT NULL OR @NationalIDNumber IS NOT NULL OR @JobTitle IS NOT NULL OR @HireDate IS NOT NULL OR @BirthDate IS NOT NULL
    BEGIN
        UPDATE HumanResources.Employee
        SET Gender = ISNULL(@Gender, Gender),
            NationalIDNumber = ISNULL(@NationalIDNumber, NationalIDNumber),
            JobTitle = ISNULL(@JobTitle, JobTitle),
            BirthDate = ISNULL(@BirthDate, BirthDate),
            HireDate = ISNULL(@HireDate, HireDate)
        WHERE BusinessEntityID = @EmployeeID
    END;

    IF @DepartmentID IS NOT NULL OR @Department IS NOT NULL
    BEGIN
        UPDATE HumanResources.EmployeeDepartmentHistory
        SET DepartmentID = ISNULL(@DepartmentID, DepartmentID)
        WHERE BusinessEntityID = @EmployeeID
    END;

    IF @DepartmentID IS NOT NULL OR @DepartmentName IS NOT NULL OR @DepartmentGroup IS NOT NULL
    BEGIN
        UPDATE HumanResources.Department
        SET Name = ISNULL(@DepartmentName, Name),
            GroupName = ISNULL(@DepartmentGroup, GroupName)
        WHERE DepartmentID = @DepartmentID
    END;

    IF @EmailAddress IS NOT NULL
    BEGIN
        UPDATE Person.EmailAddress
        SET EmailAddress = ISNULL(@EmailAddress, EmailAddress)
        WHERE BusinessEntityID = @EmployeeID
    END;

    IF @PhoneNumber IS NOT NULL
    BEGIN
        UPDATE Person.PersonPhone
        SET PhoneNumber = ISNULL(@PhoneNumber, PhoneNumber)
        WHERE BusinessEntityID = @EmployeeID
    END;

    IF @AddressID IS NOT NULL OR @AddressLine1 IS NOT NULL OR @AddressLine2 IS NOT NULL OR @City IS NOT NULL OR @PostalCode IS NOT NULL
    BEGIN
        UPDATE Person.Address
        SET AddressLine1 = ISNULL(@AddressLine1, AddressLine1),
            AddressLine2 = ISNULL(@AddressLine2, AddressLine2),
            City = ISNULL(@City, City),
            PostalCode = ISNULL(@PostalCode, PostalCode)
        WHERE AddressID = @AddressID
    END;
END
