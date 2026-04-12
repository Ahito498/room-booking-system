
SELECT
  (SELECT COUNT(*) FROM Professor)                               AS NumProfessors,
  (SELECT COUNT(*) FROM TA)                                      AS NumTAs,
  (SELECT COUNT(*) FROM Student)                                 AS NumStudents,
  (SELECT COUNT(*) FROM RequestOrReport
    WHERE RType IN ('RoomBookingRequest','ClinicBookingRequest')
      AND Condition = 'Handled')                                 AS HandledBookingReqs,
  (SELECT COUNT(*) FROM RequestOrReport
    WHERE RType = 'Report'
      AND Condition = 'Handled')                                 AS HandledReports;