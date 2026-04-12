-- Submit a Detailed Room Issue Report
BEGIN TRANSACTION;
INSERT INTO RequestOrReport (UserID, Condition, DayofR, HourofR, RType)
VALUES (
    123, 
    'Pending', 
    GETDATE(),
    CONVERT(TIME, GETDATE()), 
    'Report'
);
DECLARE @NewRID INT = SCOPE_IDENTITY();
INSERT INTO Report (ID, RoomID, Complaint, IssueCategory, UrgencyLevel)
VALUES (
    @NewRID,
    'G-203', 
    'Projector screen is torn', 
    'EquipmentFailure',
    'Medium' 
);
COMMIT TRANSACTION;

-- Get Detailed Room Issue Reports for a User
SELECT 
    r.RoomID AS RoomCode,
    r.IssueCategory,
    r.UrgencyLevel,
    r.Complaint AS IssueDescription,
    CONVERT(VARCHAR, rr.DayofR, 103) + ' ' + 
    CONVERT(VARCHAR, rr.HourofR, 108) AS SubmissionDateTime,
    rr.Condition AS Status
FROM RequestOrReport rr
JOIN Report r ON rr.RID = r.ID
WHERE rr.UserID = 123 
  AND rr.RType = 'Report';