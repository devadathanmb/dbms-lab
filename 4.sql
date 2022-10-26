-- Question 4

CREATE DATABASE studentDB;
USE studentDB;

CREATE TABLE student(
    roll_no INT PRIMARY KEY,
    name VARCHAR(255),
    category VARCHAR(255),
    district VARCHAR(255),
    state VARCHAR(255)
);

CREATE TABLE student_rank(
    roll_no INT,
    mark INT,
    rank INT,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);

INSERT INTO student VALUES
    (1, "Akash Mehta", "GENERAL", "Panvel", "Maharastra"),
    (2, "Akshay Kumar", "OBC", "Nagpur", "Maharastra"),
    (3, "Anish Giri", "OBC", "Mumbai", "Maharastra"),
    (4, "Anish Thayle", "OBC", "Nashik", "Maharastra"),
    (5, "Animesh Nayan", "OBC", "Pune", "Maharastra"),
    (6, "Ashish Chanchalani", "SC", "Nagpur", "Maharastra"),
    (7, "Davood Ahmad", "SC", "Thane", "Maharastra"),
    (8, "Dawal Patel", "ST", "Bangalore", "Karnataka"),
    (9, "Munna Singh", "ST", "Palani", "Tamil Nadu"),
    (10, "Kaleen Vimal", "ST", "Chennai", "Tamil Nadu"),
    (11, "Vikas Chatterjee", "GENERAL", "Panvel", "Maharastra"),
    (12, "Viswas Mukherjee", "ST", "Thrissur", "Kerala"),
    (13, "Vinay Gopi", "GENERAL", "Kottayam", "Kerala"),
    (14, "Vinod Babu", "SC", "Palakkad", "Kerala"),
    (15, "Uday Singh", "GENERAL", "Dhule", "Maharastra"),
    (16, "Ullas Thane", "ST", "Kolhapur", "Maharastra");


INSERT INTO student_rank VALUES
    (1, 599, 1),
    (2, 200, 15),
    (3, 595, 2),
    (4, 590, 3),
    (5, 200, 15),
    (6, 260, 14),
    (7, 400, 13),
    (8, 580, 4),
    (9, 580, 5),
    (10, 575, 6),
    (11, 575, 7),
    (12, 570, 8),
    (13, 565, 9),
    (14, 560, 10),
    (15, 550, 11),
    (16, 540, 12);

-- Display all entries
SELECT * FROM student;
SELECT * FROM student_rank;

-- Question a
-- List the details of the students with the same category and same rank.

CREATE VIEW joined
AS 
SELECT * FROM student 
NATURAL JOIN
student_rank;


SELECT a.*
FROM joined AS a
INNER JOIN joined AS b
ON a.rank = b.rank AND 
a.category = b.category AND a.roll_no != b.roll_no;


-- Question b
-- List out the details of the students (rollno, name, category, district, rank) who secured the highest rank for each category in each state.

SELECT name FROM joined WHERE rank IN (
    SELECT MIN(rank) FROM joined
    GROUP BY state, category
);

-- Question c
-- List the names of the students(roll no, name, category, district, mark, rank) having either marks
-- same but ranks different or marks different but ranks same together with the status (whether they
-- belong to the first category or second category)

SELECT a.*, 
CASE WHEN a.rank = b.rank THEN 'Same Rank'
ELSE 'Same Marks'
END AS comments
FROM (SELECT * FROM student NATURAL JOIN student_rank) a JOIN (SELECT * FROM student NATURAL JOIN student_rank) b
WHERE (a.rank = b.rank && a.mark != b.mark && a.roll_no != b.roll_no) || (a.rank != b.rank && a.mark = b.mark && a.roll_no != b.roll_no);

-- question d
-- find the category with the highest academic performance and the one with the least academic performance.

select category from joined group by category order by avg(mark) limit 1;
select category from joined group by category order by avg(mark) desc limit 1;


-- question e
-- find the category whose academic performance is below the average academic performance.

SELECT category FROM joined GROUP BY category
HAVING AVG(mark) <= (SELECT AVG(mark) FROM joined);


DROP DATABASE studentDB;

