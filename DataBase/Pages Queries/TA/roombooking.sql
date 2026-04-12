-- Get  Remaining Quota
SELECT 
    t.Quota - ISNULL(SUM(rb.Duration), 0) AS RemainingQuota
FROM TA t
LEFT JOIN RequestOrReport rr ON rr.UserID = t.ID
LEFT JOIN RoomBooking rb ON rr.RID = rb.ID
    AND rr.RType = 'RoomBooking'  
    AND MONTH(rr.DayofR) = MONTH(GETDATE())  
    AND YEAR(rr.DayofR) = YEAR(GETDATE())
WHERE t.ID = 456; 

-- Get Courses the TA is Assigned To
SELECT 
    c.Code AS CourseCode,
    c.Name AS CourseName,
    c.TutorialRoom AS DefaultRoom
FROM Course_TA ct
JOIN Course c ON ct.Course_Code = c.Code
WHERE ct.TA_ID = 456;  

-- Book a Room for a Tutorial
BEGIN TRANSACTION;

--  Insert into RequestOrReport
INSERT INTO RequestOrReport (UserID, Condition, DayofR, HourofR, RType)
VALUES (456, 'Pending', '2023-10-30', '08:00:00', 'RoomBooking');

--  Get the newly created RID
DECLARE @NewRID INT = SCOPE_IDENTITY();

-- Insert into RoomBooking
INSERT INTO RoomBooking (ID, RoomID, Reason, TimeSlotDay, TimeSlotHour, Duration, CourseCode)
VALUES (
    @NewRID,
    'R101',  
    'Tutorial Session',  
    'Monday', 
    '08:00:00', 
    120,  
    'MATH101' 
);

COMMIT TRANSACTION;