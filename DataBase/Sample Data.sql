INSERT INTO [User] (UserID, [Password], [Name], Email, UserType) VALUES
(1001, 'pass1', 'John Doe', 'john@uni.edu', 'Student'), (1002, 'pass2', 'Alice Smith', 'alice@uni.edu', 'TA'), (1003, 'pass3', 'Prof. Ahmed', 'ahmed@uni.edu', 'Professor'),
(1004, 'pass4', 'Maria Garcia', 'maria@uni.edu', 'Registrar'), (1005, 'pass5', 'Emma Wilson', 'emma@uni.edu', 'RoomServicesMember'), (1006, 'pass6', 'Liam Brown', 'liam@uni.edu', 'CleaningStaffMember'),
(1007, 'pass7', 'Sophia Lee', 'sophia@uni.edu', 'Student'), (1008, 'pass8', 'Noah Clark', 'noah@uni.edu', 'TA'), (1009, 'pass9', 'Olivia Martinez', 'olivia@uni.edu', 'Professor'),
(1010, 'pass10', 'James Davis', 'james@uni.edu', 'Student'), (1011, 'pass11', 'Emily Chen', 'echen@uni.edu', 'Student'),(1012, 'pass12', 'Michael Rodriguez', 'mrodriguez@uni.edu', 'Professor'),
(1013, 'pass13', 'Ethan Anderson', 'ethan@uni.edu', 'Student'), (1014, 'pass14', 'Ava White', 'ava@uni.edu', 'Student'), (1015, 'pass15', 'Michael Johnson', 'michael@uni.edu', 'Student'),
(1016, 'pass16', 'Isabella Thompson', 'isabella@uni.edu', 'Student'), (1017, 'pass17', 'William Harris', 'william@uni.edu', 'TA'), (1018, 'pass18', 'Mia Martin', 'mia@uni.edu', 'TA'),
(1019, 'pass19', 'Benjamin Taylor', 'benjamin@uni.edu', 'Professor'), (1020, 'pass20', 'Charlotte Wilson', 'charlotte@uni.edu', 'Professor'), (1021, 'pass21', 'Daniel Moore', 'daniel@uni.edu', 'Registrar'),
(1022, 'pass22', 'Amelia Jackson', 'amelia@uni.edu', 'Registrar'), (1023, 'pass23', 'Lucas Lee', 'lucas@uni.edu', 'RoomServicesMember'), (1024, 'pass24', 'Harper Scott', 'harper@uni.edu', 'RoomServicesMember'),
(1025, 'pass25', 'Henry Green', 'henry@uni.edu', 'CleaningStaffMember'), (1026, 'pass26', 'Evelyn Adams', 'evelyn@uni.edu', 'CleaningStaffMember'), (1027, 'pass27', 'Alexander Baker', 'alexander@uni.edu', 'Student'),
(1028, 'pass28', 'Abigail Nelson', 'abigail@uni.edu', 'Student'), (1029, 'pass29', 'Sebastian Carter', 'sebastian@uni.edu', 'Student'), (1030, 'pass30', 'Emily Mitchell', 'emily@uni.edu', 'Student'),
(1031, 'pass31', 'Jackson Perez', 'jackson@uni.edu', 'TA'), (1032, 'pass32', 'Madison Roberts', 'madison@uni.edu', 'TA'), (1033, 'pass33', 'Aiden Turner', 'aiden@uni.edu', 'Professor'),
(1034, 'pass34', 'Scarlett Phillips', 'scarlett@uni.edu', 'Professor'), (1035, 'pass35', 'Samuel Campbell', 'samuel@uni.edu', 'Registrar'), (1036, 'pass36', 'Victoria Parker', 'victoria@uni.edu', 'Registrar'),
(1037, 'pass37', 'Joseph Evans', 'joseph@uni.edu', 'RoomServicesMember'), (1038, 'pass38', 'Luna Edwards', 'luna@uni.edu', 'RoomServicesMember'), (1039, 'pass39', 'David Collins', 'david@uni.edu', 'CleaningStaffMember'),
(1040, 'pass40', 'Penelope Stewart', 'penelope@uni.edu', 'CleaningStaffMember'), (1041, 'pass41', 'Leo Sanchez', 'leo@uni.edu', 'Student'), (1042, 'pass42', 'Chloe Morris', 'chloe@uni.edu', 'Student'),
(1043, 'pass43', 'Gabriel Rogers', 'gabriel@uni.edu', 'Student'), (1044, 'pass44', 'Zoey Reed', 'zoey@uni.edu', 'Student'), (1045, 'pass45', 'Julian Cook', 'julian@uni.edu', 'TA'),
(1046, 'pass46', 'Layla Morgan', 'layla@uni.edu', 'TA'), (1047, 'pass47', 'Christopher Bell', 'christopher@uni.edu', 'Professor'), (1048, 'pass48', 'Nora Murphy', 'nora@uni.edu', 'Professor'),
(1049, 'pass49', 'Ryan Rivera', 'ryan@uni.edu', 'Registrar'), (1050, 'pass50', 'Hannah Cooper', 'hannah@uni.edu', 'Registrar');

