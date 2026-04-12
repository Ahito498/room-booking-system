UPDATE Room
SET AvailabilityStatus = 
    CASE 
        WHEN AvailabilityStatus = 'Available' THEN 'Closed'
        ELSE 'Available'
    END
WHERE ID = 'F004'; -- Replace with selected Room ID


SELECT ID AS [Room ID], AvailabilityStatus AS [Condition]
FROM Room
ORDER BY ID;
