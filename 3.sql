-- Question 3

CREATE DATABASE studentDB;
USE studentDB;

CREATE TABLE student(
    roll_no INT PRIMARY KEY,
    name VARCHAR(255),
    dob DATE
);

CREATE TABLE course(
    course_id INT PRIMARY KEY,
    name VARCHAR(255),
    fee INT,
    duration INT
);

CREATE TABLE stud_course(
    roll_no INT,
    course_id INT,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO student VALUES
    (1, "Akash Mehta", "1999-03-21"),
    (2, "Akshay Arora", "2000-02-22"),
    (3, "Anish Giri", "2000-05-28"),
    (4, "Ajju Bhai", "2000-02-01"),
    (5, "Bhavanlal Mehta", "1999-02-21"),
    (6, "Biraj Singh", "1997-02-21"),
    (7, "Bineed Shukla", "1997-05-11"),
    (8, "Davood Malik", "2002-02-21"),
    (9, "Davood Ibrahim", "2002-03-21"),
    (10, "Divyansh Chaudary", "2002-03-24"),
    (11, "Dishok Patel", "1999-12-21"),
    (12, "Dawal Rao", "1998-12-11"),
    (13, "Samay Raina", "1997-05-21"),
    (14, "Sagar Shah", "1995-08-28"),
    (15, "Vidit Gujrati", "1995-03-18");

INSERT INTO course VALUES
    (101, "B.Tech", 1000000, 4),
    (102, "BBA", 300000, 4),
    (103, "BCA", 500000, 3),
    (104, "LLB", 700000, 4),
    (105, "MBBS", 2000000, 5);

INSERT INTO stud_course VALUES
    (1, 101),
    (1, 102),
    (1, 104),
    (1, 103),
    (1, 105),
    (2, 102),
    (2, 105),
    (3, 101),
    (4, 105),
    (5, 101),
    (5, 102),
    (6, 102),
    (6, 103),
    (7, 104),
    (7, 101),
    (8, 101),
    (9, 105),
    (10, 105),
    (11, 102),
    (12, 102),
    (12, 103),
    (12, 104),
    (13, 104),
    (14, 105),
    (15, 105);


-- Display all table entries

SELECT * FROM student;
SELECT * FROM course;

-- Question 1
-- List the names of all students who are greater than 18 years of age and have opted B.Tech Course.

SELECT student.name FROM student
INNER JOIN stud_course
ON student.roll_no = stud_course.roll_no
INNER JOIN course
ON course.course_id = stud_course.course_id
WHERE TIMESTAMPDIFF(YEAR, dob, now()) > 18 
AND course.name = "B.Tech";

-- Question 2
-- List the details of those courses whose fee is greater than that of B.Tech Course.

SELECT name FROM course WHERE
fee > (SELECT fee FROM course WHERE name = "B.Tech"
);

-- Question 3
-- List the details of the students who have opted more than 2 courses.

SELECT * FROM student 
INNER JOIN stud_course
HAVING COUNT(stud_course.roll_no) > 2;

-- Question 4
-- List the details (name, fee and duration) of the course which have been opted by maximum number
-- of students and those of the course which is opted by the least number of students

CREATE VIEW max_min_course AS
SELECT course_id, COUNT(course_id) number_of_students FROM stud_course 
GROUP BY course_id;

SELECT course.* FROM course
INNER JOIN max_min_course
ON max_min_course.course_id = course.course_id
ORDER BY max_min_course.number_of_students DESC
LIMIT 1;

SELECT course.* FROM course
INNER JOIN max_min_course
ON max_min_course.course_id = course.course_id
ORDER BY max_min_course.number_of_students ASC
LIMIT 1;

-- Question e
-- List the details of the student(s) who have opted every course.

SELECT student.* FROM stud_course 
INNER JOIN student
ON student.roll_no = stud_course.roll_no
GROUP BY stud_course.roll_no HAVING COUNT(stud_course.roll_no) = (SELECT COUNT(course.course_id) FROM course);


DROP DATABASE studentDB;