INSERT INTO Student (ID, Quota) VALUES
(1001, 3), (1007, 3), (1010, 3), (1011, 3), (1013, 3), (1014, 3), (1015, 3), (1016, 3), (1027, 3), (1028, 3), (1029, 3), (1030, 3), (1041, 3), (1042, 3), (1043, 3), (1044, 3);

INSERT INTO Room (ID, Building, [Floor], [Zone], Number, Capacity, AvailabilityStatus, DailyCleaningStatus) VALUES
('AB-013-A', 'Academic Building', 0, 'A', '13', 30, 'Available', 'Pending'),
('AB-101-B', 'Academic Building', 1, 'B', '01', 50, 'Available', 'Pending'),
('AB-202-C', 'Academic Building', 2, 'C', '02', 20, 'Closed', 'Pending'),
('AB-303-D', 'Academic Building', 3, 'D', '03', 40, 'Available', 'Pending'),
('AB-014-E', 'Academic Building', 0, 'E', '14', 35, 'Available', 'Pending'),
('AB-102-A', 'Academic Building', 1, 'A', '02', 25, 'Available', 'Pending'),
('AB-203-B', 'Academic Building', 2, 'B', '03', 45, 'Closed', 'Pending'),
('AB-304-C', 'Academic Building', 3, 'C', '04', 30, 'Available', 'Pending'),
('AB-015-D', 'Academic Building', 0, 'D', '15', 50, 'Available', 'Pending'),
('HB-016-E', 'Helmy Building', 0, 'E', '16', 20, 'Available', 'Pending'),
('HB-103-A', 'Helmy Building', 1, 'A', '03', 40, 'Closed', 'Pending'),
('HB-204-B', 'Helmy Building', 2, 'B', '04', 25, 'Available', 'Pending'),
('HB-305-C', 'Helmy Building', 3, 'C', '05', 35, 'Available', 'Pending'),
('HB-017-D', 'Helmy Building', 0, 'D', '17', 45, 'Available', 'Pending'),
('HB-104-E', 'Helmy Building', 1, 'E', '04', 30, 'Closed', 'Pending'),
('HB-205-A', 'Helmy Building', 2, 'A', '05', 50, 'Available', 'Pending'),
('NB-018-B', 'Nano Building', 0, 'B', '18', 20, 'Available', 'Pending'),
('NB-105-C', 'Nano Building', 1, 'C', '05', 40, 'Available', 'Pending'),
('NB-206-D', 'Nano Building', 2, 'D', '06', 60, 'Closed', 'Pending'),
('NB-306-E', 'Nano Building', 3, 'E', '06', 25, 'Available', 'Pending'),
('NB-019-A', 'Nano Building', 0, 'A', '19', 35, 'Available', 'Pending'),
('NB-106-B', 'Nano Building', 1, 'B', '06', 45, 'Available', 'Pending'),
('NB-207-C', 'Nano Building', 2, 'C', '07', 30, 'Closed', 'Pending'),
('NB-307-D', 'Nano Building', 3, 'D', '07', 50, 'Available', 'Pending');

