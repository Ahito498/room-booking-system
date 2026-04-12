-- Book a Lecture Room (Professor)
BEGIN TRANSACTION;

INSERT INTO RequestOrReport (UserID, Condition, DayofR, HourofR, RType)
VALUES (
    789, 
    'Pending', 
    '2023-11-01', 
    '10:00:00', 
    'RoomBooking'
);


DECLARE @NewRID INT = SCOPE_IDENTITY();


INSERT INTO RoomBooking (ID, RoomID, TimeSlotDay, TimeSlotHour, Duration, CourseCode)
VALUES (
    @NewRID,
    'B202',
    'Monday', 
    '10:00:00', 
    120, 
    'CIE101' 
);

COMMIT TRANSACTION;

-- Get Pending JTA Requests for Professor's Courses
SELECT 
    s.ID AS StudentID,
    u.Name AS StudentName,
    c.Code AS CourseCode,
    req.NumOfExtraHours AS RequestedHours,
    req.RoomID AS RelatedRoom
FROM AdditionalQuotaRequest req
JOIN RequestOrReport rr ON req.ID = rr.RID
JOIN Course c ON req.CourseCode = c.Code
JOIN Student s ON rr.UserID = s.ID
JOIN [User] u ON s.ID = u.UserID
WHERE c.ProfessorID = 789 
  AND rr.Condition = 'Pending';