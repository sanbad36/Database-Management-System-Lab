/*
	

PL/SQL Stored Procedure and Stored Function.
Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scored
by students in examination is <=1500 and marks>=990 then student will be placed in
distinction category if marks scored are between 989 and900 category is first class, if marks
899 and 825 category is Higher Second Class
Write a PL/SQL block for using procedure created with above requirement.
Stud_Marks(name, total_marks)
Result(Roll,Name, Class)	

-->Stored Procedure with parameters
*******************************************************************
*/


create or replace procedure proc(trno in int ,tname in stud.name%type ,tmarks in int)
as

begin
if (tmarks<=1500 and tmarks>950) then
	insert into res values(trno,tname,tmarks,'Disitinction');
elsif (tmarks<=950 and tmarks>800) then
	insert into res values(trno,tname,tmarks,'first');
elsif (tmarks<=800 and tmarks>550) then
	insert into res values(trno,tname,tmarks,'higher');
end if;
	
end;
/


/********************************************************

SQL> @procpara.sql;

Procedure created.

SQL> EXEC proc(11,'Raj',830);

PL/SQL procedure successfully completed.


SQL> select * from res;

       RNO NAME 	   MARKS CLASS
---------- ---------- ---------- --------------------
	 1 Neha 	    1400 Distinction
	 2 Akash	     990 Distinction
	 3 Purva	     970 Distinction
	 4 amit	     700 second
	 6 Rahul	     850 first
	11 Raj		     830 first

6 rows selected.

SQL> 


*/
