# Student Performance Database at ALU Rwanda
This database is designed to track and analyze grades for students enrolled at ALU Rwanda in Linux and Python courses.

# It does 3 main things:
1. Creates tables to store student details and their grades.
2. Fills the tables with sample data.
3. Runs queries to answer useful questions about student performance.

# Database structure
1. students table: with columns (student_id, student_name, intake_year)
2. linux_grades table: with columns (course_id, course_name, student_id, grade_obtained )
3. python_grades table: with columns (course_id, course_name, student_id, grade_obtained )
Each grade table connects to the students table using "student_id".

# About data
1. 15 students are added to the "students" table.
2. Grades are added for some students in Linux, others in Python, and some in both.

# Queries that are implemented in this database are:
1. Insert sample data into each table (at least 15 students, a mix of those who took one or both courses).
2. Find students who scored less than 50% in the Linux course.
3. Find students who took only one course (either Linux or Python, not both).
4. Find students who took both courses.
5. Calculate the average grade per course (Linux and Python separately).
6. Identify the top-performing student across both courses (based on the average of their grades).

# How to Use
You can run this script in any SQL environment that supports standard SQL — for example:
1. VS Code with a SQL extension
2. MySQL
3. PostgreSQL
4. SQLite
You just copy and paste the whole script and run it.

NB: We have used (--) to add comments  in the SQL file to explain each query’s intention.


