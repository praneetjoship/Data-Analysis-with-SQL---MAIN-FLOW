
-- create
CREATE TABLE StudentScores (
    StudentID INT PRIMARY KEY,
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

INSERT INTO StudentScores (StudentID, MathScore, ScienceScore, EnglishScore)
VALUES
(1, 85, 90, 80),
(2, 78, 75, 82),
(3, 95, 92, 88),
(4, 88, 84, 91),
(5, 30, 73, 69),
(6, 90, 87, 85),
(7, 60, 65, 22),
(8, 80, 78, 79),
(9, 95, 90, 92),
(10, 80, 85, 78),
(11, 70, 34, 72),
(12, 88, 90, 85),
(13, 76, 82, 80),
(14, 65, 70, 68),
(15, 90, 94, 48),
(16, 98, 90, 85),
(17, 85, 89, 27),
(18, 32, 74, 78);

select * from StudentScores;

/*dentify Pass/Fail Status in Specific Subjects*/
SELECT 
    StudentID, 
    (MathScore + ScienceScore + EnglishScore) AS TotalScore,
    CASE 
        WHEN (MathScore + ScienceScore + EnglishScore) >= 270 THEN 'A+'
        WHEN (MathScore + ScienceScore + EnglishScore) >= 260 THEN 'A'
        WHEN (MathScore + ScienceScore + EnglishScore) >= 240 THEN 'B'
        WHEN (MathScore + ScienceScore + EnglishScore) >= 220 THEN 'C'
        WHEN (MathScore + ScienceScore + EnglishScore) >= 210 THEN 'D'
        ELSE 'E'
    END AS Grade
FROM StudentScores;

/*Identify Pass/Fail Status in Each Subject*/
SELECT 
    StudentID as ID, 
    MathScore as Math,
    ScienceScore as Science,
    EnglishScore as English,
    CASE 
        WHEN MathScore >= 35 THEN 'Pass' 
        ELSE '*Fail*' 
    END AS Math_status,
    CASE 
        WHEN ScienceScore >= 35 THEN 'Pass' 
        ELSE '*Fail*' 
    END AS Science_status,
    CASE 
        WHEN EnglishScore >= 35 THEN 'Pass' 
        ELSE '*Fail*' 
    END AS English_status
FROM StudentScores;


