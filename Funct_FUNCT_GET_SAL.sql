CREATE OR REPLACE FUNCTION FUNCT_GET_SAL 
(
  P_EID IN VARCHAR2 
) RETURN VARCHAR2 AS 
v_name  employees.first_name%TYPE ;
V_sal   Employees.salary%type;
BEGIN

Select first_name , (salary+(nvl(commission_pct,0)*salary)) total 
Into v_name, V_sal
from employees
Where employee_id = P_EID ;

  RETURN V_sal;
END FUNCT_GET_SAL;