INSERT INTO TA (ID, OfficeRoom, Quota) VALUES
(1002, 'AB-013-A', 20), (1008, 'AB-101-B', 20), (1017, 'AB-202-C', 20), (1018, 'AB-303-D', 20), (1031, 'AB-014-E', 20), (1032, 'AB-102-A', 20), (1045, 'AB-203-B', 20), (1046, 'AB-304-C', 20);

INSERT INTO Professor (ID, OfficeRoom) VALUES
(1003, 'AB-015-D'), (1009, 'HB-016-E'), (1012, 'NB-307-D'), (1019, 'HB-103-A'), (1020, 'HB-204-B'), (1033, 'HB-305-C'), (1034, 'HB-017-D'), (1047, 'HB-104-E'), (1048, 'HB-205-A');

INSERT INTO Registrar (ID) VALUES
(1021), (1022), (1035), (1036), (1049), (1050);

INSERT INTO RoomServicesMember (ID) VALUES
(1023), (1024), (1037), (1038);

INSERT INTO CleaningStaffMember (ID) VALUES
(1025), (1026), (1039), (1040);

INSERT INTO [Admin] (ID, [Password], [Name], Email) VALUES
(1, 'admin1', 'Sarah Kamal', 'sarah.kamal@zewail.edu.eg'), (2, 'admin2', 'Omar Hany', 'omar.hany@zewail.edu.eg'), (3, 'admin3', 'Laila Nasser', 'laila.nasser@zewail.edu.eg');

