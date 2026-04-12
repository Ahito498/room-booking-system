--Showing the Existing courses at the bottom of the page

SELECT 
    C.Code AS Course_Code,
    C.[Name] AS Course_Name,
    U.[Name] AS Professor_Name
FROM Course c
LEFT JOIN [User] U ON C.ProfessorID = U.UserID;

--___________________________________________________________________________________________________________________________________________________________________________
--___________________________________________________________________________________________________________________________________________________________________________

--Adding a new Course

INSERT INTO Course (
    Code, [Name], ProfessorID,
    LectureRoom, LectureDay, LectureHour, LectureDuration,
    TutorialRoom, TutorialDay, TutorialHour, TutorialDuration
) VALUES (
    '', '', '',
    '', '', '', '',
    '', '', '', ''
);

INSERT INTO Course_TA (Course_Code, TA_ID) VALUES ('', '');

INSERT INTO JTA (Course_Code, Student_ID) VALUES ('', '');

INSERT INTO Course_Student (Course_Code, Student_ID) VALUES ('', '');

--___________________________________________________________________________________________________________________________________________________________________________
--___________________________________________________________________________________________________________________________________________________________________________

--Editing on a course. The data of the course appears on the field on "Add Course" section when the user click on the "Edit" button

SELECT 
    C.Code AS course_code,
    C.[Name] AS course_name,
    P.[Name] AS professor,
    C.LectureRoom,
    C.LectureDay,
    C.LectureHour,
    C.LectureDuration,
    C.TutorialRoom,	
    C.TutorialDay,
    C.TutorialHour,
    C.TutorialDuration
FROM Course C
LEFT JOIN [User] P ON C.ProfessorID = P.UserID
LEFT JOIN Course_TA ta ON Ta.Course_Code = C.Code
LEFT JOIN JTA JTA ON JTA.Course_Code = C.Code
LEFT JOIN course_Student CS ON CS.Course_code = C.Code
WHERE C.Code = 'CIE206'
GROUP BY 
    C.Code, 
    C.[Name],
    P.[Name],
    C.LectureRoom,
    C.LectureDay,
    C.LectureHour,
    C.LectureDuration,
    C.TutorialRoom,
    C.TutorialDay,
    C.TutorialHour,
    C.TutorialDuration;


SELECT TA_ID
FROM Course_TA
WHERE Course_Code = 'CIE206';


SELECT Student_ID
FROM JTA
WHERE Course_Code = 'CIE206';