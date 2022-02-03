CREATE OR REPLACE PROCEDURE PRINT_SALARY 
(
  P_NAME IN VARCHAR2 
, P_OUT OUT VARCHAR2 
) AS 
V_sal Varchar2(100);
V_dept Varchar2(100);
BEGIN

WELCOME_MSG(P_NAME);

Select Salary, department_id
Into V_sal, V_dept
From Employees 
Where first_name = P_NAME;

--dbms_output.put_line ('Your Salary is  '|| V_sal);
P_OUT := V_sal;

Exception when  No_data_found then 

dbms_output.put_line ('Employee '|| P_NAME||' is not present in system so cannot return his/her salary');
P_OUT := 'Unknown';

END PRINT_SALARY;