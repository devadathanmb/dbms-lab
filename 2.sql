-- Question 2

CREATE DATABASE libraryDB;
USE libraryDB;

CREATE TABLE book(
    accession_no INT PRIMARY KEY,
    title VARCHAR(255),
    publisher VARCHAR(255),
    author VARCHAR(255),
    date_of_purchase DATE,
    date_of_publishing DATE,
    status VARCHAR(255),
    CHECK (status IN ("issued", "present in library", "reference", "cannot be issued"))
);

INSERT INTO book VALUES
    (1, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "present in library"),
    (2, "Hear yourself", "MC Books", "Prem Rawat", "2022-05-06", "2020-05-03", "issued"),
    (3, "Monsoon", "Gret Books", "Sahitya Akademi", "2021-03-06", "2019-04-03", "present in library"),
    (4, "Tomb of sand", "DC Books", "Geetanjali Shree", "2022-03-06", "2020-12-08", "issued"),
    (5, "Linux bible", "Wiley", "Christopher Negus", "2020-05-06", "2008-08-23", "reference"),
    (6, "Introduction to calculus", "DC Books", "Febin John", "2022-05-06", "2020-02-13", "reference"),
    (7, "Linux from scratch", "FOSS Books", "Gerad Beekmans", "2012-03-03", "1999-11-03", "issued"),
    (8, "Life of pi", "MC Books", "Yann Martel", "2011-05-06", "2001-04-03", "present in library"),
    (9, "Can't hurt me", "Goggins books", "David Goggins", "2019-05-06", "2018-11-03", "issued"),
    (10, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "cannot be issued"),
    (11, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "present in library"),
    (12, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "issued"),
    (13, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "issued"),
    (14, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "cannot be issued"),
    (15, "A Place Called Home", "DC Books", "Preeti Shenoy", "2022-05-06", "2020-04-03", "present in library"),
    (42, "Hear yourself", "MC Books", "Prem Rawat", "2022-05-06", "2020-05-03", "issued"),
    (16, "Hear yourself", "MC Books", "Prem Rawat", "2022-05-06", "2020-05-03", "present in library"),
    (17, "Hear yourself", "MC Books", "Prem Rawat", "2022-05-06", "2020-05-03", "issued"),
    (18, "Hear yourself", "MC Books", "Prem Rawat", "2022-05-06", "2020-05-03", "issued"),
    (19, "Monsoon", "Gret Books", "Sahitya Akademi", "2021-03-06", "2019-04-03", "reference"),
    (20, "Monsoon", "Gret Books", "Sahitya Akademi", "2021-03-06", "2019-04-03", "reference"),
    (21, "Tomb of sand", "DC Books", "Geetanjali Shree", "2022-03-06", "2020-12-08", "issued"),
    (22, "Tomb of sand", "DC Books", "Geetanjali Shree", "2022-03-06", "2020-12-08", "cannot be issued"),
    (23, "Tomb of sand", "DC Books", "Geetanjali Shree", "2022-03-06", "2020-12-08", "cannot be issued"),
    (24, "Tomb of sand", "DC Books", "Geetanjali Shree", "2022-03-06", "2020-12-08", "present in library"),
    (25, "Linux bible", "Wiley", "Christopher Negus", "2020-05-06", "2008-08-23", "reference"),
    (26, "Introduction to calculus", "DC Books", "Febin John", "2022-05-06", "2020-02-13", "reference"),
    (27, "Introduction to calculus", "DC Books", "Febin John", "2022-05-06", "2020-02-13", "reference"),
    (28, "Linux from scratch", "FOSS Books", "Gerad Beekmans", "2012-03-03", "1999-11-03", "issued"),
    (29, "Linux from scratch", "FOSS Books", "Gerad Beekmans", "2012-03-03", "1999-11-03", "issued"),
    (30, "Linux from scratch", "FOSS Books", "Gerad Beekmans", "2012-03-03", "1999-11-03", "reference"),
    (31, "Life of pi", "MC Books", "Yann Martel", "2011-05-06", "2001-04-03", "present in library"),
    (32, "Life of pi", "MC Books", "Yann Martel", "2011-05-06", "2001-04-03", "issued"),
    (33, "Can't hurt me", "Goggins books", "David Goggins", "2019-05-06", "2018-11-03", "issued"),
    (34, "Can't hurt me", "Goggins books", "David Goggins", "2019-05-06", "2018-11-03", "issued"),
    (35, "Can't hurt me", "Goggins books", "David Goggins", "2019-05-06", "2018-11-03", "issued"),
    (36, "Can't hurt me", "Goggins books", "David Goggins", "2019-05-06", "2018-11-03", "issued"),
    (37, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "cannot be issued"),
    (38, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "present in library"),
    (39, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "present in library"),
    (40, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "present in library"),
    (41, "Five second rule", "MC Books", "Mel Robbins", "2015-03-06", "2013-04-03", "present in library"),
    (43, "Book of mine", "RMC Books", "Aswin", "2012-03-06", "2011-04-03", "present in library");


-- Display all the table entries
SELECT * FROM book;

-- Question a
-- List out the total number of copies of each book in the library.

SELECT title, COUNT(title) AS copies FROM book 
GROUP BY title;

-- Question b
-- List out the total number of reference copies for each book in the Library.

SELECT title, COUNT(title) AS reference_copies FROM book
WHERE status = "reference"
GROUP BY title;

-- Question c (incomplete)
-- For each book in the Library obtain a count of the total number of issued copies, number copies
-- existing at present in the library and the number of reference copies

CREATE VIEW issued_table AS
SELECT title, COUNT(title) AS issued_copies FROM book
WHERE status = "issued"
GROUP BY title;

CREATE VIEW reference_table AS
SELECT title, COUNT(title) AS reference_copies FROM book
WHERE status = "reference"
GROUP BY title;

CREATE VIEW present_table AS
SELECT title, COUNT(title) AS present_copies FROM book
WHERE status = "present in library"
GROUP BY title;

SELECT issued_table.title, issued_table.issued_copies FROM issued_table LEFT JOIN reference_table ON issued_table.title = reference_table.title;

SELECT reference_table.title, reference_table.reference_copies FROM reference_table RIGHT JOIN issued_table ON issued_table.title = reference_table.title;

-- Qestion d
-- List out the details of various books of each publisher with status of the books set to “cannot be issued”.

SELECT title, publisher, author, date_of_purchase, date_of_publishing FROM book WHERE status = "cannot be issued" GROUP BY publisher, title;

-- Question e
-- List out the details of the books which are new arrivals. The books which are purchased during the last 6 months are categorized as new arrivals.

SELECT DISTINCT title, publisher, author, date_of_purchase, date_of_publishing FROM book
WHERE TIMESTAMPDIFF(MONTH, date_of_purchase, now()) < 6;

-- Question f
-- List out the details of each famous book . Each Famous book should be purchased within 1 year of its date of publishing and the number of total copies is more than 10

SELECT * FROM (
    SELECT DISTINCT title, publisher, author, date_of_purchase, date_of_publishing FROM book
    WHERE TIMESTAMPDIFF(MONTH, date_of_publishing, date_of_purchase) <= 12)
    AS t1
INNER JOIN (
    SELECT title, COUNT(title) AS copies FROM book GROUP BY title HAVING copies > 1
) AS t2
ON t1.title = t2.title;


DROP DATABASE libraryDB;
