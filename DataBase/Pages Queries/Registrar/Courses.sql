--Showing the details of all the existing courses

SELECT 
    C.[Name] AS [Name],
    Prof.[Name] AS professor_name,
    TA.[Name] AS ta_name,
    Jta.name AS jta_name,
    COUNT(CS.Student_ID) AS Student_Count
FROM Course C
LEFT JOIN Professor P ON C.ProfessorID = P.ID
LEFT JOIN [User] Prof ON P.ID = Prof.UserID
LEFT JOIN Course_TA CT ON C.Code = CT.Course_Code
LEFT JOIN TA T ON CT.TA_ID = T.ID
LEFT JOIN [User] TA ON T.ID = TA.UserID
LEFT JOIN JTA JT ON C.Code = JT.Course_Code
LEFT JOIN Student JTASt ON JT.Student_ID = JTASt.ID
LEFT JOIN [User] JTA ON JTASt.ID = JTA.UserID
LEFT JOIN Course_Student CS ON C.Code = CS.Course_Code
GROUP BY C.Code, C.[Name], Prof.[Name], TA.[Name], JTA.[Name];
	