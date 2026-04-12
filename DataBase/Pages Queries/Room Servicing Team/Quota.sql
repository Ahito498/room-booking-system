SELECT aqr.ID AS RequestID,
       rr.UserID,
       u.UserType,
       aqr.NumOfExtraHours,
       'Some reason text here' AS Reason -- write here the reason of request--
FROM AdditionalQuotaRequest aqr
JOIN RequestOrReport rr ON aqr.ID = rr.RID
JOIN [User] u ON rr.UserID = u.UserID
WHERE rr.RType = 'AdditionalQuotaRequest';



UPDATE TA
SET Quota = Quota + (
    SELECT NumOfExtraHours
    FROM AdditionalQuotaRequest aqr
    JOIN RequestOrReport rr ON aqr.ID = rr.RID
    WHERE rr.UserID = 19150
)
WHERE ID = 19150; --change the ID with the actual user ID--


UPDATE Student
SET Quota = Quota + (
    SELECT NumOfExtraHours
    FROM AdditionalQuotaRequest aqr
    JOIN RequestOrReport rr ON aqr.ID = rr.RID
    WHERE rr.UserID = 19150
)
WHERE ID = 19150;       --change the ID with the actual user ID--



UPDATE RequestOrReport
SET Condition = 'Declined'
WHERE RID = 3; -- Replace with the actual request ID

