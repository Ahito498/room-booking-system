IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'UniversityManagementSystem')
BEGIN
    CREATE DATABASE UniversityManagementSystem;
END
GO

USE UniversityManagementSystem;
GO


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='User' AND xtype='U')
BEGIN
    CREATE TABLE [User] (
    UserID INT,
    [Password] VARCHAR(255) NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    UserType VARCHAR(30) NOT NULL CHECK (UserType IN ('Registrar', 'Professor', 'RoomServicesMember','Student','TA','CleaningStaffMember')),
	PRIMARY KEY (UserID)
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Room' AND xtype='U')
BEGIN
	CREATE TABLE Room (
		ID VARCHAR(50),
		Building VARCHAR(50) NOT NULL,
		[Floor] INT NOT NULL,
		[Zone] VARCHAR(50) Not Null,
		Number VARCHAR(20) NOT NULL,
		Capacity INT,
		AvailabilityStatus VARCHAR(20) CHECK (AvailabilityStatus IN ('Available', 'Closed')) Not Null Default 'Available',
		DailyCleaningStatus VARCHAR(20) CHECK (DailyCleaningStatus IN ('Done','In progress','Pending')) Not Null Default 'Pending',
		PRIMARY KEY (ID)
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Registrar' AND xtype='U')
Begin
	CREATE TABLE Registrar (
		ID INT,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='RoomServicesMember' AND xtype='U')
Begin
	CREATE TABLE RoomServicesMember (
		ID INT,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CleaningStaffMember' AND xtype='U')
Begin
	CREATE TABLE CleaningStaffMember (
		ID INT,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE	
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Professor' AND xtype='U')
Begin
	CREATE TABLE Professor (
		ID INT,
		OfficeRoom VARCHAR(50) Not Null,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE,
		FOREIGN KEY (OfficeRoom) REFERENCES Room(ID)
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TA' AND xtype='U')
Begin
	CREATE TABLE TA (
		ID INT,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE,
		OfficeRoom VARCHAR(50) NOT NULL,
		Quota INT NOT NULL Default 20
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Student' AND xtype='U')
Begin
	CREATE TABLE Student (
		ID INT,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES [User](UserID) ON DELETE CASCADE,
		Quota INT Default 3
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Admin' AND xtype='U')
Begin
	CREATE TABLE [Admin] (
		ID INT,
		[Password] VARCHAR(255) NOT NULL,
		[Name] VARCHAR(100) NOT NULL,
		Email VARCHAR(100) UNIQUE NOT NULL,
		UserType VARCHAR(30) NOT NULL Default 'Admin',
		PRIMARY KEY (ID)
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Course' AND xtype='U')
Begin
	CREATE TABLE Course (
		Code VARCHAR(25),
		[Name] VARCHAR(100) NOT NULL,
		ProfessorID INT Not Null,
		LectureRoom VARCHAR(50) Not Null,
		LectureDay VARCHAR(20) Not Null CHECK (LectureDay IN ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
		LectureHour TIME Not Null,
		LectureDuration INT Not Null,
		TutorialRoom VARCHAR(50) Not Null,
		TutorialDay VARCHAR(20) Not Null,
		TutorialHour TIME Not Null,
		TutorialDuration INT Not Null,
		PRIMARY KEY (Code),
		FOREIGN KEY (ProfessorID) REFERENCES Professor(ID)
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Course_Student' AND xtype='U')
Begin
	CREATE TABLE Course_Student (
		Student_ID INT,
		Course_Code VARCHAR(25),
		PRIMARY KEY (Student_ID, Course_Code),
		FOREIGN KEY (Student_ID) REFERENCES Student(ID),
		FOREIGN KEY (Course_Code) REFERENCES Course(Code)
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='JTA' AND xtype='U')
Begin
	CREATE TABLE JTA (
		Student_ID INT,
		Course_Code VARCHAR(25),
		PRIMARY KEY (Student_ID, Course_Code),
		FOREIGN KEY (Student_ID) REFERENCES Student(ID),
		FOREIGN KEY (Course_Code) REFERENCES Course(Code)
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Course_TA' AND xtype='U')
Begin
	CREATE TABLE Course_TA (
		TA_ID INT,
		Course_Code VARCHAR(25),
		PRIMARY KEY (TA_ID, Course_Code),
		FOREIGN KEY (TA_ID) REFERENCES TA(ID),
		FOREIGN KEY (Course_Code) REFERENCES Course(Code)
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='RequestOrReport' AND xtype='U')
Begin
	CREATE TABLE RequestOrReport (
		RID INT,
		UserID INT,
		Condition VARCHAR(20) CHECK (Condition IN ('Approved', 'Declined','Pending', 'Handled','In progress')),
		DayofR Date NOT NULL,
		HourofR TIME Not Null,
		DayofHandling Date NULL,
		HourofHandling TIME Null,
		RType VARCHAR(40) NOT NULL CHECK (RType IN ('ClinicBookingRequest','RoomBooking', 'CleaningRequest', 'SuppliesRequest','RoomChangeRequest','AdditionalQuotaRequest','Report')),
		PRIMARY KEY (RID)
);
END


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='RoomBooking' AND xtype='U')
Begin
	CREATE TABLE RoomBooking (
		ID INT,
		RoomID VARCHAR(50) Not Null,
		Reason TEXT,
		TimeSlotDay VARCHAR(20) Not Null,
		TimeSlotHour TIME Not Null,
		Duration INT Not Null CHECK (Duration > 0),
		FOREIGN KEY (RoomID) REFERENCES Room(ID),
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ClinicBookingRequest' AND xtype='U')
Begin
	CREATE TABLE ClinicBookingRequest (
		ID INT,
		RoomID VARCHAR(50) Not Null,
		Reason TEXT,
		TimeSlotDay VARCHAR(20) Not Null,
		TimeSlotHour TIME Not Null,
		Duration INT Not Null,
		CourseCode VARCHAR(25) Not Null,
		FOREIGN KEY (RoomID) REFERENCES Room(ID),
		FOREIGN KEY (CourseCode) REFERENCES Course(Code),
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Report' AND xtype='U')
Begin
	CREATE TABLE Report (
		ID INT,
		RoomID VARCHAR(50) Not Null,
		Complaint TEXT Not Null,
		FOREIGN KEY (RoomID) REFERENCES Room(ID),
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='AdditionalQuotaRequest' AND xtype='U')
Begin
	CREATE TABLE AdditionalQuotaRequest (
		ID INT,
		NumOfExtraHours INT Not Null,
		Reason TEXT Not Null,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='RoomChangeRequest' AND xtype='U')
Begin
	CREATE TABLE RoomChangeRequest (
		ID INT,
		NewRoomID VARCHAR(50),
		CourseCode VARCHAR(25) Not Null,
		LectureOrTutorial INT Not Null, -- 1 for Lecture, 2 for Tutorial
		FOREIGN KEY (NewRoomID) REFERENCES Room(ID),
		FOREIGN KEY (CourseCode) REFERENCES Course(Code),
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SuppliesRequest' AND xtype='U')
Begin
	CREATE TABLE SuppliesRequest (
		ID INT,
		ExpectedDeliveryDate Date Not Null,
		Supplies TEXT Not Null,
		PRIMARY KEY (ID),
		FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CleaningRequest' AND xtype='U')
Begin
	CREATE TABLE CleaningRequest (
		ID INT,
		RoomID VARCHAR(50),
		FOREIGN KEY (RoomID) REFERENCES Room(ID),
		PRIMARY KEY (ID),
		CONSTRAINT FK_CleaningRequest_Request FOREIGN KEY (ID) REFERENCES RequestOrReport(RID) ON DELETE CASCADE
);
End
