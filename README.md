# GujekAdmin
A database administrator app for the Gu-Jek fictional company. Made for DB-1 Fasilkom UI group assignment.
# report
(contains how it works, list of SQL statements, steps of using app, job desc)

#### SQL Statements
| No. | SQL Statements | Syntax |
|-----|----------------|--------|
|1. | INSERT INTO |INSERT INTO table_name (column1, column2, column3,...) VALUES (value1, value2, value3,....) |
|2. |SELECT | SELECT column_name(s) FROM table_name|
|3.| SELECT * |SELECT * FROM table_name|
|4.| DELETE FROM | DELETE FROM table_name WHERE some_column=some_value
|5.| UPDATE | UPDATE table_name SET column1=value, column2=value,... WHERE some_column=some_value
|6.| AND/OR| SELECT column_name(s) FROM table_name WHERE condition AND/OR condition
7.| ORDER BY| SELECT column_name(s) FROM table_name ORDER BY column_name [ASC|DESC]
8.|WHERE|  SELECT column_name(s) FROM table_name WHERE column_name operator value
9. | LIKE |SELECT column_name(s) WHERE column_name LIKE pattern
10.| JOIN?? Left/right/Full?|
11. |
#### How It Works
	
#### How To Use the Application
Before you run the program:
1. Make sure you use PostgreSQL 9.4
2. Create a postgresql with user = 'gujekadmin' and password = 'admin1'
3. open psql and type in CREATE USER gujekadmin with superuser password 'admin1';

#### Job Descriptions
1. Farras Apsari P : Documentation, misc. Data
2. Irsyad Nabil : Programmer
3. Ricky Arkan S : Programmer
4. Andi Rahmat Ramadhan H : Programmer
