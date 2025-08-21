-- Creating students table to put students details
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    intake_year INT
);
-- Create linux_grades table to put student details for the linux course
CREATE TABLE linux_grades (
    course_id INT,
    course_name VARCHAR(100),
    student_id INT,
    grade_obtained DECIMAL(5,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
-- Create table for Python course grades
CREATE TABLE python_grades (
    course_id INT,
    course_name VARCHAR(100),
    student_id INT,
    grade_obtained DECIMAL(5,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
 -- 15 students data being inserted into students table
INSERT INTO students (student_id, student_name, intake_year) VALUES
(1, 'Umutoni Kenia', J2022),
(2, 'Natinael Borana', M2021),
(3, 'Esther Kirabo', S2023),
(4, 'Obeng Peniel', J2022),
(5, 'Ahmed Daib', M2021),
(6, 'David Uwase', S2023),
(7, 'Mbabazi Ange', J2022),
(8, 'Kevin Lapawa', M2021),
(9, 'Ingabire Marie', S2023),
(10, 'Samuel Abban', J2022),
(11, 'Nadine Ishimwe', M2021),
(12, 'Brian Gattete', S2023),
(13, 'Alice Agens', J2022),
(14, 'Tom Jerry', M2021),
(15, 'Diane Azam', S2023);
-- Sample data is inserted into grades table
INSERT INTO linux_grades VALUES
(101, 'Bash Scripting', 1, 78.5),
(101, 'Bash Scripting', 2, 45.0),
(101, 'Bash Scripting', 3, 88.0),
(101, 'Bash Scripting', 4, 52.5),
(101, 'Bash Scripting', 5, 39.0),
(101, 'Bash Scripting', 6, 60.0),
(102, 'Linux Fundamentals', 7, 91.0),
(102, 'Linux Fundamentals', 8, 47.5),
(102, 'Linux Fundamentals', 9, 55.0),
(102, 'Linux Fundamentals', 10, 62.0),
(102, 'Linux Fundamentals', 11, 49.0),
(102, 'Linux Fundamentals', 12, 73.0);
-- Inserting data into python grades table
INSERT INTO python_grades VALUES
(201, 'Python Basics', 3, 92.0),
(201, 'Python Basics', 4, 65.0),
(201, 'Python Basics', 6, 70.0),
(202, 'Python Programming', 7, 85.0),
(202, 'Python Programming', 9, 58.0),
(202, 'Python Programming', 10, 77.0),
(202, 'Python Programming', 12, 80.0),
(203, 'Python Programming and Database', 13, 90.0),
(203, 'Python Programming and Database', 14, 66.0),
(203, 'Python Programming and Database', 15, 74.0);
-- Students who scored less than 50% in Linux
SELECT s.student_name, lg.grade_obtained
FROM linux_grades lg
JOIN students s ON s.student_id = lg.student_id
WHERE lg.grade_obtained < 50;

-- Getting the Students who took only one course, with their student ids
SELECT s.student_id, s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT student_id FROM linux_grades
    WHERE student_id NOT IN (SELECT student_id FROM python_grades)
    UNION
    SELECT student_id FROM python_grades
    WHERE student_id NOT IN (SELECT student_id FROM linux_grades)
);
-- Students who took both courses
SELECT s.student_id, s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT lg.student_id
    FROM linux_grades lg
    INNER JOIN python_grades pg ON lg.student_id = pg.student_id
);
-- Calculating the average grade for each course
SELECT course_name, AVG(grade_obtained) AS avg_grade
FROM python_grades
GROUP BY course_name
UNION ALL
SELECT course_name, AVG(grade_obtained) AS avg_grade
FROM linux_grades
GROUP BY course_name;
-- Student with the highest average across both courses
SELECT s.student_id, s.student_name, AVG(g.grade_obtained) AS avg_score
FROM (
    SELECT student_id, grade_obtained FROM linux_grades
    UNION ALL
    SELECT student_id, grade_obtained FROM python_grades
) g
JOIN students s ON s.student_id = g.student_id
GROUP BY s.student_id, s.student_name
ORDER BY avg_score DESC
LIMIT 1;
