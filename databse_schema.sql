use database_schema

create table employee(
emp_id int primary key not null,
first_name varchar(20),
last_name varchar(20),
birth_date date,
sex varchar(1),
salary int,
super_id int,
branch_id int
);

create table branch(
branch_id int primary key,
branch_name varchar(20),
mgr_id int,
mgr_start_date date,
FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER table employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id) ON DELETE SET NULL

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id) ON DELETE SET NULL


create table client(
client_id int primary key,
client_name varchar(20),
branch_id int,
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

create table works_with(
emp_id int not null,
client_id int not null,
total_sales int,
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

create table branch_supplier(
branch_id int,
supplier_name varchar(20),
supply_type varchar(20),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

SELECT * FROM works_with

--corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id=1 
WHERE emp_id=100

SELECT * FROM employee

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

--SCRANTON

INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id=2
WHERE emp_id=102

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--STANFORD
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id=3
WHERE emp_id=106

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

--WORKS-WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM works_with

SELECT * FROM employee ORDER BY employee.birth_date desc;

select * from employee order by employee.sex,employee.emp_id;

select * from employee where employee.birth_date BETWEEN '1970-01-01' AND '1975-01-01';

SELECT * FROM works_with WHERE total_sales>25000

SELECT DISTINCT employee.sex from employee;

select * from client where client_id IN(105,106,401)

--FUNCTIONS 
SELECT COUNT(client_id) from client

select AVG(total_sales) from works_with

select AVG(salary) from employee

SELECT COUNT(emp_id) from works_with where total_sales<=25000

SELECT SUM(salary) from employee

select COUNT(sex),sex from employee group by sex


select SUM(total_sales),client_id from works_with group by client_id


--wildcards for one charcter use _ and for random number of characters use %

-- Find any client's who are an LLC
select * from client 
where client.client_name LIKE '%LLC'

select * from client 
where client.client_name LIKE 'Times%'

select * from employee
where employee.birth_date LIKE '1967-__-__'

 --UNIONS
 --IN UNION TWO COLUMNS TO BE JOINED MUST BE OF SAME DATATYPE 
 SELECT employee.first_name as names
 from employee
 UNION 
 SELECT client.client_name from client


 SELECT first_name, emp_id from employee
 UNION 
 SELECT client_name, client_id from client
 UNION 
 SELECT supplier_name, branch_supplier.branch_id from branch_supplier



 SELECT branch_name,branch.branch_id from branch
 UNION 
 SELECT supplier_name, branch_supplier.branch_id from branch_supplier

 --JOINS

--join
SELECT employee.emp_id, employee.first_name, branch.branch_id 
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id

--LEFT JOIN 
 -- Add the extra branch
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);
SELECT employee.emp_id, employee.first_name, branch.branch_id 
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id

--RIGHT JOIN 
SELECT employee.emp_id, employee.first_name, branch.branch_id 
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id


--nested quieres
-- Find names of all employees who have sold over 50,000
select employee.first_name,employee.last_name
from employee where employee.emp_id IN(
select works_with.emp_id 
from works_with 
where total_sales>50000
);

--find name of the branch who manages FedEx client
select branch.branch_name from branch
where branch.branch_id IN(
select client.branch_id from client
where client_name = 'FedEx'
);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID

select client.client_name,client.client_id from client
where client.branch_id = (
select branch.branch_id from branch
where branch.mgr_id=102
);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID

select client.client_name,client.client_id from client
where client.branch_id = (
select branch.branch_id from branch
where branch.mgr_id = ( 
select employee.emp_id from employee
where employee.first_name LIKE('Michael%') AND employee.last_name LIKE('Scott')
)
)

--find the first name and sex of the employee who deals FedEx client
select employee.first_name,employee.sex from employee
where employee.emp_id IN(
select branch.mgr_id from branch 
where branch.branch_id IN (
select client.branch_id from client
where client.client_name = 'FedEx'
)
);

delete from branch where branch_id=2