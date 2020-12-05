/*
	
Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
Write a PL/SQL block of code using parameterized Cursor, that will merge the data available
in the newly created table N_RollCall with the data available in the table O_RollCall. If the
data in the first table already exist in the second table then that data should be skipped.

	Cursor FOR_LOOP


**************************************************************************/


declare 
	
	
	n_rno N_RollCalltb.rno%type;
	row_no O_RollCalltb%ROWTYPE;

	rno1 O_Rollcalltb.rno%type;
	name1 O_Rollcalltb.name%type;
	age1 O_Rollcalltb.age%type;
	marks1 O_Rollcalltb.marks%type;
    
    
cursor c1 is
select rno,name,age,marks from O_RollCalltb where rno not in (select rno from N_RollCalltb);

begin

	for row_no in c1
	loop
	
		exit when c1%notfound;
		
		insert into N_RollCalltb values(row_no.rno,row_no.name,row_no.age,row_no.marks);
	
	end loop;

	exception
	when no_data_found then
	dbms_output.put_line('NO book found');


end;
/

/*
SQL> select * from N_Rollcalltb;

no rows selected

SQL> @ass6_3(A).sql;

PL/SQL procedure successfully completed.

SQL> select * from O_Rollcalltb;

       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
	 1 Neha 	      20	 99
	 2 Yash 	      16	 90
	 3 amit	      23	 76
	 4 Sneha	      12	 58
	 5 Vedant	      25	 84

SQL> select * from N_Rollcalltb;

       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
	 5 Vedant	      25	 84
	 4 Sneha	      12	 58
	 3 amit	      23	 76
	 1 Neha 	      20	 99
	 2 Yash 	      16	 90

SQL> 
*/
