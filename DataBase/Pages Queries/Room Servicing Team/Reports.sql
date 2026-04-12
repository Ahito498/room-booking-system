SELECT r.ID AS RequestID,
       r.RoomID,
       r.Complaint,
       rr.UserID,
       rr.HourofR AS RequestTime
FROM Report r
JOIN RequestOrReport rr ON r.ID = rr.RID
WHERE rr.RType = 'Report'
ORDER BY rr.HourofR;


UPDATE rr
SET rr.Condition = 'In progress'  -- or 'Handled'
FROM RequestOrReport rr
JOIN Report r ON rr.RID = r.ID
WHERE r.RoomID = 'F004';    --change it with the selected one--
