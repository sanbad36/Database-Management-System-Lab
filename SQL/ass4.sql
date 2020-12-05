/*
	

Design at least 10 SQL queries for suitable database application using SQL DML statements:
all types of Join, Sub-Query and View.
*/

SQL> select * from product;

	ID NAME 		     PRICE	  QTY
---------- -------------------- ---------- ----------
       101 TV			     35000	   10
       102 Freeze		     20000	    4
       103 Laptop		     45000	    5
       104 Mixer		     10000	   15
       105 Fan			       500	   20
       106 LCD			      5000	    2
       107 Mobile		     35000	    3
       108 Hard-disk		     19000	    4
       109 PC			     30000	    7
       110 Tablet		     20000	    8

10 rows selected.

*****************************************************************************


SQL> create table sales_detail(sale_no int,id int,quantity int,price int,cust_name varchar(10));

Table created.



SQL> insert into sales_detail values(1,104,10,25000,'Neha');

1 row created.


SQL> insert into sales_detail values(3,101,9,34000,'Priti');

1 row created.

SQL> insert into sales_detail values(4,109,2,8000,'Sayali');

1 row created.


SQL> insert into sales_detail values(5,102,5,45000,'Aryan');

1 row created.


SQL> insert into sales_detail values(9,105,18,31000,'Piyush');

1 row created.

SQL> insert into sales_detail values(10,106,13,13000,'Yash');

1 row created.

SQL> select * from sales_detail;

   SALE_NO	   ID	QUANTITY      PRICE CUST_NAME
---------- ---------- ---------- ---------- ----------
	 1	  104	      10      25000 Neha
	 3	  101	       9      34000 Priti
	 5	  102	       5      45000 Aryan
	 9	  105	      18      31000 Piyush
	10	  106	      13      13000 Yash

*************************************************************************************

1).apply inner join on tables thatt have matching values in both tabels

SQL> select product.id,product.name,sales_detail.price,sales_detail.quantity
  2  from product INNER JOIN sales_detail
  3  on product.id=sales_detail.id;

	ID NAME 		     PRICE   QUANTITY
---------- -------------------- ---------- ----------
       104 Mixer		     25000	   10
       101 TV			     34000	    9
       102 Freeze		     45000	    5
       105 Fan			     31000	   18
       106 LCD			     13000	   13

***********************************************************************************

2).Apply left outer join on tables that have matching values in both tabels

SQL> select product.id,product.name,sales_detail.price,sales_detail.quantity
  2  from product LEFT OUTER JOIN sales_detail
  3  on product.id=sales_detail.id;

	ID NAME 		     PRICE   QUANTITY
---------- -------------------- ---------- ----------
       104 Mixer		     25000	   10
       101 TV			     34000	    9
       102 Freeze		     45000	    5
       105 Fan			     31000	   18
       106 LCD			     13000	   13
       103 Laptop
       109 PC
       110 Tablet
       108 Hard-disk
       107 Mobile

10 rows selected.

****************************************************************************************

3)Apply right outer join on tables thatt have matching values in both tabels


SQL> select product.id,product.name,sales_detail.cust_name,sales_detail.price,sales_detail.quantity
  2  from product RIGHT OUTER JOIN sales_detail
  3  on product.id=sales_detail.id;

	ID NAME 		CUST_NAME	PRICE	QUANTITY
---------- -------------------- ---------- ---------- ----------
       101 TV			Priti		34000	       9
       102 Freeze		Aryan		45000	       5
       104 Mixer		Neha		25000	      10
       105 Fan			Piyush		31000	      18
       106 LCD			Yash		13000	      13

***************************************************************************************************

4)Apply full outer join on tables

SQL> select product.id,product.name,sales_detail.cust_name,sales_detail.price,sales_detail.quantity
  2  from product FULL OUTER JOIN sales_detail
  3  on product.id=sales_detail.id;

	ID NAME 		CUST_NAME	PRICE	QUANTITY
---------- -------------------- ---------- ---------- ----------
       104 Mixer		Neha		25000	      10
       101 TV			Priti		34000	       9
       102 Freeze		Aryan		45000	       5
       105 Fan			Piyush		31000	      18
       106 LCD			Yash		13000	      13
       103 Laptop
       109 PC
       110 Tablet
       108 Hard-disk
       107 Mobile

10 rows selected.

*****************************************************************************************
5)all sold product names

SQL> select product.id,product.name
  2  from product,sales_detail
  3  where product.id=sales_detail.id;

	ID NAME
---------- --------------------
       104 Mixer
       101 TV
       102 Freeze
       105 Fan
       106 LCD

************************************************************************************************

SQL> create table project(proj_id varchar(10),name varchar(10),architect varchar(10));

Table created.

SQL> create table emp2(emp_id int,name varchar(10));

Table created.

SQL> create table assign_to(proj_id varchar(10),emp_id int);

Table created.


SQL> insert into project values('A100','Database','Pratik');

1 row created.

SQL> insert into project values('B200','VB','Rani');

1 row created.

SQL> insert into project values('C300','Database','Yash');

1 row created.

SQL> insert into project values('D400','VB','Prakash');

1 row created.

SQL> insert into project values('E500','CN','Priti');

1 row created.

SQL> select * from project;

