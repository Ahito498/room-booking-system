
SELECT 
    r.RoomID AS RoomCode,
    r.Complaint AS ComplaintDetails,
    -- Format submission datetime as "DD/MM/YYYY HH:MM"
    CONVERT(VARCHAR, rr.DayofR, 103) + ' ' + 
    CONVERT(VARCHAR, rr.HourofR, 108) AS SubmissionDateTime,
    rr.Condition AS Status
FROM RequestOrReport rr
JOIN Report r ON rr.RID = r.ID
WHERE rr.UserID = 123 
  AND rr.RType = 'Report';