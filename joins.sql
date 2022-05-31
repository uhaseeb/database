use practice

create table student_info(
std_id int primary key,
std_name varchar(30),
std_age int
);

create table acdemic_info(
sub_id int primary key,
sub_name varchar(30),
sub_marks int,
student_id int,
FOREIGN KEY(student_id) REFERENCES student_info(std_id) ON DELETE set NULL
);

insert into student_info values(1,'Ali',19)
insert into student_info values(2,'Ahmad',20)
insert into student_info values(3,'Ahsan',21)
insert into student_info values(4,'Asad',22)
insert into student_info values(5,'Asam',25)
insert into student_info values(6,'Asif',24)
insert into student_info values(7,'Aqib',28)

insert into acdemic_info values(351,'OOP',50,1)
insert into acdemic_info values(352,'PF',50,2)
insert into acdemic_info values(353,'WE',50,3)
insert into acdemic_info values(354,'DB',50,4)
insert into acdemic_info values(355,'SQE',54,5)
insert into acdemic_info values(356,'QA',23,null)
insert into acdemic_info values(357,'IS',53,null)
insert into acdemic_info values(358,'ML',89,null)

-- 4 tyoes of joins inner,left,right,outer
select student_info.std_id,student_info.std_name,acdemic_info.sub_name,acdemic_info.sub_marks
from student_info
JOIN acdemic_info
ON student_info.std_id=acdemic_info.student_id;

delete from acdemic_info
delete from student_info