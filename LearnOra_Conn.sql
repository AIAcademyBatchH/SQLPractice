Create table Employee (Eid INTEGER, ename VARCHAR2(30)) ;-- DDL command - Data defination language 
Alter table Employee Add (DOB date); -- DDL
Alter table Employee add (test1 VARCHAR(20));-- DDL
Alter table employee drop column test1; --DDl 
Alter table employee rename column test1 to dept;-- DDL 


Insert into employee values (1, 'ABC',sysdate, 'dept_1'); -- DML
Commit; -- TCL 

Insert into employee values (2, 'DEF',sysdate-1, 'dept_2'); -- DML


Select employee.eid --, ename, dob, employee.dept 
from employee;
group by employee.eid; --, ename, dob , employee.dept;

Rollback;

Select * from employee;



Delete employee;

Rollback;

Truncate table employee;

Delete  employee
where eid = 2;

commit;



Insert into employee(eid, dob,ename, dept) values (3,sysdate, 'ABC', 'dept_1'); -- DML
Commit; -- TCL

Insert into employee(eid, ename,dob, dept) values (4,'XYZ',sysdate, 'dept_4'); -- DML
Commit; -- TCL

Select * from employee;

update employee
Set dept = 'Dept_3'
where eid = 3;


Insert into employee(eid, dob,ename) values (3,sysdate, 'ABC'); -- DML
Commit; -- TCL

Select Eid as emp_id, ename||' '|| dept as DePartment --department
from employee
where to_date(dob, 'MM-DD-YYYY') < to_date('01-13-2023','MM-DD-YYYY'); -- MM- DD -YYYY

--dept is not null
;


Select * from dual;

Select sysdate from dual;

Select sysdate +1  as multi from dual;




Create table Test1 ( T1 Varchar(30), T2 Varchar(30)) ;
Create table Test2 ( T1 Varchar(30), T2 Varchar(30)) ;-- DDL command - Data defination language 

-- Set Operator...

Union -- Retruns all the records from both data sets , filters duplicate
Union All --Retruns all the records from both data sets
Intersect -- Retruns common records 
Minus -- return records present in data set 1 but not in 2

Select T1,T2 from test2
minus 
Select T1,T2 from test1;

Select 


