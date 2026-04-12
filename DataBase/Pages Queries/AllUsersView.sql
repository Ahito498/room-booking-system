CREATE VIEW AllUsers
AS
SELECT Email, [Password], UserType, UserID
FROM [User]

UNION

SELECT Email, [Password], UserType, ID
FROM [Admin];