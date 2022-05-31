USE INFORMATION;

CREATE TABLE student(						
student_id INT,
student_name VARCHAR(50) NOT NULL,	 /* it doesnot allow value to be null */
student_major VARCHAR(50) DEFAULT('MATHS')	/* it assigns a default value if we didnt assign vlue in insert query */
PRIMARY KEY(student_id)
);

INSERT INTO student(student_id,student_name) VALUES(1, 'WECE') /* insert specific values of the attributes */ 

select * from student

DROP table student





