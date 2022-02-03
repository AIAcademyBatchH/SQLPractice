Create User appuser identified by appuser;
Grant connect to appuser; --- DCL
Grant select on hr.emp_view to appuser;-- DCL - Data control language 
Grant select on  hr.EMP_DET to appuser;

Grant select on  hr.emp_view to appuser;

grant debug connect session to HR;
grant debug any procedure to HR;
grant execute on DBMS_DEBUG_JDWP to HR;

grant execute on DBMS_DEBUG_JDWP to hr;


Grant Execute on  hr.PRINT_SALARY to appuser;
Grant Execute on hr.Display_sal to appuser;
