Set serverout on 

Declare 
V_salary varchar2(100);
Begin
PRINT_SALARY('King',V_salary );
dbms_output.put_line ('Your Salary is  '|| V_salary);
End;

Select Text from User_source
where Name = 'PRINT_SALARY';

Select * 
from user_dependencies
where referenced_name = 'EMPLOYEES' ;



Select FUNCT_GET_SAL(150) From dual;

Select first_name, Salary , FUNCT_GET_SAL(EMPLOYEE_ID) as "Total Sal"
FROM employees 

Declare 
V_salary varchar2(100);
Begin
PRINT_SALARY('King',V_salary );
dbms_output.put_line ('Your Salary is  '|| V_salary);
End;


