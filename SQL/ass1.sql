/*
Create tables-
Employee : (emp_name,designation,stream,city)
Workers : (emp_name,company_name,salary,manager_name,city)
Company:(company_name,manager_name)

1.Display all employee names.
2.Display all employee's earning more than 30,000.
3.Display employees that work for 'TCS'.
4.Display the employees who can earn more than 25,000 and work for 'WIPRO'.
5.Display all employee's data.
6.Display the employees who work under manager 'Rahul'.
7.Display the companies located in 'Mumbai'.
8.Display citywise employees details.
9.Display highest salary of employees.
10.Display Lowest salary of employees
11.Display all employees names starting with 's'.
*/



mysql> use ass1;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------+
| Tables_in_ass1 |
+----------------+
| company        |
| employee       |
| worker         |
+----------------+
3 rows in set (0.00 sec)

mysql> select * from company;
Empty set (0.00 sec)

mysql> select * from employee;
+----------+-------------+---------+--------+
| emp_name | designation | stream  | city   |
+----------+-------------+---------+--------+
| raja     | senior      | streamA | Nashik |
| derek    | Junior      | streamB | Pune   |
| piyush   | senior      | streamC | Mumbai |
+----------+-------------+---------+--------+
3 rows in set (0.00 sec)

mysql> select * from worker;
Empty set (0.00 sec)

mysql> insert into employee values("sanket","Junior","streamD","Pune");
Query OK, 1 row affected (0.37 sec)

mysql> insert into employee values("yash","senior","streamE","Mumbai");
Query OK, 1 row affected (0.36 sec)

mysql> select * from employee;
+----------+-------------+---------+--------+
| emp_name | designation | stream  | city   |
+----------+-------------+---------+--------+
| raja     | senior      | streamA | Nashik |
| derek    | Junior      | streamB | Pune   |
| piyush   | senior      | streamC | Mumbai |
| sanket   | Junior      | streamD | Pune   |
| yash     | senior      | streamE | Mumbai |
+----------+-------------+---------+--------+
5 rows in set (0.00 sec)

mysql> insert into worker values("Vidit","TCS",35000,"Rahul","Mumbai");
Query OK, 1 row affected (0.34 sec)

mysql> insert into worker values("Aryan","Wipro",20000,"Aakash","Pune");
Query OK, 1 row affected (0.34 sec)

mysql> insert into worker values("Vedant","Wipro",40000,"Rahul","Banglore");
Query OK, 1 row affected (0.05 sec)

mysql> insert into worker values("Sagar","esds",33000,"Nakul","Mumbai");
Query OK, 1 row affected (0.06 sec)

mysql> insert into worker values("Sarthak","Wipro",15000,"Rahul","Pune");
Query OK, 1 row affected (0.34 sec)

mysql> insert into worker values("Raj","TCS",45000,"Aakash","Banglore");
Query OK, 1 row affected (0.34 sec)

mysql> insert into worker values("Prakash","TCS",10000,"Shubham","Pune");
Query OK, 1 row affected (0.34 sec)

mysql> select * from worker;
+----------+---------+--------+---------+----------+
| emp_name | company | salary | manager | city     |
+----------+---------+--------+---------+----------+
| Vidit    | TCS     |  35000 | Rahul   | Mumbai   |
| Aryan    | Wipro   |  20000 | Aakash  | Pune     |
| Vedant   | Wipro   |  40000 | Rahul   | Banglore |
| Sagar    | esds    |  33000 | Nakul   | Mumbai   |
| Sarthak  | Wipro   |  15000 | Rahul   | Pune     |
| Raj      | TCS     |  45000 | Aakash  | Banglore |
| Prakash  | TCS     |  10000 | Shubham | Pune   | 
| Neha   |  TCS     |  12000   |  Nikita   |  Nashik| 
+----------+---------+--------+---------+----------+
7 rows in set (0.00 sec)

mysql> insert into company values("TCS","Rahul");
Query OK, 1 row affected (0.34 sec)

mysql> insert into company values("Yash","Aakash");
Query OK, 1 row affected (0.05 sec)

mysql> insert into company values("Wipro","Rahul");
Query OK, 1 row affected (0.05 sec)

mysql> insert into company values("TCS","Yash");
Query OK, 1 row affected (0.05 sec)

mysql> insert into company values("esds","Gauri");
Query OK, 1 row affected (0.32 sec)

****************************************************************************

1.Display all employees name

mysql> select emp_name from employee
    -> union
    -> select emp_name from worker;
+----------+
| emp_name |
+----------+
| raja     |
| derek    |
| piyush   |
| sanket   |
| yash     |
| Vidit    |
| Aryan    |
| Vedant   |
| Sagar    |
| Sarthak  |
| Raj      |
| Prakash |
| Neha  |
+----------+

****************************************************************************

2.Display all employees earning more than 30000

mysql> select emp_name,salary from worker
    -> where salary>30000;
+----------+--------+
| emp_name | salary |
+----------+--------+
| Vidit    |  35000 |
| Vedant   |  40000 |
| Sagar    |  33000 |
| Raj      |  45000 |
+----------+--------+

