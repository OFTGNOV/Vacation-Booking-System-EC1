
IF DB_ID(N'JTBVacationBooking') IS NULL
    CREATE DATABASE JTBVacationBooking;
GO

USE JTBVacationBooking;
GO

IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users
    (
        UserId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Users PRIMARY KEY,
        FullName NVARCHAR(120) NOT NULL,
        Email NVARCHAR(254) NOT NULL,
        PasswordHash VARBINARY(32) NOT NULL,
        PasswordSalt VARBINARY(16) NOT NULL,
        IsActive BIT NOT NULL CONSTRAINT DF_Users_IsActive DEFAULT (1),
        CreatedAt DATETIME NOT NULL CONSTRAINT DF_Users_CreatedAt DEFAULT (GETDATE()),
        CONSTRAINT UQ_Users_Email UNIQUE (Email)
    );
END;
GO
