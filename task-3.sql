
-- create
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    math_score INT,
    science_score INT,
    english_score INT
);

INSERT INTO Students (student_id, name, math_score, science_score, english_score) VALUES
(1, 'Aarav', 95, 90, 92),
(2, 'Priya', 80, 85, 78),
(3, 'Rohan', 70, 75, 72),
(4, 'Ananya', 88, 90, 85),
(5, 'Vikram', 76, 82, 80),
(6, 'Neha', 65, 70, 68),
(7, 'Ishaan', 90, 94, 88),
(8, 'Sanya', 78, 80, 85),
(9, 'Kabir', 85, 89, 87),
(10, 'Meera', 72, 74, 78);

select * from Students;

/*Task 1: Identifying Top Students by Total Scores*/
SELECT student_id, name, 
       (math_score + science_score + english_score) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;

/*Task 2: Calculating Averages Based on Specific Conditions*/
/*Average Score of Students Who Scored Above 70 in Math*/
SELECT AVG(math_score) AS avg_math_score_above_70
FROM Students
WHERE math_score > 70;

/*Average Total Score of Students Scoring Between 200–250*/
SELECT AVG(total_score) AS avg_total_score
FROM (
    SELECT (math_score + science_score + english_score) AS total_score
    FROM Students
) AS total_scores
WHERE total_score BETWEEN 200 AND 250;


/*Task 3: Finding the Second-Highest Math Score*/
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);

