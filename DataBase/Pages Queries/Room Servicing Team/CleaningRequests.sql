SELECT cr.ID AS RequestID,
       cr.RoomID,
       rr.HourofR AS RequestTime,
       r.DailyCleaningStatus AS Condition
FROM CleaningRequest cr
JOIN RequestOrReport rr ON cr.ID = rr.RID
JOIN Room r ON cr.RoomID = r.ID
ORDER BY rr.HourofR;


-- Step 1: Declare variables
DECLARE @NewRID INT;
DECLARE @Now DATETIME = GETDATE();

-- Step 2: Get the next request ID
SELECT @NewRID = ISNULL(MAX(RID), 0) + 1 FROM RequestOrReport;

-- Step 3: Insert into RequestOrReport
INSERT INTO RequestOrReport (
    RID, UserID, Condition, DayofR, HourofR, DayofHandling, HourofHandling, RType
)
VALUES (
    @NewRID,
    20200,  -- Replace with current user ID
    'Pending',  -- or 'Pending', depending on your design
    CAST(@Now AS DATE),
    CAST(@Now AS TIME),
    CAST(@Now AS DATE),
    CAST(@Now AS TIME),
    'CleaningRequest'
);






-- Step 4: Insert into CleaningRequest
INSERT INTO CleaningRequest (ID, RoomID)
VALUES (
    @NewRID,
    'F004'  -- Replace with selected room
);




