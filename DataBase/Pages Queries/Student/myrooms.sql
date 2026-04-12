
SELECT 
    c.Code AS CourseCode,
    c.Name AS CourseName,
    c.LectureRoom AS Room,
    (SELECT Building FROM Room WHERE ID = c.LectureRoom) AS Building,
    CONCAT(c.LectureDay, ' ', c.LectureHour, '-', 
           DATEADD(MINUTE, c.LectureDuration, c.LectureHour)) AS TimeSlot,
    CASE 
        WHEN j.Student_ID IS NOT NULL THEN 'JTA Course'
        ELSE 'Enrolled Course'
    END AS CourseType
FROM Course_Student cs
JOIN Course c ON cs.Course_Code = c.Code
LEFT JOIN JTA j ON cs.Student_ID = j.Student_ID AND cs.Course_Code = j.Course_Code
WHERE cs.Student_ID = 123; -- to be replaced