-- SQL Plus Formatting
COLUMN OBJECT_NAME FORMAT A25
COLUMN OBJECT_TYPE FORMAT A25
-- Select all objects 
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS
ORDER BY OBJECT_TYPE, OBJECT_NAME;

-- Describe Emplpoyee table
DESCRIBE EMPLOYEES
-- Format for better readability
COLUMN FIRST_NAME FORMAT A20
COLUMN LAST_NAME FORMAT A25
COLUMN PHONE_NUMBER FORMAT A20

SELECT LAST_NAME, FIRST_NAME, PHONE_NUMBER FROM EMPLOYEES
ORDER BY LAST_NAME;


--Displaying Selected Columns Under New Headings

SELECT FIRST_NAME First, LAST_NAME last, DEPARTMENT_ID DepT
FROM EMPLOYEES;

--Install and Connect Using SQL Developer



--Example :Preserving Case and Including Spaces in Column Aliases
SELECT FIRST_NAME "Given Name", LAST_NAME "Family Name"
FROM EMPLOYEES;


--Example 2-7 Selecting Data from One Department

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

--Example 2-8 Selecting Data for Last Names that Start with the Same Substring

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'Ma%';

--Example 2-9 Selecting Data that Satisfies Two Conditions

SELECT FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT "%"
FROM EMPLOYEES
WHERE (SALARY >= 11000) AND (COMMISSION_PCT IS NOT NULL);


--Example 2-10 Sorting Selected Data by LAST_NAME

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY LAST_NAME;


--Example Sorting Selected Data by an Unselected Column

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY LAST_NAME;

--Example 2-12 Selecting Data from Two Tables (Joining Two Tables)

SELECT EMPLOYEES.FIRST_NAME "First",
EMPLOYEES.LAST_NAME "Last",
DEPARTMENTS.DEPARTMENT_NAME "Dept. Name"
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
ORDER BY DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.LAST_NAME;
 
 
--Table-name qualifiers are optional for column names that appear in only one table of a join, but are required for column names that appear in both tables. The following query is equivalent to the query in Example 2-12:

SELECT FIRST_NAME "First",
LAST_NAME "Last",
DEPARTMENT_NAME "Dept. Name"
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
ORDER BY DEPARTMENT_NAME, LAST_NAME;

--To make queries that use qualified column names more readable, use table aliases, as in the following example:

SELECT FIRST_NAME "First",
LAST_NAME "Last",
DEPARTMENT_NAME "Dept. Name"
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY d.DEPARTMENT_NAME, e.LAST_NAME;
Although you create the aliases in the FROM clause, you can use them earlier in the query, as in the following example:

SELECT e.FIRST_NAME "First",
e.LAST_NAME "Last",
d.DEPARTMENT_NAME "Dept. Name"
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY d.DEPARTMENT_NAME, e.LAST_NAME;


--Example: Using an Arithmetic Expression in a Query

SELECT LAST_NAME,
SALARY "Monthly Pay",
SALARY * 12 "Annual Pay"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
ORDER BY SALARY DESC;

--Example: Concatenating Character Data

SELECT FIRST_NAME || ' ' || LAST_NAME "Name"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100
ORDER BY LAST_NAME;


--Example: Changing the Case of Character Data

SELECT UPPER(LAST_NAME) "Last",
INITCAP(FIRST_NAME) "First",
LOWER(EMAIL) "E-Mail"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100
ORDER BY EMAIL;