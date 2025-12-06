--Login Table--

-- LoginPassword: Must start with an uppercase letter 
-- and contain at least 2 numeric digits.
ALTER TABLE dbo.LoginTable
ADD CONSTRAINT CK_LoginTable_LoginPassword
CHECK (
    LoginPassword LIKE '[A-Z]%'              -- first character uppercase
    AND LoginPassword LIKE '%[0-9]%[0-9]%'   -- at least 2 digits anywhere
);
GO

--Permission Table--

-- PermissionModule: Cannot contain any numeric digits.
ALTER TABLE dbo.PermissionTable
ADD CONSTRAINT CK_PermissionTable_Module_NoDigit
CHECK (
    PermissionModule NOT LIKE '%[0-9]%'
);
GO

--GymTable--

-- GymType: Cannot contain numeric digits.
ALTER TABLE dbo.GymTable
ADD CONSTRAINT CK_GymTable_GymType_NoDigit
CHECK (
    GymType NOT LIKE '%[0-9]%'
);
GO

--UserTable--

-- UserName: Cannot contain numeric digits.
ALTER TABLE dbo.UserTable
ADD CONSTRAINT CK_UserTable_UserName_NoDigit
CHECK (
    UserName NOT LIKE '%[0-9]%'
);
GO

-- UserEmail: Must contain at least one @ symbol.
ALTER TABLE dbo.UserTable
ADD CONSTRAINT CK_UserTable_UserEmail_HasAt
CHECK (
    UserEmail LIKE '%@%'
);
GO

--PaymentTable--

-- PaymentAmount: Must be between 0 and 100000.
ALTER TABLE dbo.PaymentTable
ADD CONSTRAINT CK_PaymentTable_Amount_Range
CHECK (
    PaymentAmount >= 0 AND PaymentAmount <= 100000
);
GO

-- PaymentDate: Cannot be a future date.
ALTER TABLE dbo.PaymentTable
ADD CONSTRAINT CK_PaymentTable_Date_NotFuture
CHECK (
    PaymentDate <= GETDATE()
);
GO

--TrainerTable--

-- TrainerPassword: Must contain at least one uppercase letter 
-- and at least two numeric digits.
ALTER TABLE dbo.TrainerTable
ADD CONSTRAINT CK_TrainerTable_Password
CHECK (
    TrainerPassword LIKE '%[A-Z]%'        -- at least 1 uppercase
    AND TrainerPassword LIKE '%[0-9]%[0-9]%'  -- at least 2 digits
);
GO


--Default Constraints--

-- UserTable: Default UserAddress = 'No'
ALTER TABLE dbo.UserTable
ADD CONSTRAINT DF_UserTable_UserAddress
DEFAULT ('No') FOR UserAddress;
GO

-- TrainerTable: Default TrainerAddress = 'No'
ALTER TABLE dbo.TrainerTable
ADD CONSTRAINT DF_TrainerTable_TrainerAddress
DEFAULT ('No') FOR TrainerAddress;
GO

-- GymTable: Default GymAddress = 'No'
ALTER TABLE dbo.GymTable
ADD CONSTRAINT DF_GymTable_GymAddress
DEFAULT ('No') FOR GymAddress;
GO

-- PaymentTable: Default PaymentDescription = 'No'
ALTER TABLE dbo.PaymentTable
ADD CONSTRAINT DF_PaymentTable_PaymentDescription
DEFAULT ('No') FOR PaymentDescription;
GO

--All Constraints are here in this sql file--
