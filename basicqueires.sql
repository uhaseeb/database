use INFORMATION

create table std_moreinfo(
student_id INT NOT NULL,
student_name VARCHAR(50),
student_major VARCHAR(50),
student_age INT 
);


INSERT INTO std_moreinfo VALUES(1, 'jack', 'biology',21)
INSERT INTO std_moreinfo VALUES(2, 'jim', 'software',20)
INSERT INTO std_moreinfo VALUES(3, 'jask', 'developer',19)
INSERT INTO std_moreinfo VALUES(4, 'mike', 'maths',18)
INSERT INTO std_moreinfo VALUES(5, 'wece', 'computer',17)
INSERT INTO std_moreinfo VALUES(6, 'ace', 'biology',22)
INSERT INTO std_moreinfo VALUES(7, 'awq', 'sociology',20)

select std_moreinfo.student_name,std_moreinfo.student_major from std_moreinfo where std_moreinfo.student_age>=20   /* where statement */

select * from std_moreinfo order by std_moreinfo.student_major DESC; /* order by statement */ 

 /*		< , >, <=, >=, <>, =   common operators used in where command */


 select * from std_moreinfo where std_moreinfo.student_major<> 'biology' order by std_moreinfo.student_age,std_moreinfo.student_id 

 select * from std_moreinfo where student_major IN ('computer','biology') AND student_age<20