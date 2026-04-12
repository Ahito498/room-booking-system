-- Submit a New Room Issue Report
BEGIN TRANSACTION;

-- Insert into RequestOrReport 
INSERT INTO RequestOrReport (UserID, Condition, DayofR, HourofR, RType)
VALUES (
    123, 
    'Pending', 
    GETDATE(),
    CONVERT(TIME, GETDATE()), 
    'Report'
);

DECLARE @NewRID INT = SCOPE_IDENTITY();
INSERT INTO Report (ID, RoomID, Complaint)
VALUES (
    @NewRID,
    'R101',
    'Broken projector' 
);

COMMIT TRANSACTION;

-- Get All Reports for a User
SELECT 
    r.RoomID AS RoomCode,
    r.Complaint AS IssueDescription,
    CONVERT(VARCHAR, rr.DayofR, 103) + ' ' + 
    CONVERT(VARCHAR, rr.HourofR, 108) AS SubmissionDateTime,
    rr.Condition AS Status
FROM RequestOrReport rr
JOIN Report r ON rr.RID = r.ID
WHERE rr.UserID = 123 
  AND rr.RType = 'Report';