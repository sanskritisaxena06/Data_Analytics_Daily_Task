create database sanskriti;
use sanskriti;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    phoneno VARCHAR(15)
);
INSERT INTO students (student_id, name, course, phoneno)
VALUES
(1, 'Sanskriti', 'MCA', '9876543212'),
(2, 'Agrim Saxena', 'B.Tech CSE', '9876543210');


