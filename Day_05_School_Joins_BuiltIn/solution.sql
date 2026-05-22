
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Aarav', 'Chennai'),
(2, 'Meera', 'Bangalore'),
(3, 'Ravi', 'Delhi'),
(4, 'Sneha', 'Mumbai');

INSERT INTO Courses VALUES
(101, 'SQL Basics'),
(102, 'Python Programming'),
(103, 'Data Science'),
(104, 'Web Development');

INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-05-01'),
(2, 2, 102, '2025-05-02'),
(3, 3, 103, '2025-05-03');

-- Joins
SELECT s.student_id, s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

SELECT s.student_id, s.student_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;

SELECT s.student_id, s.student_name, c.course_name
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

-- Math Functions
SELECT ROUND(123.4567, 2) AS Rounded_Value;
SELECT ABS(-25) AS Absolute_Value, MOD(25, 4) AS Remainder;

-- String Functions
SELECT CONCAT(student_name, ' from ', city) AS Full_Description FROM Students;
SELECT student_name, LENGTH(student_name) AS Name_Length FROM Students;
SELECT course_name, REPLACE(course_name, 'SQL', 'Database') AS Updated_CourseName FROM Courses;
SELECT student_name, SUBSTRING(student_name, 1, 3) AS Code_Prefix FROM Students;
SELECT student_name, UPPER(student_name) AS UPPER_Name, LOWER(student_name) AS LOWER_Name FROM Students;

-- Date Functions
SELECT s.student_name, e.enrollment_date,
       DATE_ADD(e.enrollment_date, INTERVAL 10 DAY) AS FollowUp_Date,
       DATEDIFF('2025-06-01', '2025-05-10') AS Days_Difference,
       NOW() AS Current_DateTime
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id;
