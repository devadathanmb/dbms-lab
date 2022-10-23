-- Question 1

CREATE DATABASE collegeDB;

USE collegeDB;

CREATE TABLE college(
    college_code INT PRIMARY KEY,
    college_name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE faculty(
    college_code INT,
    faculty_code INT PRIMARY KEY,
    faculty_name VARCHAR(255),
    qualification VARCHAR(255),
    experience INT,
    department VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (college_code) REFERENCES college(college_code)
);

INSERT INTO college
VALUES
    (101, "RIT", "Pambady, Kottayam"),
    (102, "GEC TCR", "Ramavarmapuram, Thrissur"),
    (103, "GEC IDK", "Painavu, Idukki"),
    (104, "GEC WYD", "Mananthvady, Wayanad"),
    (105, "NIT CKT", "Kattangal, Kozhikode");

INSERT INTO faculty
VALUES
    (101, 1001, "Ramesh", "B.Tech", 3, "Computer Science", "Kottarakara, Kollam"),
    (101, 1002, "Suraj", "M.Tech", 5, "Computer Science", "Kundara, Kollam"),
    (101, 1003, "Subash", "Phd", 10, "Computer Science", "Pambady, Kottayam"),
    (101, 1004, "Rajeesh", "Phd", 11, "Mechanical", "Thriuvalla, Pathanamthitta"),
    (101, 1005, "Akash", "B.Tech", 1, "Mechanical", "Changanasery, Kottayam"),
    (101, 1011, "Akshay", "B.Tech", 2, "Mechanical", "Pambady, Kottayam"),



    (102, 1006, "John", "M.Tech", 5, "Computer Science", "Panvel, Mumbai"),
    (102, 1007, "David", "M.Tech", 5, "Computer Science", "Chalakudy, Thrissur"),
    (102, 1008, "Rao", "Phd", 13, "Computer Science", "Ettumanoor, Kottayam"),
    (102, 1009, "Alakh", "B.Tech", 4, "Computer Science", "Paravoor, Ernakulam"),
    (102, 1010, "Samay", "B.Tech", 1, "Computer Science", "Changanasery, Kottayam"),


    (103, 1012, "Jhonny", "M.Tech", 5, "Electrical", "Chennai, Chennai"),
    (103, 1013, "Brian", "B.Tech", 5, "Computer Science", "Panvel, Mumbai"),
    (103, 1014, "Nikhil", "B.Tech", 3, "Electronics", "Pagoda, Mumbai"),
    (103, 1015, "Ashish", "M.Tech", 2, "Mechanical", "Pagoda, Mumbai"),
    (103, 1016, "Sagar", "M.Tech", 15, "Civil", "Calicut, Kozhikode"),



    (104, 1017, "Sujeeth", "B.Tech", 5, "Computer Science", "Ghaziabad, UP"),
    (104, 1018, "Akash", "M.Tech", 3, "Cvil", "Pagoda, Mumbai"),
    (104, 1019, "Aunkur", "M.Tech", 7, "Civil", "Palani, TN"),
    (104, 1020, "Vidit", "M.Tech", 3, "Mechanical", "Rameshwaram, TN"),
    (104, 1021, "Anish", "M.Tech", 3, "Electronics", "Bangalore, Karnataka"),


    (105, 1022, "Nithin", "M.Tech", 5, "Computer Science", "Panvel, Mumbai"),
    (105, 1023, "Alvin", "M.Tech", 2, "Civil", "Chalakudy, Thrissur"),
    (105, 1024, "Febin", "Phd", 12, "Electronics", "Ettumanoor, Kottayam"),
    (105, 1025, "Aswin", "B.Tech", 4, "Mechanical", "Paravoor, Ernakulam"),
    (105, 1026, "Pradeep", "B.Tech", 7, "Computer Science", "Changanasery, Kottayam");


-- Display all rows from all tables
SELECT * FROM college;
SELECT * FROM faculty;


-- Question a
-- List all faulty members of a specified college whose experience is greater than or equal to 10 years.

SELECT faculty_name FROM faculty
INNER JOIN college ON college.college_code = faculty.college_code
WHERE experience >= 10
AND college_name LIKE "RIT";

-- Question b
-- List all Faculty Members of a specified college who have at least 10 years of experience but not having M.Tech Degree.

SELECT faculty_name FROM faculty
INNER JOIN college ON college.college_code = faculty.college_code
WHERE experience >= 10
AND qualification NOT LIKE "M.Tech"
AND college_name = "RIT";

-- Question c
-- List out the Faculty of a specified college department wise in non decreasing order of their seniority

SELECT faculty_name FROM faculty
INNER JOIN college ON college.college_code = faculty.college_code
WHERE department = "Computer Science"
AND college_name = "RIT"
ORDER BY experience DESC;

-- Question d
-- List out the Names of the Colleges having more than a specified number of faculty members

SELECT college_name FROM college
INNER JOIN (
    SELECT college_code, COUNT(college_code) AS faculty_count
    FROM faculty
    GROUP BY college_code
    HAVING faculty_count = 6
) AS count_table
ON college.college_code = count_table.college_code;

-- Question e
-- List out the names of the colleges having the least number of faculties and the largest number of faculty.


CREATE VIEW count_table AS
SELECT college_code, COUNT(college_code) AS faculty_count
FROM faculty
GROUP BY college_code;

SELECT college_name FROM college
INNER JOIN count_table
ON count_table.college_code = college.college_code
ORDER BY faculty_count ASC LIMIT 1;

SELECT college_name FROM college
INNER JOIN count_table 
ON count_table.college_code = college.college_code
ORDER BY faculty_count DESC LIMIT 1;

DROP DATABASE collegeDB;
