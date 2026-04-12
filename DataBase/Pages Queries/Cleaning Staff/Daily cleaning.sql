SELECT ID AS RoomID, DailyCleaningStatus AS Condition
FROM Room
ORDER BY ID;




UPDATE Room
SET DailyCleaningStatus = 'In progress'  -- or 'Done' or 'Pending'
WHERE ID = 'F004'; -- replace with the selected Room ID from the dropdown