INSERT INTO Course (Code, [Name], ProfessorID, LectureRoom, LectureDay, LectureHour, LectureDuration, TutorialRoom, TutorialDay, TutorialHour, TutorialDuration) VALUES
('CIE101', 'Introduction to Infrastructure', 1003, 'AB-101-B', 'Monday', '10:00', 120, 'AB-102-A', 'Wednesday', '14:00', 90),
('MATH202', 'Calculus II', 1009, 'HB-204-B', 'Wednesday', '14:00', 90, 'HB-103-A', 'Friday', '10:00', 60),
('CIE102', 'Structural Analysis', 1003, 'AB-202-C', 'Tuesday', '09:00', 120, 'AB-102-A', 'Thursday', '13:00', 90),
('MATH203', 'Linear Algebra', 1009, 'HB-204-B', 'Monday', '13:00', 90, 'HB-103-A', 'Wednesday', '10:00', 90),
('PHY101', 'Classical Mechanics', 1019, 'NB-206-D', 'Wednesday', '10:00', 120, 'NB-018-B', 'Friday', '14:00', 60),
('CHE201', 'Organic Chemistry', 1020, 'AB-203-B', 'Thursday', '11:00', 90, 'AB-014-E', 'Monday', '15:00', 90),
('CS101', 'Intro to Programming', 1033, 'HB-305-C', 'Friday', '09:00', 120, 'HB-016-E', 'Tuesday', '11:00', 60),
('EE202', 'Circuit Theory', 1034, 'NB-207-C', 'Tuesday', '14:00', 90, 'NB-106-B', 'Thursday', '09:00', 90),
('BIO103', 'Cell Biology', 1047, 'AB-304-C', 'Monday', '15:00', 90, 'AB-015-D', 'Wednesday', '16:00', 60),
('ARCH201', 'Architectural Design', 1048, 'HB-205-A', 'Wednesday', '08:00', 180, 'HB-104-E', 'Friday', '13:00', 120),
('ENV101', 'Environmental Science', 1019, 'NB-019-A', 'Thursday', '10:00', 90, 'NB-105-C', 'Monday', '14:00', 60),
('MECH203', 'Thermodynamics', 1020, 'AB-304-C', 'Friday', '13:00', 120, 'AB-203-B', 'Tuesday', '08:00', 90),
('CS202', 'Data Structures', 1033, 'HB-103-A', 'Tuesday', '11:00', 90, 'HB-204-B', 'Thursday', '15:00', 60),
('EE301', 'Electronics', 1034, 'NB-105-C', 'Monday', '14:00', 120, 'NB-206-D', 'Wednesday', '11:00', 90),
('MATH301', 'Differential Equations', 1047, 'AB-102-A', 'Wednesday', '09:00', 90, 'AB-304-C', 'Friday', '10:00', 60),
('PHY202', 'Electromagnetism', 1048, 'HB-305-C', 'Thursday', '15:00', 120, 'HB-016-E', 'Monday', '16:00', 90),
('CHEM102', 'Inorganic Chemistry', 1019, 'NB-207-C', 'Friday', '10:00', 90, 'NB-106-B', 'Tuesday', '13:00', 60),
('CIE201', 'Geotechnical Engineering', 1020, 'AB-101-B', 'Monday', '08:00', 120, 'AB-014-E', 'Wednesday', '14:00', 90),
('CS301', 'Algorithms', 1033, 'HB-204-B', 'Tuesday', '15:00', 90, 'HB-103-A', 'Thursday', '11:00', 60),
('EE401', 'Power Systems', 1034, 'NB-206-D', 'Wednesday', '13:00', 120, 'NB-018-B', 'Friday', '09:00', 90),
('BIO202', 'Genetics', 1047, 'AB-304-C', 'Thursday', '09:00', 90, 'AB-015-D', 'Monday', '15:00', 60),
('ARCH301', 'Urban Planning', 1048, 'HB-205-A', 'Friday', '11:00', 180, 'HB-104-E', 'Tuesday', '14:00', 120),
('ENV201', 'Climate Studies', 1019, 'NB-019-A', 'Monday', '14:00', 90, 'NB-105-C', 'Wednesday', '10:00', 60),
('MECH301', 'Fluid Mechanics', 1020, 'AB-304-C', 'Tuesday', '10:00', 120, 'AB-203-B', 'Thursday', '13:00', 90),
('CS401', 'Database Systems', 1033, 'HB-103-A', 'Wednesday', '16:00', 90, 'HB-204-B', 'Friday', '11:00', 60),
('EE501', 'Control Systems', 1034, 'NB-105-C', 'Thursday', '11:00', 120, 'NB-206-D', 'Monday', '14:00', 90);


INSERT INTO Course_Student (Student_ID, Course_Code) VALUES
(1001, 'CIE101'), (1001, 'MATH202'), (1001, 'PHY101'), (1007, 'MATH202'), (1007, 'CS101'), (1007, 'EE202'), (1010, 'CHE201'), (1010, 'BIO103'), (1010, 'ENV101'), (1011, 'EE501'),
(1011, 'CS401'), (1013, 'CIE102'), (1013, 'MATH203'), (1013, 'ARCH201'), (1014, 'PHY101'), (1014, 'CS101'), (1014, 'MECH203'), (1015, 'EE202'), (1015, 'MATH301'), (1015, 'CS202'),
(1016, 'BIO103'), (1016, 'CHEM102'), (1016, 'ENV201'), (1027, 'ARCH201'), (1027, 'CIE201'), (1027, 'MECH301'), (1028, 'CS301'), (1028, 'EE401'), (1028, 'MATH301'),  (1029, 'BIO202'),
(1029, 'ARCH301'), (1029, 'ENV201'), (1030, 'CS401'), (1030, 'EE501'), (1030, 'PHY202'), (1041, 'CIE101'), (1041, 'MATH202'), (1042, 'CHE201'), (1042, 'BIO103'), (1043, 'EE202'), (1043, 'CS101');

