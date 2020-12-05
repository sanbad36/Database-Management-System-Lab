/*

	

Design at least 10 SQL queries for suitable database application using SQL DML statements:
Insert, Select, Update, Delete with operators, functions, and set operator.
*/


SQL> create table emptable(emp_no int,emp_name varchar(10),joining_date int,salary int);

Table created.

SQL> desc emptable;
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_NO 					    NUMBER(38)
 EMP_NAME					    VARCHAR2(10)
 JOINING_DATE					    NUMBER(38)
 SALARY 					    NUMBER(38)

SQL> insert into emptable values(100,'Neha',2013,35000);

1 row created.

SQL> insert into emptable values(101,'Rajshree',2015,11000);

1 row created.

SQL> insert into emptable values(105,'Yash',2012,9000);

1 row created.

SQL> insert into emptable values(106,'Arnav',2016,15000);

1 row created.

SQL> insert into emptable values(107,'Pratik',2017,8000);

1 row created.

SQL> select * from emptable;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000
       101 Rajshree	      2015	11000
       105 Yash 	      2012	 9000
       106 Arnav	      2016	15000
       107 Pratik	      2017	 8000

SQL> update emptable
  2  set emp_name = 'Swati' 
  3  where emp_no=105;

1 row updated.

******************************************************************************

1.Display data from table

SQL> select * from emptable;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000
       101 Rajshree	      2015	11000
       105 Swati	      2012	 9000
       106 Arnav	      2016	15000
       107 Pratik	      2017	 8000

************************************************************************************

2.Display emp details having salary>30000

SQL> select * from emptable
  2  where salary>30000;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000


*************************************************************************************

3.Display record of employee having emp_name swati

SQL> select * from emptable 
  2  where emp_name='Swati';

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       105 Swati	      2012	 9000

****************************************************************************

4.Display salaries of employee without duplicate values

SQL> select distinct salary from emptable;

    SALARY
----------
     11000
      9000
     15000
     35000
      8000

*********************************************************************************

5.Display emp data in ascending order of salary

SQL> select * from emptable
  2  order by salary;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       107 Pratik	      2017	 8000
       105 Swati	      2012	 9000
       101 Rajshree	      2015	11000
       106 Arnav	      2016	15000
       100 Neha 	      2013	35000

*********************************************************************************

6.Display emp data in descending order of salary

SQL> select * from emptable
  2  order by joining_date desc;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       107 Pratik	      2017	 8000
       106 Arnav	      2016	15000
       101 Rajshree	      2015	11000
       100 Neha 	      2013	35000
       105 Swati	      2012	 9000

**********************************************************************************

7.update salary=50000 of emp no 106

SQL> update emptable
  2  set salary=50000
  3  where emp_no=106;

1 row updated.

SQL> select * from emptable;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000
       101 Rajshree	      2015	11000
       105 Swati	      2012	 9000
       106 Arnav	      2016	50000
       107 Pratik	      2017	 8000

**********************************************************************************

8.Delete record 107 from emp table

SQL> delete from emptable
  2  where emp_no=107;

1 row deleted.

SQL> select * from emptable;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000
       101 Rajshree	      2015	11000
       105 Swati	      2012	 9000
       106 Arnav	      2016	15000

*************************************************************************************

9.Display record with salary between 10000 and 20000


SQL> select * from emptable
  2  where salary between 10000 and 20000;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       101 Rajshree	      2015	11000
       106 Arnav	      2016	15000

**********************************************************************************

10.Display record of emp whose salary is 8000 and 30000


SQL> select * from emptable
  2  where salary=8000
  3  or
  4  salary=30000;

no rows selected

*****************************************************************************

11.Display record of emp who join in 2013


SQL> select * from emptable
  2  where joining_date=2013;

    EMP_NO EMP_NAME   JOINING_DATE     SALARY
---------- ---------- ------------ ----------
       100 Neha 	      2013	35000

*************************************************************************************

12.find out min and max salary

SQL> select min(salary) from emptable;

MIN(SALARY)
-----------
       9000

SQL> select max(salary) from emptable;

MAX(SALARY)
-----------
      35000

***************************************************************************************

13.display count of emp who did not join in 2015

SQL> select count(joining_date)
  2  from emptable
  3  where joining_date not in 2015;

COUNT(JOINING_DATE)
-------------------
		  3

***************************************************************************************

14.Display total salary

SQL> select sum(salary) from emptable;

SUM(SALARY)
-----------
      70000

****************************************************************************************

15.convert emp name to lower and upper case

SQL> select upper(emp_name) from emptable;

UPPER(EMP_
----------
NEHA
RAJSHREE
SWATI
ARNAV

SQL> select lower(emp_name) from emptable;

LOWER(EMP_
----------
neha
rajshree
swati
arnav

************************************************************** ******************************

SQL> create table prodtable(pro_id int,pro_name varchar(10),quantity int,price int);

Table created.

SQL> insert into prodtable values(10,'Mobile',1,20000);

1 row created.

SQL> insert into prodtable values(12,'Laptop',3,40000);

1 row created.

SQL> insert into prodtable values(14,'Tablets',4,35000);

1 row created.

SQL> insert into prodtable values(16,'Printer',2,45000);

1 row created.

SQL> select * from prodtable;

    PRO_ID PRO_NAME	QUANTITY      PRICE
---------- ---------- ---------- ----------
	10 Mobile	       1      20000
	12 Laptop	       3      40000
	14 Tablets	       4      35000
	16 Printer	       2      45000

SQL> update prodtable
  2  set quantity=5
  3  where pro_id=10;

1 row updated.

SQL> update prodtable 
  2  set quantity=7
  3  where pro_id =16;

1 row updated.

SQL> select * from prodtable;

    PRO_ID PRO_NAME	QUANTITY      PRICE
---------- ---------- ---------- ----------
	10 Mobile	       5      20000
	12 Laptop	       3      40000
	14 Tablets	       4      35000
	16 Printer	       7      45000

**********************************************************************************************


SQL> create table salesdetail(sell_no int,pro_id int,quantity int,price int,customer_name varchar(10));

Table created.

SQL> insert into salesdetail values(1,10,2,15000,'Neha');

1 row created.

SQL> insert into salesdetail values(2,12,1,20000,'Yash');

1 row created.

SQL> insert into salesdetail values(3,14,2,30000,'Rahul');

1 row created.

SQL> select * from salesdetail;

   SELL_NO     PRO_ID	QUANTITY      PRICE CUSTOMER_N
---------- ---------- ---------- ---------- ----------
	 1	   10	       2      15000 Neha
	 2	   12	       1      20000 Yash
	 3	   14	       2      30000 Rahul

**************************************************************************

1.Write a query to retrive ID's of all product even if they were sell or present in storage room

SQL> select pro_id from prodtable
  2  union
  3  select pro_id from salesdetail;

    PRO_ID
----------
	10
	12
	14
	16

*************************************************************************

2.Write a query to retrive ID's of all sold products

SQL> select pro_id from salesdetail;

    PRO_ID
----------
	10
	12
	14

************************************************************************

3.minus the rows which are present in 1st query but absent in 2nd query with no duplicates

SQL> select distinct pro_id from prodtable
  2  minus
  3  select distinct pro_id from salesdetail
  4  ;

    PRO_ID
----------
	16

*************************************************************************** 



