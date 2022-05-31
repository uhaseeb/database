use INFORMATION

create table std_info(
student_id INT NOT NULL,
student_name VARCHAR(50),
student_major VARCHAR(50)
);

INSERT INTO std_info VALUES(1, 'jack', 'biology')
INSERT INTO std_info VALUES(2, 'jim', 'software')
INSERT INTO std_info VALUES(3, 'jack', 'developer')
INSERT INTO std_info VALUES(4, 'jack', 'maths')
INSERT INTO std_info VALUES(5, 'jack', 'computer')
INSERT INTO std_info VALUES(6, 'jack', 'biology')

update std_info set student_major= 'Computer Science' where student_major= 'software' or student_major= 'developer'

update std_info set student_name='haseeb', student_major='SE' where student_id=4
select * from std_info;

delete from std_info where student_id=5

delete from std_info where student_major='biology'
