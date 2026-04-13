# University Room Management System

A full-stack university room booking and facility management web application built with **ASP.NET Core Razor Pages**, **C#**, **MSSQL**, and **Entity Framework Core**. Built from scratch as part of a university database systems project at Zewail City of Science and Technology.

![ASP.NET Core](https://img.shields.io/badge/ASP.NET%20Core-8.0-purple.svg)
![C#](https://img.shields.io/badge/C%23-Full%20Stack-blue.svg)
![MSSQL](https://img.shields.io/badge/Database-MSSQL-red.svg)
![EF Core](https://img.shields.io/badge/ORM-Entity%20Framework%20Core-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

---

## Overview

The University Room Management System is a multi-role web platform that handles room booking, course scheduling, cleaning operations, and facility reporting across a university campus. Each user type has a dedicated dashboard with role-specific functionality, backed by a fully relational MSSQL database.

The system was built and **tested live on localhost** with real sample data covering multiple buildings, rooms, courses, professors, students, TAs, and cleaning staff.

---

## Live Screenshots

### Reports Management
Facility reports with filterable conditions (In Progress, Pending, Resolved). Staff can view and update complaint statuses in real time.

> Reports table showing Request ID, Room ID, Complaint description, Requestor Name, Date, Time, and Condition — with dropdown update functionality.

### Quota Request Management
Room Services Team can approve or reject quota requests submitted by Students and TAs for extra room hours.

> Quota Requests table with Approve/Reject dropdown actions per request, showing User Type, Extra Hours requested, and Reason.

### Cleaning Request Management
Cleaning staff submit and track room cleaning requests. Requests show condition status: Pending, In Progress, Approved, Declined, Handled.

> Cleaning Requests table showing Request ID, Room ID, Condition, Date, Time, and Requestor — with room selection dropdown to submit new requests.

### Room Condition Management
Room Services Team can toggle room availability status (Available/Closed) across all campus buildings and floors.

> Full room condition list covering AB, HB, and NB buildings with real-time toggle functionality.

### Course Management (Registrar)
Registrar can add new courses with full scheduling details (lecture room, day, hour, duration, tutorial details) and manage existing courses with Edit/Delete actions.

> Course form with fields: Course Code, Course Name, Professor, TAs IDs, JTAs IDs, Students IDs, Lecture Room/Day/Hour/Duration, Tutorial Room/Day/Hour/Duration.

### Course View (Professor / Student)
Professors and students see their enrolled courses in card format showing: Course Name, Professor, TA, JTA, Number of Students.

---

## Features

### Multi-Role Authentication
Six distinct user roles, each with a dedicated navigation menu and access-controlled pages:

| Role | Key Capabilities |
|------|-----------------|
| **Admin** | User management, system stats, create users |
| **Professor** | View assigned courses, room booking, submit reports |
| **Student** | Room search, booking, view courses, stats |
| **TA** | Room booking, quota requests, tutorial management |
| **Registrar** | Course creation/editing, room assignment, scheduling |
| **Cleaning Staff / Room Services** | Cleaning requests, daily cleaning, supplies, room conditions, quota approvals |

### Core Modules

**Room Search & Booking**
- Search available rooms by building, floor, zone, and capacity
- Book rooms for lectures or tutorials
- Real-time availability status tracking

**Reports System**
- Submit maintenance/complaint reports for specific rooms
- Filter reports by condition (Pending, In Progress, Resolved)
- Update report conditions with dropdown actions

**Quota Request System**
- Students and TAs request extra room hours with justification
- Room Services Team approves or rejects requests
- Full audit trail with request timestamps

**Cleaning Management**
- Submit cleaning requests for specific rooms
- Daily cleaning schedule tracking
- Supply request management
- Room condition toggling (Available/Closed)

**Course Management (Registrar)**
- Full CRUD for courses: code, name, professor assignment
- Assign TAs, JTAs, and students via comma-separated IDs
- Schedule lecture and tutorial rooms with day/hour/duration
- View all existing courses with Edit/Delete actions

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Backend | ASP.NET Core 8.0 — Razor Pages |
| Language | C# |
| ORM | Entity Framework Core (Code-First) |
| Database | Microsoft SQL Server (MSSQL) |
| Frontend | HTML, CSS, Bootstrap, JavaScript |
| Auth | Session-based login with role routing |
| Architecture | MVC-style Razor Pages (MVVM) |

---

## Database Schema

The system uses a fully relational MSSQL database with 10+ tables:

```
User (UserID, Name, Email, Password, UserType)
├── Admin
├── Professor  
├── Student (Quota field)
├── TA (Quota field)
├── Registrar
├── CleaningStaffMember
└── RoomServicesMember

Room (ID, Building, Floor, Zone, Number, Capacity, AvailabilityStatus, DailyCleaningStatus)

Course (CourseCode, CourseName, ProfessorID, LectureRoom, LectureDay, LectureHour, ...)
├── CourseTA
├── CourseJTA  
└── CourseStudent

CleaningRequest (RequestID, RoomID, RequestedBy, Date, Time, Condition)
Report (RequestID, RoomID, Complaint, RequestorID, Date, Time, Condition)
QuotaRequest (RequestID, UserID, UserType, ExtraHours, Reason, Status)
```

Full schema SQL, ER diagram, relations diagram, and sample data are included in the `/DataBase` directory.

---

## Project Structure

```
room-booking-system/
├── WebCode/
│   └── Project/
│       ├── Pages/
│       │   ├── Admin/          # User management, stats
│       │   ├── Professor/      # My rooms, room booking, reports
│       │   ├── Student/        # Room search, booking, stats
│       │   ├── TA/             # Rooms, quota requests, tutorials
│       │   ├── Registrar/      # Course management
│       │   ├── CleaningStaff/  # Cleaning requests, daily cleaning, supplies
│       │   ├── RoomServicesTeam/ # Condition management, quotas, reports
│       │   ├── Login.cshtml
│       │   ├── Home.cshtml
│       │   └── RoomSearch.cshtml
│       ├── Models/
│       │   └── DB.cs           # EF Core database context & all models
│       ├── Program.cs
│       ├── appsettings.json    # Connection string configuration
│       └── wwwroot/            # Static assets (CSS, JS, images)
├── DataBase/
│   ├── Project Schema.sql      # Full database creation script
│   ├── Sample Data.sql         # Populated test data
│   ├── SQLQuery_1.sql
│   └── Pages Queries/          # SQL queries organized per page/role
│       ├── Admin/
│       ├── Professor/
│       ├── Student/
│       ├── TA/
│       ├── Registrar/
│       ├── Cleaning Staff/
│       └── Room Servicing Team/
└── Diagrams/
    ├── Entities/               # ER diagram (PNG, PDF, drawio)
    ├── Relations/              # Relations diagram (PNG, PDF, drawio)
    ├── Schema/                 # Database schema diagram (PNG, PDF, drawio)
    └── Website UI/             # Full UI wireframes for all roles (PNG, drawio)
```

---

## Getting Started

### Prerequisites

- .NET 8 SDK
- Microsoft SQL Server (or SQL Server Express)
- Visual Studio 2022 or VS Code with C# Dev Kit

### Setup

```bash
git clone https://github.com/Ahito498/room-booking-system.git
cd room-booking-system/WebCode
```

**1. Create the database**

Open SQL Server Management Studio and run:
```sql
-- Run in order:
1. DataBase/Project Schema.sql   -- Creates database and all tables
2. DataBase/Sample Data.sql      -- Populates with test data
```

**2. Configure connection string**

Edit `WebCode/Project/appsettings.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_SERVER;Database=UniversityManagementSystem;Trusted_Connection=True;"
  }
}
```

**3. Run the application**

```bash
cd WebCode
dotnet restore
dotnet run
```

Open `https://localhost:5001` in your browser.

### Sample Login Credentials

After running `Sample Data.sql`, you can log in with any user in the database. User types are: `Admin`, `Professor`, `Student`, `TA`, `Registrar`, `CleaningStaffMember`, `RoomServicesMember`.

---

## Diagrams

All system diagrams are in the `/Diagrams` directory:

- **ER Diagram** — Entity-relationship diagram showing all entities and attributes
- **Relations Diagram** — Relational schema showing foreign key relationships  
- **Database Schema** — Visual table structure with all columns and constraints
- **Website UI Wireframes** — Page-by-page UI designs for every user role

---

## Key Design Decisions

- **Session-based auth** with role-specific routing — each `UserType` maps to a dedicated page namespace
- **Raw SQL queries** for complex multi-join operations (stored in `/DataBase/Pages Queries/`) alongside EF Core for standard CRUD
- **Razor Pages** model — each page has a `.cshtml` view and a `.cshtml.cs` code-behind for clean separation
- **Role-enforced navigation** — each user type sees only their relevant menu items based on session

---

## Authors

Built by a team of Communication and Information Engineering students at **Zewail City of Science and Technology**, Giza, Egypt.

Lead developer: **Hassan Ahmed Rashwan** — [github.com/Ahito498](https://github.com/Ahito498)

---

## License

MIT License — feel free to use, fork, and build on this project.