INSERT INTO Course_TA (TA_ID, Course_Code) VALUES
(1002, 'CIE101'), (1002, 'MATH202'), (1002, 'PHY101'), (1008, 'CS101'), (1008, 'EE202'), (1008, 'BIO103'), (1017, 'CHE201'), (1017, 'ARCH201'), (1017, 'ENV101'), (1018, 'MECH203'),
(1018, 'CS202'), (1018, 'EE301'), (1031, 'MATH301'), (1031, 'PHY202'), (1032, 'CHEM102'), (1032, 'CIE201'), (1045, 'CS301'), (1045, 'EE401'), (1046, 'BIO202'), (1046, 'ARCH301');

INSERT INTO JTA (Student_ID, Course_Code) VALUES
(1001, 'CIE101'), (1001, 'MATH202'), (1007, 'CS101'), (1007, 'EE202'), (1010, 'CHE201'), (1013, 'MATH203'),
(1014, 'PHY101'), (1015, 'EE202'), (1027, 'ARCH201'), (1028, 'CS301'), (1041, 'CIE101'), (1043, 'CS101');

INSERT INTO RequestOrReport (RID, UserID, Condition, DayofR, HourofR, DayofHandling, HourofHandling, RType) VALUES
-- ClinicBookingRequest (10) - Only by JTAs
(1, 1001, 'Approved', '2023-09-10', '09:00', '2023-09-11', '10:00', 'ClinicBookingRequest'), (2, 1007, 'Pending', '2023-09-11', '10:30', NULL, NULL, 'ClinicBookingRequest'),
(3, 1010, 'Approved', '2023-09-12', '11:00', '2023-09-12', '14:00', 'ClinicBookingRequest'), (4, 1013, 'Declined', '2023-09-13', '13:00', '2023-09-14', '09:00', 'ClinicBookingRequest'),
(5, 1014, 'Approved', '2023-09-14', '14:30', '2023-09-15', '11:00', 'ClinicBookingRequest'), (6, 1015, 'Pending', '2023-09-15', '15:00', NULL, NULL, 'ClinicBookingRequest'),
(7, 1027, 'Approved', '2023-09-16', '16:00', '2023-09-17', '10:30', 'ClinicBookingRequest'), (8, 1028, 'Handled', '2023-09-17', '09:30', '2023-09-18', '15:00', 'ClinicBookingRequest'),
(9, 1041, 'Approved', '2023-09-18', '10:00', '2023-09-19', '11:30', 'ClinicBookingRequest'), (10, 1043, 'Pending', '2023-09-19', '11:30', NULL, NULL, 'ClinicBookingRequest'),
-- RoomBooking (10) - By Students, TAs, Professors
(11, 1001, 'Approved', '2023-09-20', '09:00', '2023-09-21', '10:00', 'RoomBooking'), (12, 1002, 'Pending', '2023-09-21', '10:30', NULL, NULL, 'RoomBooking'),
(13, 1003, 'Approved', '2023-09-22', '11:00', '2023-09-22', '14:00', 'RoomBooking'), (14, 1007, 'Declined', '2023-09-23', '13:00', '2023-09-24', '09:00', 'RoomBooking'),
(15, 1008, 'Approved', '2023-09-24', '14:30', '2023-09-25', '11:00', 'RoomBooking'), (16, 1009, 'Pending', '2023-09-25', '15:00', NULL, NULL, 'RoomBooking'),
(17, 1010, 'Approved', '2023-09-26', '16:00', '2023-09-27', '10:30', 'RoomBooking'), (18, 1017, 'Handled', '2023-09-27', '09:30', '2023-09-28', '15:00', 'RoomBooking'),
(19, 1019, 'Approved', '2023-09-28', '10:00', '2023-09-29', '11:30', 'RoomBooking'), (20, 1020, 'Pending', '2023-09-29', '11:30', NULL, NULL, 'RoomBooking'),
-- CleaningRequest (10) - Only by RoomServicesTeam
(21, 1005, 'Approved', '2023-10-01', '08:00', '2023-10-01', '09:00', 'CleaningRequest'), (22, 1023, 'Pending', '2023-10-02', '09:30', NULL, NULL, 'CleaningRequest'),
(23, 1024, 'Approved', '2023-10-03', '10:00', '2023-10-03', '11:00', 'CleaningRequest'), (24, 1037, 'Declined', '2023-10-04', '11:30', '2023-10-05', '08:00', 'CleaningRequest'),
(25, 1038, 'Approved', '2023-10-05', '13:00', '2023-10-06', '10:00', 'CleaningRequest'), (26, 1005, 'Pending', '2023-10-06', '14:30', NULL, NULL, 'CleaningRequest'),
(27, 1023, 'Approved', '2023-10-07', '15:00', '2023-10-08', '11:30', 'CleaningRequest'), (28, 1024, 'Handled', '2023-10-08', '16:00', '2023-10-09', '14:00', 'CleaningRequest'),
(29, 1037, 'Approved', '2023-10-09', '08:30', '2023-10-10', '09:30', 'CleaningRequest'), (30, 1038, 'Pending', '2023-10-10', '10:00', NULL, NULL, 'CleaningRequest'),
-- SuppliesRequest (10) - Only by CleaningStaff
(31, 1006, 'Approved', '2023-10-11', '08:00', '2023-10-11', '09:00', 'SuppliesRequest'), (32, 1025, 'Pending', '2023-10-12', '09:30', NULL, NULL, 'SuppliesRequest'),
(33, 1026, 'Approved', '2023-10-13', '10:00', '2023-10-13', '11:00', 'SuppliesRequest'), (34, 1039, 'Declined', '2023-10-14', '11:30', '2023-10-15', '08:00', 'SuppliesRequest'),
(35, 1040, 'Approved', '2023-10-15', '13:00', '2023-10-16', '10:00', 'SuppliesRequest'), (36, 1006, 'Pending', '2023-10-16', '14:30', NULL, NULL, 'SuppliesRequest'),
(37, 1025, 'Approved', '2023-10-17', '15:00', '2023-10-18', '11:30', 'SuppliesRequest'), (38, 1026, 'Handled', '2023-10-18', '16:00', '2023-10-19', '14:00', 'SuppliesRequest'),
(39, 1039, 'Approved', '2023-10-19', '08:30', '2023-10-20', '09:30', 'SuppliesRequest'), (40, 1040, 'Pending', '2023-10-20', '10:00', NULL, NULL, 'SuppliesRequest'),
-- RoomChangeRequest (10) - By TAs and Professors
(41, 1002, 'Approved', '2023-10-21', '09:00', '2023-10-22', '10:00', 'RoomChangeRequest'), (42, 1003, 'Pending', '2023-10-22', '10:30', NULL, NULL, 'RoomChangeRequest'),
(43, 1008, 'Approved', '2023-10-23', '11:00', '2023-10-23', '14:00', 'RoomChangeRequest'), (44, 1009, 'Declined', '2023-10-24', '13:00', '2023-10-25', '09:00', 'RoomChangeRequest'),
(45, 1017, 'Approved', '2023-10-25', '14:30', '2023-10-26', '11:00', 'RoomChangeRequest'), (46, 1019, 'Pending', '2023-10-26', '15:00', NULL, NULL, 'RoomChangeRequest'),
(47, 1020, 'Approved', '2023-10-27', '16:00', '2023-10-28', '10:30', 'RoomChangeRequest'), (48, 1033, 'Handled', '2023-10-28', '09:30', '2023-10-29', '15:00', 'RoomChangeRequest'),
(49, 1034, 'Approved', '2023-10-29', '10:00', '2023-10-30', '11:30', 'RoomChangeRequest'), (50, 1047, 'Pending', '2023-10-30', '11:30', NULL, NULL, 'RoomChangeRequest'),
-- AdditionalQuotaRequest (10) - By Students and TAs
(51, 1001, 'Approved', '2023-11-01', '09:00', '2023-11-02', '10:00', 'AdditionalQuotaRequest'), (52, 1002, 'Pending', '2023-11-02', '10:30', NULL, NULL, 'AdditionalQuotaRequest'),
(53, 1007, 'Approved', '2023-11-03', '11:00', '2023-11-03', '14:00', 'AdditionalQuotaRequest'), (54, 1008, 'Declined', '2023-11-04', '13:00', '2023-11-05', '09:00', 'AdditionalQuotaRequest'),
(55, 1010, 'Approved', '2023-11-05', '14:30', '2023-11-06', '11:00', 'AdditionalQuotaRequest'), (56, 1013, 'Pending', '2023-11-06', '15:00', NULL, NULL, 'AdditionalQuotaRequest'),
(57, 1015, 'Approved', '2023-11-07', '16:00', '2023-11-08', '10:30', 'AdditionalQuotaRequest'), (58, 1017, 'Handled', '2023-11-08', '09:30', '2023-11-09', '15:00', 'AdditionalQuotaRequest'),
(59, 1027, 'Approved', '2023-11-09', '10:00', '2023-11-10', '11:30', 'AdditionalQuotaRequest'), (60, 1028, 'Pending', '2023-11-10', '11:30', NULL, NULL, 'AdditionalQuotaRequest'),
-- Report (10) - By Students, TAs, Professors
(61, 1001, 'Approved', '2023-11-11', '09:00', '2023-11-12', '10:00', 'Report'), (62, 1002, 'Pending', '2023-11-12', '10:30', NULL, NULL, 'Report'),
(63, 1003, 'Approved', '2023-11-13', '11:00', '2023-11-13', '14:00', 'Report'), (64, 1007, 'Declined', '2023-11-14', '13:00', '2023-11-15', '09:00', 'Report'),
(65, 1009, 'Approved', '2023-11-15', '14:30', '2023-11-16', '11:00', 'Report'), (66, 1010, 'Pending', '2023-11-16', '15:00', NULL, NULL, 'Report'),
(67, 1019, 'Approved', '2023-11-17', '16:00', '2023-11-18', '10:30', 'Report'), (68, 1020, 'Handled', '2023-11-18', '09:30', '2023-11-19', '15:00', 'Report'),
(69, 1033, 'Approved', '2023-11-19', '10:00', '2023-11-20', '11:30', 'Report'), (70, 1047, 'Pending', '2023-11-20', '11:30', NULL, NULL, 'Report');


