
-- create
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_description TEXT
);

CREATE TABLE Enrolments (
    enrolment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);


-- Inserting sample data
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) 
VALUES
('Aarav', 'M', 16, 'A', 95, 90, 92),
('Priya', 'F', 17, 'B', 80, 85, 78),
('Rohan', 'M', 16, 'C', 70, 75, 72),
('Ananya', 'F', 17, 'A', 88, 90, 85),
('Vikram', 'M', 15, 'B', 76, 82, 80),
('Neha', 'F', 18, 'C', 65, 70, 68),
('Ishaan', 'M', 16, 'A', 90, 94, 88),
('Sanya', 'F', 17, 'B', 78, 80, 85),
('Kabir', 'M', 15, 'A', 85, 89, 87),
('Meera', 'F', 16, 'C', 60, 65, 58);


INSERT INTO Courses (course_name, course_description)
VALUES 
    ('Mathematics', 'Advanced mathematical concepts and problem-solving techniques'),
    ('Physics', 'Fundamentals of physics including motion, energy, and forces'),
    ('Computer Science', 'Programming and software development principles'),
    ('English Literature', 'Study of classic and modern literature'),
    ('Biology', 'Exploration of living organisms and their processes'),
     ('History', 'Study of past events and civilizations');
    
    
INSERT INTO Enrolments (student_id, course_id, enrolment_date)
VALUES 
    (1, 1, '2025-02-01'),
    (1, 2, '2025-02-02'),
    (2, 1, '2025-02-03'),
    (2, 3, '2025-02-04'),
    (3, 4, '2025-02-05'),
    (4, 5, '2025-02-06'),
    (5, 1, '2025-02-07'),
    (5, 2, '2025-02-08'),
    (5, 3, '2025-02-09'),
    (6, 4, '2025-02-10'),
    (7, 5, '2025-02-11'),
    (8, 3, '2025-02-12'),
    (9, 2, '2025-02-13'),
    (9, 5, '2025-02-14'),
    (10, 1, '2025-02-15');


/*Task 1 List All Students and Their Enrolled Courses*/

SELECT Students.Name AS Student_Name, Courses.course_name AS Course_Name
FROM Enrolments
INNER JOIN Students ON Enrolments.student_id = Students.StudentID
INNER JOIN Courses ON Enrolments.course_id = Courses.course_id;

/*Task 2: Find the Number of Students Enrolled in Each Course*/
SELECT Courses.course_id, Courses.course_name, COUNT(Enrolments.student_id) AS 
Enrolled_Students FROM Courses
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
GROUP BY Courses.course_id, Courses.course_name;

/*Task 3: List Students Who Have Enrolled in More Than One Course*/
SELECT Students.StudentID, Students.Name, COUNT(Enrolments.course_id) AS Course_Count
FROM Enrolments
INNER JOIN Students ON Enrolments.student_id = Students.StudentID
GROUP BY Students.StudentID, Students.Name
HAVING COUNT(Enrolments.course_id) > 1;

/*Task 4: Find Courses with No Enrolled Students*/
SELECT Courses.course_id, Courses.course_name
FROM Courses
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
WHERE Enrolments.enrolment_id IS NULL;



