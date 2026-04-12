SELECT rr.RID AS RequestID,
       cr.RoomID,
       rr.HourofR AS RequestTime
FROM CleaningRequest cr
JOIN RequestOrReport rr ON cr.ID = rr.RID
WHERE rr.RType = 'CleaningRequest'
ORDER BY rr.HourofR;


UPDATE Room             --for mark as done button--
SET DailyCleaningStatus = 'Done'  -- or 'In progress' / 'Pending'
WHERE ID = 'F004'; -- replace with selected RoomID from dropdown
