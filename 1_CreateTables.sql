USE [GymDB]
GO

--GymTable--

CREATE TABLE GymTable (
    GymId INT IDENTITY(200,1) NOT NULL,
    GymName NVARCHAR(50),
    GymType NVARCHAR(20) NOT NULL,
    PermissionId INT,
    GymDescription NVARCHAR(MAX),
    CONSTRAINT PK_GymTable PRIMARY KEY (GymId),
    CONSTRAINT UQ_GymTable_GymName UNIQUE (GymName),
    CONSTRAINT FK_GymTable_PermissionTable 
        FOREIGN KEY (PermissionId) REFERENCES PermissionTable(PermissionId)
);
GO

--LoginTable--

CREATE TABLE LoginTable (
    LoginId INT IDENTITY(1,1) NOT NULL,
    LoginUsername NVARCHAR(50) NOT NULL,
    LoginPassword NVARCHAR(40) NOT NULL,

    CONSTRAINT PK_LoginTable PRIMARY KEY (LoginId),
    CONSTRAINT UQ_LoginTable_Username UNIQUE (LoginUsername)
);
GO

--PaymentTable--

CREATE TABLE PaymentTable (
    PaymentId INT NOT NULL,
    CustomerId INT NOT NULL,
    PaymentDate DATE,
    PaymentDescription NVARCHAR(MAX) NOT NULL,
    PaymentAmount SMALLMONEY NOT NULL,

    CONSTRAINT PK_PaymentTable PRIMARY KEY (PaymentId, CustomerId),
    CONSTRAINT FK_PaymentTable_UserTable
        FOREIGN KEY (CustomerId) REFERENCES UserTable(UserId)
);
GO

--PermissionTable--

CREATE TABLE PermissionTable (
    PermissionId INT IDENTITY(300,1) NOT NULL,
    PermissionModule NVARCHAR(50),
    PermissionName NVARCHAR(40) NOT NULL,
    PermissionDescription NVARCHAR(MAX),

    CONSTRAINT PK_PermissionTable PRIMARY KEY (PermissionId),
    CONSTRAINT UQ_PermissionTable_Name UNIQUE (PermissionName)
);
GO

--TrainerTable--

CREATE TABLE TrainerTable (
    TrainerId NCHAR(10) NOT NULL,
    TrainerName NVARCHAR(20) NOT NULL,
    TrainerSurname NVARCHAR(20) NOT NULL,
    TrainerPassword NVARCHAR(35) NOT NULL,
    TrainerPhone INT NOT NULL,
    TrainerAddress NVARCHAR(MAX),

    CONSTRAINT PK_TrainerTable PRIMARY KEY (TrainerId),
    CONSTRAINT UQ_TrainerTable_Phone UNIQUE (TrainerPhone)
);
GO

--User Table--

CREATE TABLE UserTable (
    UserId INT IDENTITY(1,1) NOT NULL,
    UserName NVARCHAR(25) NOT NULL,
    UserSurname NVARCHAR(25) NOT NULL,
    UserPhone INT NOT NULL,
    UserEmail NVARCHAR(250),
    TrainerId NCHAR(10),
    GymId INT,
    UserAddress NVARCHAR(250),

    CONSTRAINT PK_UserTable PRIMARY KEY (UserId),
    CONSTRAINT UQ_UserTable_Phone UNIQUE (UserPhone),
    CONSTRAINT UQ_UserTable_Email UNIQUE (UserEmail),

    CONSTRAINT FK_UserTable_GymTable
        FOREIGN KEY (GymId) REFERENCES GymTable(GymId),

    CONSTRAINT FK_UserTable_TrainerTable
        FOREIGN KEY (TrainerId) REFERENCES TrainerTable(TrainerId)
);
GO