INSERT INTO ClinicBookingRequest (ID, RoomID, Reason, TimeSlotDay, TimeSlotHour, Duration, CourseCode) VALUES
(1, 'AB-101-B', 'Weekly office hours', 'Monday', '13:00', 60, 'CIE101'), (2, 'HB-204-B', 'Exam preparation', 'Wednesday', '14:00', 90, 'MATH202'),
(3, 'NB-206-D', 'Lab assistance', 'Friday', '10:00', 120, 'PHY101'), (4, 'AB-203-B', 'Project consultation', 'Thursday', '11:00', 60, 'CHE201'),
(5, 'HB-305-C', 'Code review', 'Tuesday', '15:00', 90, 'CS101'), (6, 'NB-207-C', 'Circuit debugging', 'Monday', '16:00', 60, 'EE202'),
(7, 'AB-304-C', 'Research discussion', 'Wednesday', '09:00', 120, 'BIO103'), (8, 'HB-205-A', 'Design review', 'Friday', '13:00', 90, 'ARCH201'),
(9, 'NB-019-A', 'Environmental study', 'Thursday', '14:00', 60, 'ENV101'), (10, 'AB-304-C', 'Thermo problems', 'Tuesday', '10:00', 90, 'MECH203');

INSERT INTO RoomBooking (ID, RoomID, Reason, TimeSlotDay, TimeSlotHour, Duration) VALUES
(11, 'AB-101-B', 'Study group meeting', 'Monday', '18:00', 120), (12, 'HB-204-B', 'Club event', 'Tuesday', '17:30', 180),
(13, 'NB-206-D', 'Thesis defense', 'Wednesday', '14:00', 120), (14, 'AB-203-B', 'Faculty meeting', 'Thursday', '10:00', 90),
(15, 'HB-305-C', 'Workshop', 'Friday', '15:00', 240), (16, 'NB-207-C', 'Guest lecture', 'Monday', '11:00', 90),
(17, 'AB-304-C', 'Department seminar', 'Tuesday', '13:00', 120), (18, 'HB-205-A', 'Student council', 'Wednesday', '16:00', 60),
(19, 'NB-019-A', 'Alumni event', 'Thursday', '19:00', 180), (20, 'AB-304-C', 'Research symposium', 'Friday', '09:00', 300);

