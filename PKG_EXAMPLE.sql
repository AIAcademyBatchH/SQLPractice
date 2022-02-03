CREATE TABLE "LEARNORA"."EMPLOYEE" 
   (	"EID" NUMBER(*,0), 
	"ENAME" VARCHAR2(30 BYTE), 
	"DOB" DATE, 
	"DEPT" VARCHAR2(20 BYTE), 
	"SALARY" NUMBER(30,0)
   )
-- Package has Two Parts - Spec and Body 
-- PKG Spec is Must ... without it you cannot have body 
create or replace PACKAGE EMP_get_set
IS
PROCEDURE set_record (p_emp_rec IN Employee%ROWTYPE);
FUNCTION get_record (p_emp_no IN NUMBER) RETURN Employee%ROWTYPE;
END EMP_get_set;

create or replace PACKAGE BODY EMP_get_set
IS	
PROCEDURE set_record(p_emp_rec IN Employee%ROWTYPE)
IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
INSERT INTO Employee (EID, ENAME,Salary )
VALUES(p_emp_rec.eid,p_emp_rec.ename,p_emp_rec.salary);
COMMIT;
END set_record;

FUNCTION get_record(p_emp_no IN NUMBER)
RETURN Employee%ROWTYPE
IS
l_emp_rec Employee%ROWTYPE;
BEGIN
SELECT * INTO l_emp_rec FROM Employee where EID=p_emp_no;
RETURN l_emp_rec;
END get_record;
--BEGUN	
--dbms_output.put_line('Control is now executing the package initialization part');
END EMP_get_set;

DEclare
l_emp_rec Employee%ROWTYPE;
l_get_rec Employee%ROWTYPE;
BEGIN
dbms_output.put_line('Insert_new_record_for_employee_1004');
l_emp_rec.eid:= 1007;
l_emp_rec.ename:= 'Alexender';
l_emp_rec.salary:= 50000;
l_emp_rec.DEPT:= 'PLSQL';

EMP_GET_SET.set_record(l_emp_rec);
dbms_output.put_line ('Record inserted');
dbms_output.put_line ('Calling get function to display the inserted record');
l_get_rec:= EMP_get_set.get_record(1007);
dbms_output.put_line('Employee Number:'||l_get_rec.eid);
dbms_output.put_line('Employee Name:'||l_get_rec.ename);
dbms_output.put_line('Employee salary:'||l_get_rec.salary);
dbms_output.put_line('Employee Depart:'||l_get_rec.DEPT);		
END;

--Select * from employee;
