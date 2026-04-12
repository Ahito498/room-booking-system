SELECT 
    rb.ID AS BookingID,
    rb.RoomID AS RoomCode,
    rb.Reason,
    -- Format time slot as "DD/MM/YYYY HH:MM - HH:MM"
    CONVERT(VARCHAR, rr.DayofR, 103) + ' ' + 
    CONVERT(VARCHAR, rb.TimeSlotHour, 108) + ' - ' + 
    CONVERT(VARCHAR, DATEADD(MINUTE, rb.Duration, rb.TimeSlotHour), 108) AS TimeSlot,
    CASE 
        WHEN cbr.ID IS NOT NULL THEN 'Yes' 
        ELSE 'No' 
    END AS ForClinic,
    c.Name AS CourseName
FROM RequestOrReport rr
LEFT JOIN RoomBooking rb ON rr.RID = rb.ID
LEFT JOIN ClinicBookingRequest cbr ON rr.RID = cbr.ID
LEFT JOIN Course c ON cbr.CourseCode = c.Code
WHERE rr.UserID = 123;