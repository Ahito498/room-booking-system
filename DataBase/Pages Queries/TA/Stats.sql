
SELECT Quota
FROM   TA
WHERE  ID = @TA_ID;


DECLARE @RID INT = ,
	@UserID INT = ,
	@ExtraHours INT = ;


INSERT INTO RequestOrReport
      (UserID,  Condition,  DayofR, HourofR, RType)
VALUES(@UserID,'Pending',CAST(GETDATE() AS date), CAST(GETDATE() AS time), 'AdditionalQuotaRequest');

SET @RID = SCOPE_IDENTITY();


INSERT INTO AdditionalQuotaRequest (ID, NumOfExtraHours)
VALUES (@RID, @ExtraHours);