******************************************************************************

3.Display employee that work for TCS

mysql> select emp_name,company from worker
    -> where company="TCS";
+----------+---------+
| emp_name | company |
+----------+---------+
| Vidit    | TCS     |
| Raj      | TCS     |
| Prakash  | TCS     |
| Neha   |  TCS   |
+----------+---------+

****************************************************************************

4.Display employees who can earn more than 25000 and work for Wipro

mysql> select * from worker
    -> where company="Wipro" and
    -> salary>25000;
+----------+---------+--------+---------+----------+
| emp_name | company | salary | manager | city     |
+----------+---------+--------+---------+----------+
| Vedant   | Wipro   |  40000 | Rahul   | Banglore |
+----------+---------+--------+---------+----------+

******************************************************************************

5.Display all employees data

mysql> select * from employee;
+----------+-------------+---------+--------+
| emp_name | designation | stream  | city   |
+----------+-------------+---------+--------+
| raja     | senior      | streamA | Nashik |
| derek    | Junior      | streamB | Pune   |
| piyush   | senior      | streamC | Mumbai |
| sanket   | Junior      | streamD | Pune   |
| yash     | senior      | streamE | Mumbai |
+----------+-------------+---------+--------+

******************************************************************************

6.Display employees who work under manager Rahul

mysql> select emp_name,manager from worker
    -> where manager="Rahul";
+----------+---------+
| emp_name | manager |
+----------+---------+
| Vidit    | Rahul   |
| Vedant   | Rahul   |
| Sarthak  | Rahul   |
+----------+---------+

******************************************************************************

7.Display companees located in mumbai city

mysql> select company,city from worker
    -> where city="Mumbai";
+---------+--------+
| company | city   |
+---------+--------+
| TCS     | Mumbai |
| esds    | Mumbai |
+---------+--------+

*******************************************************************************

8.Display citywise employee details

mysql> select * from worker order by city;

+----------+---------+--------+---------+----------+
| emp_name | company | salary | manager | city     |
| Raj      | TCS     |  45000 | Aakash  | Banglore |
| Vedant   | Wipro   |  40000 | Rahul   | Banglore |
| Sagar    | esds    |  33000 | Nakul   | Mumbai   |
| Vidit    | TCS     |  35000 | Rahul   | Mumbai   |
| Neha   |  TCS     |  12000   |  Nikita   |  Nashik| 
| Prakash  | TCS     |  10000 | Shubham | Pune   | 
| Aryan    | Wipro   |  20000 | Aakash  | Pune     |
| Sarthak  | Wipro   |  15000 | Rahul   | Pune     |
+----------+---------+--------+---------+----------+


******************************************************************************

9.Display all employee name starting with 'S'

mysql> select emp_name from worker where emp_name like 's%';
+-----------+
| emp_name  |
+-----------+
| sagar   |
| sarthak|
+-----------+


*****************************************************************************

10.Display highest salary of employee

mysql> select max(salary) from worker;
+-------------+
| max(salary) |
+-------------+
|       45000 |
+-------------+

*****************************************************************************

11.Display minimum salary of employee

mysql> select min(salary) from worker;
+-------------+
| min(salary) |
+-------------+
|       10000 |
+-------------+

****************************************************************************

12.create view company that will contain company_name and emp_name

mysql> create or replace view view_company 
    -> as select emp_name,company
    -> from worker;
Query OK, 0 rows affected (0.06 sec)

***************************************************************************

13.insert 5 tuples in view company

mysql> insert into view_company values('Sarthak','Wipro');
Query OK, 1 row affected (0.06 sec)

mysql> insert into view_company values('Neha','Zensar');
Query OK, 1 row affected (0.07 sec)

mysql> insert into view_company values('Nisha','ESDS');
Query OK, 1 row affected (0.03 sec)

mysql> insert into view_company values('Yash','Winjit');
Query OK, 1 row affected (0.04 sec)

mysql> insert into view_company values('Pratik','Zensar');
Query OK, 1 row affected (0.05 sec)

mysql> select * from view_company;
+----------+---------+
| emp_name | company |
+----------+---------+
| Sarthak  | Wipro   |
| Neha     | Zensar  |
| Nisha    | ESDS    |
| Yash     | Winjit  |
| Pratik   | Zensar  |
+----------+---------+
5 rows in set (0.00 sec)

********************************************************************************

2.delete 3 tuples from above view

mysql> delete from view_company where emp_name='Neha';
Query OK, 1 row affected (0.05 sec)

mysql> delete from view_company where emp_name='Pratik';
Query OK, 1 row affected (0.06 sec)

mysql> delete from view_company where emp_name='Sarthak';
Query OK, 1 row affected (0.04 sec)

mysql> select * from view_company;
+----------+---------+
| emp_name | company |
+----------+---------+
| Nisha    | ESDS    |
| Yash     | Winjit  |
+----------+---------+
2 rows in set (0.00 sec)

***********************************************************************************
mysql> 

