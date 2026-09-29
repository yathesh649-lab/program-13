-- Original Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    CourseName VARCHAR(100),
    FacultyName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

-- 3NF: Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    FacultyName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

-- 3NF: Student table
CREATE TABLE Student_3NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

Sample data
INSERT INTO Course
VALUES
(101, 'BCA', 'Science', 'Computer Science'),
(102, 'B.Com', 'Commerce', 'Commerce');

INSERT INTO Student_3NF
VALUES
(1, 'Ravi', 101),
(2, 'Priya', 101),
(3, 'Arun', 102);

Display the normalized data
SELECT 
    s.StudentID,
    s.StudentName,
    c.CourseName,
    c.FacultyName,
    c.DepartmentName
FROM Student_3NF s
JOIN Course c
    ON s.CourseID = c.CourseID;

3NF tables:

Student_3NF(StudentID, StudentName, CourseID)
Course(CourseID, CourseName, FacultyName, DepartmentName)

Here, StudentID → StudentName, CourseID and CourseID → CourseName, FacultyName, DepartmentName, removing the transitive dependency from the original table.


