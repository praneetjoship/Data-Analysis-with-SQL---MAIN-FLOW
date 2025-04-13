
-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create marks table
  CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject VARCHAR(30),
    mark INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert sample students
INSERT INTO students (student_id, name) VALUES
(1, 'Aarav'),
(2, 'Priya'),
(3, 'Rohan'),
(4, 'Ananya'),
(5, 'Vikram'),
(6, 'Neha'),
(7, 'Ishaan'),
(8, 'Sanya'),
(9, 'Kabir'),
(10, 'Meera');

select * from students;

-- Insert sample marks
INSERT INTO marks (student_id, subject, mark) VALUES
(1, 'Math', 95), (1, 'Science', 90), (1, 'English', 92),
(2, 'Math', 80), (2, 'Science', 85), (2, 'English', 78),
(3, 'Math', 70), (3, 'Science', 75), (3, 'English', 72),
(4, 'Math', 88), (4, 'Science', 90), (4, 'English', 85),
(5, 'Math', 76), (5, 'Science', 82), (5, 'English', 80),
(6, 'Math', 65), (6, 'Science', 70), (6, 'English', 68),
(7, 'Math', 90), (7, 'Science', 94), (7, 'English', 88),
(8, 'Math', 78), (8, 'Science', 80), (8, 'English', 85),
(9, 'Math', 85), (9, 'Science', 89), (9, 'English', 87),
(10, 'Math', 72), (10, 'Science', 74), (10, 'English', 78);

-- marks 
CREATE VIEW student_marks AS
SELECT s.student_id, s.name, sc.subject, sc.mark
FROM students s
JOIN marks sc ON s.student_id = sc.student_id;

SELECT * FROM student_marks;

-- View for Students Who Passed All Subjects (mark ≥ 40)
CREATE VIEW passed_students AS
SELECT student_id, name
FROM students
WHERE student_id NOT IN (
    SELECT student_id FROM marks WHERE mark < 40
);

SELECT * FROM passed_students;


