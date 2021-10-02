
CREATE TABLE Instructors
(
	InstructorID INT IDENTITY PRIMARY KEY,
	InstructorName NVARCHAR(30) NOT NULL,
	Email NVARCHAR (30) NOT NULL,
        Salary MONEY NOT NULL,
)
GO

CREATE TABLE Courses
(
	CourseID INT IDENTITY PRIMARY KEY,
	CourseName NVARCHAR(30) NOT NULL,
	InstructorID INT NOT NULL REFERENCES Instructors(InstructorID)
)
GO

CREATE TABLE Students
(
	StudentID INT IDENTITY PRIMARY KEY,
	StudentName NVARCHAR(30) NOT NULL,
	DOB DATE NOT NULL,
	Email NVARCHAR(30) NOT NULL
)
GO

CREATE TABLE [dbo].[StudentCourse] (
    [StudentID]  INT  NOT NULL,
    [CourseID]   INT  NOT NULL,
    [StartDate]  DATE NOT NULL,
    [FinishDate] DATE NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC, [CourseID] ASC),
    FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Students] ([StudentID]),
    FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Courses] ([CourseID])
);