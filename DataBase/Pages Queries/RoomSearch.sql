--___________________________________________________________________________________________________________________________________________________________________________
--___________________________________________________________________________________________________________________________________________________________________________

--Seraching for a room based on the usage of it

SELECT R.*
FROM Room R
LEFT JOIN Course C ON R.ID = C.LectureRoom OR R.ID = C.TutorialRoom
LEFT JOIN Professor P ON P.OfficeRoom = R.ID
LEFT JOIN TA T ON T.OfficeRoom = R.ID
LEFT JOIN [User] U ON U.UserID = P.ID OR U.UserID = T.ID
WHERE
    ('{CourseCode}' = '' OR C.Code = '{CourseCode}')
    AND ('{StaffName}' = '' OR U.Name LIKE '%' + '{StaffName}' + '%')
    AND (
        '{Type}' = ''
        OR ('{Type}' = 'Lecture' AND R.ID IN (SELECT LectureRoom FROM Course))
        OR ('{Type}' = 'Tutorial' AND R.ID IN (SELECT TutorialRoom FROM Course))
        OR ('{Type}' = 'Office' AND R.ID IN (
											SELECT OfficeRoom FROM Professor
											UNION
											SELECT OfficeRoom FROM TA
											)
		)
    )

--___________________________________________________________________________________________________________________________________________________________________________
--___________________________________________________________________________________________________________________________________________________________________________

--Seraching for a room based on its location

SELECT R.*
FROM Room R
WHERE
    ('{Building}' = '' OR R.Building = '{Building}')
    AND ('{Floor}' = '' OR R.[Floor] = 1)
    AND ('{Zone}' = '' OR R.[Zone] = '{Zone}')