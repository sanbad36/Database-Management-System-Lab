/*
	

Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
Write a PL/SQL block of code using parameterized Cursor, that will merge the data available
in the newly created table N_RollCall with the data available in the table O_RollCall. If the
data in the first table already exist in the second table then that data should be skipped.
Cursor -PARAMETERIZED CURSOR

************************************************************************************/


declare
cursor c1(r int) is
select rno,name,age,marks from O_RollCalltb where rno=r and rno not in (select rno from N_RollCalltb);

begin

	for row_no in c1(&r)
	loop
	
		exit when c1%notfound;
		
		insert into N_RollCalltb values(row_no.rno,row_no.name,row_no.age,row_no.marks);
	
	end loop;

	exception
	when no_data_found then
	dbms_output.put_line('NO book found');


end;
/

/**********************OUTPUT***************************************

QL> @ass6_4(A).sql;
Enter value for r: 2
old   7: 	for row_no in c1(&r)
new   7: 	for row_no in c1(2)

PL/SQL procedure successfully completed.

SQL> select * from N_Rollcalltb;

       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
	 2 Yash 	      16	 90



