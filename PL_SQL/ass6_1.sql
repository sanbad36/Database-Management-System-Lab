/*
	

Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
Write a PL/SQL block of code using parameterized Cursor, that will merge the data available
in the newly created table N_RollCall with the data available in the table O_RollCall. If the
data in the first table already exist in the second table then that data should be skipped.

---IMPLICIT CURSOR

*************************************************************************/

declare
    rno1 O_Rollcalltb.rno%type;
    name1 O_Rollcalltb.name%type;
    age1 O_Rollcalltb.age%type;
    marks1 O_Rollcalltb.marks%type;
    
begin
    
    select rno,name,age,marks 
    into rno1,name1,age1,marks1 
    from O_Rollcalltb where rno=2;
    
   
    insert into N_Rollcalltb values(rno1,name1,age1,marks1);
   
    dbms_output.put_line('completed');
        
end;
/


--SQL> select * from O_Rollcalltb;

--       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
--	 1 Neha 	      20	 99
--	 2 Yash 	      16	 90
--	 3 Aditi	      18	 76
--	 4 Sneha	      22	 87
--	 5 Vidit	      12	 55
--	 6 Amit	      19	 84

--SQL> select * from N_Rollcalltb;

--       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
--	 2 Yash 	      16	 90

