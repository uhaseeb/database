CREATE DATABASE INFORMATION;

CREATE TABLE student(						/* create table query */
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
student_major VARCHAR(50)
);

SELECT * FROM student;						/* display table data */

DROP TABLE student;							/* delete table */

ALTER TABLE student ADD gpa DECIMAL(3,2)	/* add column to table */

ALTER TABLE student DROP COLUMN gpa			/* remove a column from table */