INSERT INTO CleaningRequest (ID, RoomID) VALUES
(21, 'AB-101-B'), (22, 'HB-204-B'), (23, 'NB-206-D'), (24, 'AB-203-B'), (25, 'HB-305-C'), (26, 'NB-207-C'), (27, 'AB-304-C'), (28, 'HB-205-A'), (29, 'NB-019-A'), (30, 'AB-304-C');

INSERT INTO SuppliesRequest (ID, ExpectedDeliveryDate, Supplies) VALUES
(31, '2023-10-12', 'Brooms, mops, detergents'), (32, '2023-10-13', 'Trash bags, gloves'), (33, '2023-10-14', 'Disinfectants, paper towels'), (34, '2023-10-15', 'Floor polish, air fresheners'),
(35, '2023-10-16', 'Cleaning cloths, sponges'), (36, '2023-10-17', 'Window cleaners, squeegees'), (37, '2023-10-18', 'Toilet papers, hand soaps'),
(38, '2023-10-19', 'Dustpans, brushes'), (39, '2023-10-20', 'Microfiber cloths, sanitizers'), (40, '2023-10-21', 'Vacuum bags, floor cleaners');

INSERT INTO RoomChangeRequest (ID, NewRoomID, CourseCode, LectureOrTutorial) VALUES
(41, 'AB-102-A', 'CIE101', 1), (42, 'HB-103-A', 'MATH202', 2), (43, 'NB-105-C', 'PHY101', 1), (44, 'AB-014-E', 'CHE201', 2), (45, 'HB-016-E', 'CS101', 1),
(46, 'NB-106-B', 'EE202', 2), (47, 'AB-015-D', 'BIO103', 1), (48, 'HB-017-D', 'ARCH201', 2), (49, 'NB-018-B', 'ENV101', 1), (50, 'AB-101-B', 'MECH203', 2);

INSERT INTO AdditionalQuotaRequest (ID, NumOfExtraHours, Reason) VALUES
(51, 2, 'Group study'), (52, 3, 'Research work'), (53, 1, 'Thesis writing'), (54, 4, 'Project development'), (55, 2, 'Exam preparation'), 
(56, 3, 'Coursework'), (57, 1, 'Meeting with advisor'), (58, 5, 'Workshop preparation'), (59, 2, 'Faculty meeting'), (60, 3, 'Special lecture');

INSERT INTO Report (ID, RoomID, Complaint) VALUES
(61, 'AB-101-B', 'Broken projector in classroom'), (62, 'HB-204-B', 'Leaking ceiling during rain'), (63, 'NB-206-D', 'Air conditioning not working'), (64, 'AB-203-B', 'Damaged chairs need replacement'),
(65, 'HB-305-C', 'Electrical outlet sparking'), (66, 'NB-207-C', 'Broken lab equipment'), (67, 'AB-304-C', 'Window wont close properly'),
(68, 'HB-205-A', 'Door lock malfunction'), (69, 'NB-019-A', 'Strong chemical smell in room'), (70, 'AB-304-C', 'Water fountain not working');
