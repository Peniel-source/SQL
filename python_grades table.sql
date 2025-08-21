-- Create table for Python course grades
CREATE TABLE python_grades (
    course_id INT,
    course_name VARCHAR(100),
    student_id INT,
    grade_obtained DECIMAL(5,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);