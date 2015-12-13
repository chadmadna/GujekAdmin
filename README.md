# GujekAdmin
A database administrator app for the Gu-Jek fictional company. Made for DB-1 Fasilkom UI group assignment.
### Report
(contains how it works, list of SQL statements, steps of using app, job desc)


#### Before you run the program:
1. Make sure you use PostgreSQL 9.4.
2. Create a postgresql with user='gujekadmin' and password='admin1'. 
  * Open psql and type in: ```CREATE USER gujekadmin WITH SUPERUSER password 'admin1';```.


#### SQL Statements
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
|10.  | INNER JOIN     |
|11.  |
#### How It Works
	The program is divided into 3 section:
	1. The GuJek database that contains information about the company (employee, department, etc)
	2. The Graphic User Interface (GUI) that the user can run and operates on
	3. And the python program that connects the GUI with the database.

	Program features:
	1. Viewing a table in the database: 
		The program will show 'employee' table as its default. When a user selects a different table from the drop down menu, it will access the new table and shows it on the window. It uses the show_table in the python program which uses the SELECT * SQL statement.
	2. Adding a record/entry to a table:
		The user will be prompted to fill the information needed for the table using the _setup_form method from the App class. The input will be put as a tuple and the program will use the insert method from the GujekAdmin class. This method will then prompt the INSERT INTO SQL statement.
	3. Editing a record/entry:

	4. Deleting a record/entry:
	5. Ordering a table by the chosen column:
	6. Searching a record/entry from a column in the table:

#### How To Use the Application



#### Job Descriptions
1. Farras Apsari P : Documentation, misc. Data
2. Irsyad Nabil : Programmer
3. Ricky Arkan S : Programmer
4. Andi Rahmat Ramadhan H : Programmer
