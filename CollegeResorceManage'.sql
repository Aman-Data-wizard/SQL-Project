create database CollegeResources;
use CollegeResources;

create table student(
 StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Program VARCHAR(100),
    Year INT
);
insert into student(StudentID, Name, Program, Year) values
(101, 'Alice Johnson', 'BCA', 2),
(102, 'Bob Smith', 'B.Tech', 3),
(103, 'Charlie Brown', 'B.Tech', 1);

 create TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);
insert into Department(DepartmentID, DepartmentName) values
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mechanical Engineering');

create Table course(
	courseId INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentId)
    );
INSERT INTO Course (CourseID, CourseName, DepartmentID)
VALUES 
(301, 'Database Systems', 1),
(302, 'Circuit Theory', 2),
(303, 'Thermodynamics', 3);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Enrollment(StudentID, CourseID, Grade) VALUES
(101, 301, 'A'),
(102, 302, 'B'),
(103, 303, 'C');
update Enrollment
set grade = 10
where StudentID = 101;
update Enrollment
set grade = 7
where StudentID = 102;
update Enrollment
set grade = 9
where StudentID = 103;


/* Faculty Management */
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Faculty (FacultyID, Name, DepartmentID)
VALUES 
(201, 'Dr. Stevens', 1),
(202, 'Dr. Gupta', 2),
(203, 'Dr. Mishra', 3);

CREATE TABLE Teaches (
    FacultyID INT,
    CourseID INT,
    PRIMARY KEY (FacultyID, CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Teaches (FacultyID, CourseID)
VALUES 
(201, 301),
(202, 302),
(203, 303);

/* ClassRoom Scheduling */
CREATE TABLE Classroom (
    RoomID INT PRIMARY KEY,
    Capacity INT,
    Building VARCHAR(100)
);
INSERT INTO Classroom (RoomID, Capacity, Building)
VALUES 
(401, 60, 'Main Block'),
(402, 40, 'Engineering Block');


CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    RoomID INT,
    CourseID INT,
    FacultyID INT,
    Date DATE,
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (RoomID) REFERENCES Classroom(RoomID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);
INSERT INTO Schedule (ScheduleID, RoomID, CourseID, FacultyID, Date, StartTime, EndTime)
VALUES 
(501, 401, 301, 201, '2025-05-01', '10:00:00', '12:00:00'),
(502, 402, 302, 202, '2025-05-01', '12:30:00', '14:30:00');
/* Event Management*/
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Title VARCHAR(200),
    OrganizerID INT,
    OrganizerType VARCHAR(50), -- 'Club' or 'Department'
    RoomID INT,
    Date DATE,
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (RoomID) REFERENCES Classroom(RoomID)
);
INSERT INTO Event (EventID, Title, OrganizerID, OrganizerType, RoomID, Date, StartTime, EndTime)
VALUES 
(601, 'AI Workshop', 1, 'Club', 401, '2025-05-02', '10:00:00', '13:00:00'),
(602, 'Robotics Guest Lecture', 2, 'Department', 402, '2025-05-03', '11:00:00', '13:00:00');

/* Inventory Management */
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Quantity INT,
    LAB VARCHAR(100)
);
INSERT INTO Inventory (ItemID, ItemName, Quantity, LAB)
VALUES 
(701, 'Arduino Kit', 10, 'Lab A'),
(702, 'Data Science Book', 5, 'Library');

CREATE TABLE InventoryIssue (
    IssueID INT PRIMARY KEY,
    ItemID INT,
    IssuedToID INT,
    IssuedToType VARCHAR(50), -- 'Student' or 'Faculty'
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);
INSERT INTO InventoryIssue (IssueID, ItemID, IssuedToID, IssuedToType, IssueDate, ReturnDate)
VALUES 
(801, 701, 101, 'Student', '2025-04-25', NULL),
(802, 702, 201, 'Faculty', '2025-04-24', '2025-05-05');



