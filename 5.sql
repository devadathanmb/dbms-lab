-- Question 5

CREATE DATABASE libraryDB;
USE libraryDB;


CREATE TABLE book(
	accession_no INT PRIMARY KEY,
	title VARCHAR(255),
	publisher VARCHAR(255),
	year INT,
	date_of_purchase DATE,
	status VARCHAR(255)
);

CREATE TABLE member(
	member_id INT PRIMARY KEY,
	name VARCHAR(255),
	number_of_books_issued INT,
	max_limit INT
);

CREATE TABLE books_issue(
	accession_no INT,
	member_id INT,
	date_of_issue DATE,
	FOREIGN KEY (accession_no) REFERENCES book(accession_no),
	FOREIGN KEY (member_id) REFERENCES member(member_id)
);


INSERT INTO book VALUES
	(1, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "issued"),
	(2, "Life of pi", "DC Books",  2011, "2012-05-23", "issued"),
	(3, "Hear yourself", "ABC Books",  2016, "2017-06-11", "issued"),
	(4, "Five second rule", "DC Books",  2011, "2012-03-12", "issued"),
	(5, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "issued"),
	(6, "A book of mine", "ABC Books",  2020, "2021-03-04", "issued"),
	(7, "Tomb of sand", "Best Publishers",   2000, "2002-04-22", "issued"),
	(8, "A place called home", "Krishna Publishers",  2005, "2006-04-11", "issued"),
	(9, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "issued"),
	(10, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "cannot be issued"),
	(11, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "cannot be issued"),
	(12, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "reference"),
	(13, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "issued"),
	(14, "Wings of fire", "Kalam Books",  2010, "2012-04-12", "issued"),
	(15, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "issued"),
	(16, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "reference"),
	(17, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "issued"),
	(18, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "issued"),
	(19, "Can't hurt me", "Goggins books", 2018, "2019-05-22", "issued"),
	(20, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "issued"),
	(21, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "reference"),
	(22, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "reference"),
	(23, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "cannot be issued"),
	(24, "Linux from scratch", "FOSS Books",  1999, "2002-04-12", "present"),
	(25, "Life of pi", "DC Books",  2011, "2012-05-23", "present"),
	(26, "Life of pi", "DC Books",  2011, "2012-05-23", "present"),
	(27, "Life of pi", "DC Books",  2011, "2012-05-23", "present"),
	(28, "Life of pi", "DC Books",  2011, "2012-05-23", "present"),
	(29, "Five second rule", "DC Books",  2011, "2012-03-12", "issued"),
	(30, "Five second rule", "DC Books",  2011, "2012-03-12", "reference"),
	(31, "Five second rule", "DC Books",  2011, "2012-03-12", "present"),
	(32, "Hear yourself", "ABC Books",  2016, "2017-06-11", "present"),
	(33, "Hear yourself", "ABC Books",  2016, "2017-06-11", "present");

INSERT INTO member VALUES
	(101, "Ram Prakash Shukla", 1, 3),
	(102, "Adithya Chaudhary", 2, 3),
	(103, "Nikilesh Jain", 4, 6),
	(104, "Samay Raina", 2, 5),
	(105, "Sagar Shah", 1, 2),
	(106, "Anish Giri", 1, 1),
	(107, "Vidit Gujarati", 0, 3),
	(108, "Dawal Sherawat", 0, 3);

INSERT INTO books_issue VALUES
	(1, 101, "2022-05-22"),
	(2, 102, "2022-07-23"),
	(3, 103, "2022-05-28"),
	(4, 104, "2020-02-22"),
	(5, 105, "2021-09-21"),
	(6, 106, "2021-03-23"),
	(2, 101, "2022-05-25"),
	(2, 101, "2022-05-25"),
	(2, 102, "2022-05-25"),
	(32, 102, "2022-05-25"),
	(28, 102, "2022-05-25"),
	(2, 103, "2022-05-25");



SELECT * FROM book;
SELECT * FROM member;
SELECT * FROM books_issue;

-- Question a
-- List all those books which are due from the students. A Book is considered as Due if it has been
-- issued 15 days back and not yet returned.

SELECT book.* FROM book INNER JOIN books_issue ON book.accession_no = books_issue.accession_no
WHERE DATEDIFF("2022-03-22", date_of_issue) > 15;

-- Question b
-- List all members who cannot be issued any more books.

SELECT * FROM member WHERE number_of_books_issued = max_limit; 


-- Question c
-- List the details of the book which is taken by the maximum number of members and the book which
-- is taken by the least number of members.

CREATE VIEW count_table AS
SELECT COUNT(book.title) AS taken_count, book.title FROM books_issue INNER JOIN book ON book.accession_no = books_issue.accession_no GROUP BY book.title;


SELECT title FROM count_table WHERE taken_count = (SELECT MAX(taken_count) FROM count_table);
SELECT title FROM count_table WHERE taken_count = (SELECT MIN(taken_count) FROM count_table);

-- Question d
-- List the details of the book which is taken by every member and the one that is not yet issued.

SELECT COUNT(title), title FROM book INNER JOIN books_issue ON book.accession_no = books_issue.accession_no GROUP BY title;
SELECT COUNT(member_id) FROM member;

DROP DATABASE libraryDB;
