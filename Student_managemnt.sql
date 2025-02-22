-- Creating the Students table
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

-- Inserting sample data
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
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

-- Fetching all student records
SELECT * FROM Students;

-- Calculating Average Scores
SELECT 
    AVG(MathScore) AS AvgMath, 
    AVG(ScienceScore) AS AvgScience, 
    AVG(EnglishScore) AS AvgEnglish
FROM Students;

-- Finding the Top Performer
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- Counting Students in Each Grade
SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

-- Comparing Male vs Female Performance
SELECT Gender, 
       AVG(MathScore) AS AvgMath, 
       AVG(ScienceScore) AS AvgScience, 
       AVG(EnglishScore) AS AvgEnglish
FROM Students
GROUP BY Gender;

-- Finding High Achievers in Math (above 80)
SELECT Name, MathScore 
FROM Students 
WHERE MathScore > 80;

-- Updating a Student’s Grade whose ID is 5
UPDATE Students 
SET Grade = 'A' 
WHERE StudentID = 5;
