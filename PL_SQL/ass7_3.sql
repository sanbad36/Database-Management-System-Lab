/*
	
PL/SQL Stored Procedure and Stored Function.
Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scored
by students in examination is <=1500 and marks>=990 then student will be placed in
distinction category if marks scored are between 989 and900 category is first class, if marks
899 and 825 category is Higher Second Class
Write a PL/SQL block for using procedure created with above requirement.
Stud_Marks(name, total_marks)
Result(Roll,Name, Class)	


Stored Function

************************************************************************************************/



create or replace function fun1
return INT as b INT:=2;

	 rowx stud%ROWTYPE;
	cursor c1 is SELECT * FROM stud;
	begin
		open c1;
		LOOP
			FETCH c1 INTO rowx;
		 	EXIT WHEN c1%NOTFOUND;
			if (rowx.marks<=1500 and rowx.marks>950) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'Distinction');
			elsif (rowx.marks<=950 and rowx.marks>800) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'first');
			elsif (rowx.marks<=800 and rowx.marks>550) then
				insert into res values(rowx.rno,rowx.name,rowx.marks,'second');
			end if;
		END LOOP;
close c1;
return b;
		
	end fun1;
end;
/


/*********************************OUTPUT**********************************

SQL> select * from stud;

       RNO NAME 	   MARKS
---------- ---------- ----------
	 1 Neha 	    1400
	 2 Akash	     990
	 3 Purva	     970
	 4 Asmita	     700
	 6 Rahul	     850


SQL> set serveroutput on
SQL> exec dbms_output.put_line(fun1);
2

PL/SQL procedure successfully completed.

SQL> select * from res;

       RNO NAME 	   MARKS CLASS
---------- ---------- ---------- --------------------
	 1 Neha 	    1400 Distinction
	 2 Akash	     990 Distinction
	 3 Purva	     970 Distinction
	 4 Asmita	     700 second
	 6 Rahul	     850 first

*/