PROJ_ID    NAME       ARCHITECT
---------- ---------- ----------
A100	   Database   Pratik
B200	   VB	      Rani
C300	   Database   Yash
D400	   VB	      Prakash
E500	   CN	      Priti

****************************************************************************

SQL> insert into emp2 values(101,'Prakash');

1 row created.

SQL> insert into emp2 values(102,'Priti');

1 row created.

SQL> insert into emp2 values(104,'Yash');

1 row created.

SQL> insert into emp2 values(107,'Pratik');

1 row created.

SQL> select * from emp2;

    EMP_ID NAME
---------- ----------
       101 Prakash
       102 Priti
       104 Yash
       107 Pratik


****************************************************************************

SQL> insert into assign_to values('A100',101);

1 row created.

SQL> insert into assign_to values('C300',104);

1 row created.

SQL> insert into assign_to values('D400',102);

1 row created.

SQL> select * from assign_to;

PROJ_ID        EMP_ID
---------- ----------
A100		  101
C300		  104
D400		  102

**********************************************************************************
1)get emp_no of employees working on project 'C300'

SQL> select emp2.emp_id,project.proj_id             
  2  from project,emp2
  3  where emp2.name=project.architect
  4  and project.proj_id='C300';

    EMP_ID PROJ_ID
---------- ----------
       104 C300

**********************************************************************************

2)obtain details of employee working on database project

SQL> select emp2.emp_id,project.proj_id,project.name,project.architect
  2  from project,emp2
  3  where emp2.name=project.architect
  4  and project.name='Database';

    EMP_ID PROJ_ID    NAME	 ARCHITECT
---------- ---------- ---------- ----------
       104 C300       Database	 Yash
       107 A100       Database	 Pratik

************************************************************************************

3)get details of emp working on both database and VB project

SQL> select emp2.emp_id,project.proj_id,project.name,project.architect
  2  from project,emp2
  3  where emp2.name=project.architect
  4  and project.name in('Database','VB');

    EMP_ID PROJ_ID    NAME	 ARCHITECT
---------- ---------- ---------- ----------
       107 A100       Database	 Pratik
       104 C300       Database	 Yash
       101 D400       VB	 Prakash
       104 F600       VB	 Yash

**************************************************************************************

4)get emp_no of employees who work on all projects

SQL> select emp2.emp_id,project.proj_id,project.name,project.architect
  2  from project,emp2
  3  where emp2.name=project.architect
  4  and project.name in ('Database','VB','CN');

    EMP_ID PROJ_ID    NAME	 ARCHITECT
---------- ---------- ---------- ----------
       107 A100       Database	 Pratik
       104 C300       Database	 Yash
       101 D400       VB	 Prakash
       102 E500       CN	 Priti
       104 F600       VB	 Yash

*************************************************************************************

SQL> create table emp3(name varchar(10),no int,skill varchar(10),pay_rate int);

Table created.

SQL> create table position(posting varchar(10),skill varchar(10));

Table created.

SQL> create table duty_allocation(posting_no int,emp_no int,day date,shift varchar(10));

Table created.

SQL> insert into emp3 values('Prakash',101,'type1',10);

1 row created.

SQL> insert into emp3 values('Sneha',102,'type2',20);

1 row created.

SQL> insert into emp3 values('Snehal',104,'type3',5);

1 row created.

SQL> insert into emp3 values('Rajesh',107,'type4',7);

1 row created.

SQL> select * from emp3;

NAME		   NO SKILL	   PAY_RATE
---------- ---------- ---------- ----------
Prakash 	  101 type1		 10
Sneha		  102 type2		 20
Snehal		  104 type3		  5
Rajesh		  107 type4		  7

************************************************************************************

SQL> insert into position values(201,'type1');

1 row created.

SQL> insert into position values(202,'type2');

1 row created.

SQL> insert into position values(203,'type3');

1 row created.

SQL> select * from position;

POSTING    SKILL
---------- ----------
201	   type1
202	   type2
203	   type3

*********************************************************************************

SQL> insert into duty_allocation values(201,101,'23-05-2008','night');

1 row created.

SQL> insert into duty_allocation values(202,103,'21-05-2008','morning');

1 row created.

SQL> insert into duty_allocation values(201,105,'26-09-2010','evening');

1 row created.

SQL> insert into duty_allocation values(203,104,'23-05-2008','night');

1 row created.

SQL> insert into duty_allocation values(207,108,'02-04-2014','night');

1 row created.

SQL> insert into emp3 values('John',105,'type6',90);

1 row created.


**************************************************************************************
1) get complete details of duty_allocation

SQL> select * from duty_allocation;

POSTING_NO     EMP_NO DAY      SHIFT
---------- ---------- -------- ----------
       201	  101 23-05-08 night
       202	  103 21-05-08 morning
       201	  105 26-09-10 evening
       203	  104 23-05-08 night
       207	  108 02-04-14 night
       209	  101 01-04-14 morning

**************************************************************************************

2)find shift details for emp John 

SQL> select * from duty_allocation where emp_no=(select no from emp3 where name='John');

POSTING_NO     EMP_NO DAY      SHIFT
---------- ---------- -------- ----------
       201	  105 26-09-10 evening

****************************************************************************************





