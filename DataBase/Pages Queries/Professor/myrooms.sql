-- Get Professor's Assigned Courses
SELECT 
    c.Code AS CourseCode,
    c.Name AS CourseName,
    c.LectureRoom AS CurrentRoom,
    (SELECT Building FROM Room WHERE ID = c.LectureRoom) AS Building,
    CONCAT(c.LectureDay, ' ', 
           CONVERT(VARCHAR, c.LectureHour, 108), '-', 
           CONVERT(VARCHAR, DATEADD(MINUTE, c.LectureDuration, c.LectureHour), 108)) AS Schedule
FROM Course c
WHERE c.ProfessorID = 789;
-- Get Pending Room Change Requests for Professor's Courses
SELECT 
    c.Code AS CourseCode,
    r.ID AS RequestedRoom,
    rc.Reason,
    rr.RID AS RequestID
FROM RoomChangeRequest rc
JOIN RequestOrReport rr ON rc.ID = rr.RID
JOIN Course c ON rc.CourseCode = c.Code
JOIN Room r ON rc.NewRoomID = r.ID
WHERE c.ProfessorID = 789 
  AND rr.Condition = 'Pending';