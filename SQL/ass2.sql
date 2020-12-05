/*
*/

INSERT INTO product VALUES
  (100,'shampoo', 20.00),
  (200,'soap', 30.00),
  (300,'detergent', 40.00),
  (400,'oil', 50.00),
  (500,'watch', 60.00),
  (600,'jacket', 70.00),
  (700,'laptop', 90.00);


INSERT INTO country VALUES
  (1000,'INDIA'),
  (2000,'JAPAN'),
  (3000,'GERMANY'),
  (4000,'CHINA'),
  (5000,'AFRICA'),
  (6000,'ABC');

INSERT INTO sales_details(salesperson,product_code, idate, country, executive_name, total_cost) VALUES
 ('chetan',100,'2013-05-10','JAPAN','piyush', 20000),
 ('devendra trivedi',500,'2013-06-23','CHINA','sharma', 40000),
 ('ojas',400,'2013-08-3','ABC','piyush', 20000),
 ('john',500,'2013-01-03','GERMANY','sharma', 20000),
 ('akshay',600,'2013-03-24','INDIA','piyush', 20000);

-- 1. Insert records in employee table

REATE TABLE employee(
	id int NOT NULL,
	emp_name varchar(20), 
	designation varchar(20),
	salary float,
          joining_date date,
	PRIMARY KEY(id)
);

INSERT INTO employee VALUES
	(1,'piyush','executive',20000,'2013-2-21'),
	(2,'sharma','executive',30000,'2013-3-5'),
	(3,'chetan','salesperson',10000,'2014-7-20'),
	(4,'yash','salesperson',15000,'2015-1-12'),
	(5,'devendra trivedi','salesperson',25000,'2016-5-22'),
	(6,'ojas','salesperson',6000,'2017-6-26'),
	(106,'jonathan','salesperson',5000,'2014-3-25'),
	(107,'peter','executive',7000,'2017-4-3'),
	(108,'sweeti','salesperson',3400,'2014-5-12');

-- 2. Insert record in employee table without salary
INSERT INTO employee(id, emp_name,designation, joining_date) VALUES
	(23,'alex','executive','2013-1-1');

-- 3. Display employee whose salary is greater than 20,000
SELECT * FROM employee WHERE salary > 20000.00;

-- 5. Display salaries of all employees
SELECT salary FROM employee;

-- 6. Display employee info. as per their joining date till today
SELECT * FROM employee ORDER BY joining_date;

-- 7. Set salary=60,000 whose id=106
UPDATE employee 
	SET salary=60000.00
WHERE id=106;

-- 8. Delete from emp whose id=107
DELETE FROM employee WHERE id=107;

-- 9. Display employee info. having salary between 10,000 and 20,000
SELECT * FROM employee 
	WHERE salary BETWEEN 10000.00 AND 20000.00;

-- 10. Display employee info having salary 30000 or 40000
SELECT * FROM employee 
	WHERE salary IN(30000,40000);
	
-- 11. Display employee not having salary 30,000 or 80,000
SELECT * FROM employee 
	WHERE salary NOT IN(30000,80000);

-- 12. Display employee who join in 2015
SELECT * FROM employee
   WHERE YEAR(joining_date) = '2015';

-- 13. Match employee with '___ti'
SELECT * FROM employee WHERE emp_name LIKE '____ti';

-- 14. Find min,max salary from table
SELECT MAX(salary) FROM employee;

SELECT MIN(salary) FROM employee;

-- 15. Count total number of employees
SELECT COUNT(*) FROM employee;

-- 16. Convert value of ename to uppercase
UPDATE employee SET emp_name=UPPER(emp_name);
SELECT * FROM employee;

-- 17. Convert value of ename to lower case
UPDATE employee SET emp_name=LOWER(emp_name);
SELECT * FROM employee;

