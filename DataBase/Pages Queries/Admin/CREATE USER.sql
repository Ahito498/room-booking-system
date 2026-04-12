DECLARE @UserID            INT            = 2022588,
        @Password NVARCHAR(255)  = , --here i will add the password and all the info --
        @UserName          NVARCHAR(100)  = ,
        @UserEmail         NVARCHAR(100)  = ,
        @UserType          VARCHAR(20)    = ,      -- or 'Professor', 'TA', …
        @OfficeRoom        VARCHAR(50)    = NULL,           -- only for staff roles
        @InitialQuota      INT            = NULL;           -- optional, only for Student


BEGIN TRAN;

INSERT INTO [User] (UserID,[Password],[Name],Email,UserType)
VALUES( @UserID,
        @Password,  -- always hash the pass word with unique one 
        @UserName,
        @UserEmail,
        @UserType );


IF      @UserType = 'Professor'
    INSERT INTO Professor (ID,OfficeRoom)
    VALUES (@UserID, @OfficeRoom);

ELSE IF @UserType = 'Student'
    INSERT INTO Student (ID,Quota)
    VALUES (@UserID, ISNULL(@InitialQuota,3));

ELSE IF @UserType = 'TA'
    INSERT INTO TA (ID,OfficeRoom,Quota)
    VALUES (@UserID, @OfficeRoom, 20);



COMMIT;

