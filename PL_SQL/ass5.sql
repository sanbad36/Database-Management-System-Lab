/*
	

Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory.
Write a PL/SQL block of code for the following requirements:-
Schema:
1. Borrower(Rollin, Name, DateofIssue, NameofBook, Status)
2. Fine(Roll_no,Date,Amt)
 Accept roll_no & name of book from user.
 Check the number of days (from date of issue), if days are between 15 to 30 then fine
amount will be Rs 5per day.
 If no. of days>30, per day fine will be Rs 50 per day & for days less than 30, Rs. 5 per
day.
 After submitting the book, status will change from I to R.
 If condition of fine is true, then details will be stored into fine table.
Frame the problem statement for writing PL/SQL block inline with above statement. 

****************************************************************************************************/


declare

	rno number(5):=&rn;
	book_name varchar(10):='&bn';
	issue_date date;
	state char;
	fine_amt number;
	no_of_days number(12);

begin	

	select date_of_issue into issue_date from borrower where roll_no=rno;
	no_of_days:=sysdate-issue_date;
	if(no_of_days>=15 and no_of_days<=30)
		then fine_amt:=(5*no_of_days);
	elsif(no_of_days>30)
		then fine_amt:=(50*no_of_days);
	else
		dbms_output.put_line('No fine..');
		end if;

		update borrower set state='R'where roll_no=rno;
		insert into fine values(rno,sysdate,fine_amt);
		
	end;
/

/**********************************************************************************

SQL> select * from borrower;

   ROLL_NO NAME       DATE_OF_ BOOK_NAME  STATE
---------- ---------- -------- ---------- -----
	 1 Neha       15-09-17 TOC	  I
	 2 Sarthak    01-10-17 DBMS	  I
	 3 Piyush     10-09-17 CN	  I
	 4 Nisha      01-02-17 ISEE	  R
	 5 Yash       02-10-17 SEPM	  I

SQL> select * from fine;

no rows selected

SQL> @ass5(A).sql;
Enter value for rn: 1
old   3: 	rno number(5):=&rn;
new   3: 	rno number(5):=1;
Enter value for bn: TOC
old   4: 	book_name varchar(10):='&bn';
new   4: 	book_name varchar(10):='TOC';

PL/SQL procedure successfully completed.

SQL> select * from fine;

   ROLL_NO S_DATE     FINE_AMT
---------- -------- ----------
	 1 11-10-17	   135

SQL> @ass5(A).sql;
Enter value for rn: 3
old   3: 	rno number(5):=&rn;
new   3: 	rno number(5):=3;
Enter value for bn: CN
old   4: 	book_name varchar(10):='&bn';
new   4: 	book_name varchar(10):='CN';

PL/SQL procedure successfully completed.

SQL> select * from fine;

   ROLL_NO S_DATE     FINE_AMT
---------- -------- ----------
	 1 11-10-17	   135
	 3 11-10-17	  1600

*/
