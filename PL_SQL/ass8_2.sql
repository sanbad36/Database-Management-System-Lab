/*
	

Database Trigger (All Types: Row level and Statement level triggers, Before and After
Triggers). Write a database trigger on Library table. The System should keep track of the
records that are being updated or deleted. The old value of updated or deleted records should
be added in Library_Audit table.

	TRIGGER-STATEMENT LEVEL
****************************************************************************************/


CREATE OR REPLACE TRIGGER My_trigger 

	BEFORE UPDATE OR INSERT OR DELETE ON Library  

	
DECLARE

	CURSOR my_cur IS 
		SELECT * from Library;

BEGIN 

	for row_no in my_cur
		LOOP
			INSERT INTO Library_Audit values(row_no.Book_id,row_no.Book_name,row_no.Status);

		end loop;


	exception
	when no_data_found then
			dbms_output.put_line('Not found');


 	

END;
/



/*

SQL> conn n1
Enter password: 
Connected.

SQL> select * from Library;

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       101 Let_us_c	   R
       102 C_Puzzle_Book   I
       103 C++		   I
       104 OOP		   I
       105 TOC		   R
       106 DBMS 	   I
       107 CN		   I
       108 SEPM 	   I
       109 DELD 	   I
       110 DSA		   I
       111 SDL		   I

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       112 ISEE 	   I
       113 JAVA 	   I
       114 PYTHON	   I
       115 ASM		   I

15 rows selected.


SQL> @my_trigger1.sql

Trigger created.

SQL> update Library  
  2  set Status='R'
  3  where Book_id='115';

1 row updated.

SQL> select * from Library;

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       101 Let_us_c	   R
       102 C_Puzzle_Book   I
       103 C++		   I
       104 OOP		   I
       105 TOC		   R
       106 DBMS 	   I
       107 Software	   I
       108 SEPM 	   I
       109 DELD 	   I
       110 DSA		   I
       111 SDL		   I

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       112 ISEE 	   I
       113 JAVA 	   I
       114 PYTHON	   I
       115 ASM		   R

15 rows selected.

SQL> select * from Library_Audit;

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       101 Let_us_c	   R
       102 C_Puzzle_Book   I
       103 C++		   I
       104 OOP		   I
       105 TOC		   R
       106 DBMS 	   I
       107 Software	   I
       108 SEPM 	   I
       109 DELD 	   I
       110 DSA		   I
       111 SDL		   I

   BOOK_ID BOOK_NAME	   STATUS
---------- --------------- ------
       112 ISEE 	   I
       113 JAVA 	   I
       114 PYTHON	   I
       115 ASM		   I

15 rows selected.



*/
