/*
--

Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
Write a PL/SQL block of code using parameterized Cursor, that will merge the data available
in the newly created table N_RollCall with the data available in the table O_RollCall. If the
data in the first table already exist in the second table then that data should be skipped.
-	
		EXPLICIT CURSOR

--*******************************************************************************/


declare 
    rno1 O_Rollcalltb.rno%type;
    name1 O_Rollcalltb.name%type;
    age1 O_Rollcalltb.age%type;
    marks1 O_Rollcalltb.marks%type;
    
    Cursor expli_cur is
        select rno,name,age,marks from O_Rollcalltb;
        
begin
   
    open expli_cur;
    loop
    fetch expli_cur into rno1,name1,age1,marks1;
    
    exit when expli_cur%notfound ;
    
    insert into N_Rollcalltb values(rno1,name1,age1,marks1);
    
    end loop;
    dbms_output.put_line('inserted record');
    close expli_cur;
    
end;
/ 


--*************************************************************

--SQL> select * from O_Rollcalltb ;

--       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
--	 1 Neha 	      20	 99
--	 2 Yash 	      16	 90
--	 3 amit	      23	 76
--	 4 Sneha	      12	 58
--	 5 Vedant	      25	 84

--SQL> select * from N_Rollcalltb;

--no rows selected

--SQL> @expcur.sql;

--PL/SQL procedure successfully completed.

--SQL> select * from N_Rollcalltb;

--       RNO NAME 	     AGE      MARKS
---------- ---------- ---------- ----------
--	 1 Neha 	      20	 99
--	 2 Yash 	      16	 90
--	 3 amit	      23	 76
--	 4 Sneha	      12	 58
--	 5 Vedant	      25	 84
 

