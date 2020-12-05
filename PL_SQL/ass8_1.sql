/*



Database Trigger (All Types: Row level and Statement level triggers, Before and After
Triggers). Write a database trigger on Library table. The System should keep track of the
records that are being updated or deleted. The old value of updated or deleted records should
be added in Library_Audit table.
	
Database Trigger(Row Level Trigger-Before trigger) 

****************************************************************************/


create or replace trigger trig2
before delete on Library
for each row
declare
	id1 Library.id%type;
	name1 Library.name%type;
	status1 Library.status%type;

	Cursor c is select id,name,status into Library;
	
begin

	open c;
	fetch c into id1,name1,status1;
	
	insert into Library_Audit values(:old.id1,:old.name1,:old.status1);

	close c;
end;
/


/*****************************************************************

SQL> select * from Library;

	ID NAME       S
---------- ---------- -
	 1 DBMS       I
	 2 TOC	      R
	 3 CN	      R
	 4 SEPM       R
	 5 ISEE       I

SQL> select * from Library_Audit;

	ID NAME       S
---------- ---------- -
	 2 TOC	      I

SQL> @trig2.sql;

Trigger created.

SQL> delete from Library
  2  where id=5;

1 row deleted.

SQL> select * from Library;

	ID NAME       S
---------- ---------- -
	 1 DBMS       I
	 2 TOC	      R
	 3 CN	      R
	 4 SEPM       R

SQL> select * from Library_Audit;

	ID NAME       S
---------- ---------- -
	 2 TOC	      I
	 5 ISEE       I

SQL> 
*/
