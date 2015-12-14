# GujekAdmin
A database administrator app for the Gu-Jek fictional company. Made for DB-1 Fasilkom UI group assignment.
### Report
(contains how it works, list of SQL statements, steps of using app, job desc)


#### Before you run the program:
1. Make sure you use PostgreSQL 9.4.
2. Create a postgresql with user='gujekadmin' and password='admin1'. 
  * Open psql and type in: ```CREATE USER gujekadmin WITH SUPERUSER password 'admin1';```.


#### How It Works
	The program is divided into 3 section:
	1. The GuJek database that contains information about the company (employee, department, etc)
	2. The Graphic User Interface (GUI) that the user can run and operates on
	3. And the python program that connects the GUI with the database.

	SQL Statements used in the program
	
	| No. | SQL Statements | Syntax                                                                                      |
	|-----|----------------|---------------------------------------------------------------------------------------------|
	|1.   | INSERT INTO    | INSERT INTO table_name (column1, column2, column3,...) VALUES (value1, value2, value3,....) |
	|2.   | SELECT         | SELECT column_name(s) FROM table_name                                                       |
	|3.   | SELECT *       | SELECT * FROM table_name                                                                    |
	|4.   | DELETE FROM    | DELETE FROM table_name WHERE some_column=some_value									  	 |
	|5.   | UPDATE         | UPDATE table_name SET column1=value, column2=value,... WHERE some_column=some_value         |
	|6.   | AND/OR         | SELECT column_name(s) FROM table_name WHERE condition AND/OR condition                      |
	|7.   | ORDER BY       | SELECT column_name(s) FROM table_name ORDER BY column_name [ASC|DESC]                       |
	|8.   | WHERE          | SELECT column_name(s) FROM table_name WHERE column_name operator value                      |
	|9.   | LIKE           | SELECT column_name(s) WHERE column_name LIKE pattern                                        |
	|10.  | INNER JOIN     |SELECT column_name(s) FROM table_name1 INNER JOIN table_name2 ON table_name1.column_name=table_name2.column_name |


	Program features:
Program features:
	1. Viewing a table in the database: 
		The program will show 'employee' table as its default. When a user selects a different table from the drop down menu, it will access the new table and shows it on the window. It uses the show_table in the python program which uses the SELECT * SQL statement.
	2. Adding a record/entry to a table:
		The user will be prompted to fill the information needed for the table using the _setup_form method from the App class. The input will be put as a tuple and the program will use the insert method from the GujekAdmin class. This method will then prompt the INSERT INTO SQL statement.
	3. Editing a record/entry:
	This method will edit a chosen data from the database, with tablename (str) for The table name, searchby (str) for The column name, value (str) for The data to be edited and data (str) for The new data for value.

	4. Deleting a record/entry:
	This method will delete data from the database with tablename (str) for The table name, data (dict) for The data that specifies deletion condition.
	5. Ordering a table by the chosen column:(??)
	6. Searching a record/entry from a column in the table:
	This method will search the database for the given value and return its value with tablename (str) for The table name, searchby (str) for The column name and value (str) for The search key.
	
#### How To Use the Application



#### Job Descriptions
1. Farras Apsari P : Documentation, misc. Data
2. Irsyad Nabil : Programmer
3. Ricky Arkan S : Programmer
4. Andi Rahmat Ramadhan H : Programmer
