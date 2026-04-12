--  Approved Tutorial Rooms for the TA
SELECT 
    c.Code AS CourseCode,
    c.Name AS CourseName,
    c.TutorialRoom AS Room,
    (SELECT Building FROM Room WHERE ID = c.TutorialRoom) AS Building,
    CONCAT(c.TutorialDay, ' ', 
           CONVERT(VARCHAR, c.TutorialHour, 108), '-', 
           CONVERT(VARCHAR, DATEADD(MINUTE, c.TutorialDuration, c.TutorialHour), 108)) AS TimeSlot
FROM Course_TA ct
JOIN Course c ON ct.Course_Code = c.Code
WHERE ct.TA_ID = 456;

-- Pending Requests for the TA's Tutorial Rooms
SELECT 
    c.Code AS CourseCode,
    rep.Complaint AS Reason,
    rr.Condition AS Status
FROM Course_TA ct
JOIN Course c ON ct.Course_Code = c.Code
JOIN Report rep ON rep.RoomID = c.TutorialRoom
JOIN RequestOrReport rr ON rep.ID = rr.RID
WHERE ct.TA_ID = 456 
  AND rr.Condition = 'Pending';