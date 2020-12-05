/*

	PL/SQL Stored Procedure and Stored Function.
Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scored
by students in examination is <=1500 and marks>=990 then student will be placed in
distinction category if marks scored are between 989 and900 category is first class, if marks
899 and 825 category is Higher Second Class
Write a PL/SQL block for using procedure created with above requirement.
Stud_Marks(name, total_marks)
Result(Roll,Name, Class)	

-->Stored Procedure without parameters
*****************************************************************************************
*/



create or replace procedure stored_proc
	as
	cursor c1 is SELECT * FROM stud;
	rowx stud%ROWTYPE;
begin
		open c1;
		LOOP
			FETCH c1 INTO rowx;
		 	EXIT WHEN c1%NOTFOUND;
			if (rowx.marks<=1500 and rowx.marks>=990) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'Distinction');
			elsif (rowx.marks<=989 and rowx.marks>=900) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'first');
			elsif (rowx.marks<=899 and rowx.marks>=825) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'second');
			end if;
		END LOOP;
		close c1;
	
end;
/


/*******************************************************************

SQL> select * from stud;

       RNO NAME 	   MARKS
---------- ---------- ----------
	 1 Neha 	    1400
	 2 Akash	     990
	 3 Purva	     970
	 4 amit	     700
	 6 Rahul	     850

SQL> @procfinal.sql;

Procedure created.

SQL> EXEC stored_proc;

PL/SQL procedure successfully completed.

SQL> select * from res;

       RNO NAME 	   MARKS CLASS
---------- ---------- ---------- --------------------
	 1 Neha 	    1400 Distinction
	 2 Akash	     990 Distinction
	 3 Purva	     970 first
	 4 amit	     700 second
	 6 Rahul	     850 second




*/
