Select Count(*) from Employees;

SELECT LAST_NAME, FIRST_NAME, PHONE_NUMBER 
FROM EMPLOYEES
ORDER BY LAST_NAME desc;

SELECT FIRST_NAME Fname ,  LAST_NAME "Family Name" , PHONE_NUMBER "Contact Number"
FROM EMPLOYEES;

Select * from employees
where department_id = 120;

desc departments;

Select first_name ,dept.department_id, department_name
from employees emp , departments dept
where emp.department_id = dept.department_id
and dept.DEPARTMENT_NAME = 'Sales';


--Self join -- when you join the same table. 

Select e.first_name Employee, (Case m.first_name
                              when  null then 'He is CEO'
                              Else m.first_name End ) as manager
from employees e , employees m 
where e.manager_id = m.employee_id(+);

Select First_name , Salary
From employees
GROUP by First_name , Salary



select e.employee_ID, e.first_name, e.last_name, e.manager_ID, m.first_name as manager_First_name 
from employees e, employees m where e.manager_ID=m.employee_ID;

select nvl(commission_pct,0) ,(e.salary+nvl(commission_pct,0)) as total_Sal, from employees e;


Select first_name , salary ,nvl(commission_pct,0) comm_pct , (salary+(nvl(commission_pct,0)*salary)) total from employees;

Select concat('Fist', ' last') , 'First'||' '||'Last' from dual;
Select length ('shajshaj') from dual;
Select SuBSTR ('HelloWorld', 2,5) from dual;

Select round (1234.456, 2) from dual;


Select add_months (Sysdate , 2) from dual;

Select to_char(sysdate, 'dd-mm-yyyy hh:mm') from dual;

select first_name, (salary + commission_pct) as Total_Salary 
from employees where commission_pct is not null;



-- Inner Join
Select first_name ,dept.department_id, department_name
from employees emp , departments dept
where emp.department_id = dept.department_id
and dept.DEPARTMENT_NAME = 'Sales';

Select first_name ,dept.department_id, department_name
from employees emp inner join  departments dept
on emp.department_id = dept.department_id
where  dept.DEPARTMENT_NAME = 'Sales';

Select first_name ,dept.department_id, department_name, emp.job_id
from employees emp inner join  departments dept
on emp.department_id = dept.department_id
where  dept.DEPARTMENT_NAME = 'Sales';

Select Upper(first_name) ,dept.department_id, department_name,emp.job_id, jobs.job_title
from employees emp , departments dept, jobs
where emp.department_id = dept.department_id
and emp.job_id = jobs.job_id
and dept.DEPARTMENT_NAME like 'M%';


Select * from employees
where first_name like '%ev%';

Select upper('King'), lower('KING'), INITCAP('the soap')
from Dual;

select * from departments;

-- 178	Kimberely	Grant	KGRANT	011.44.1644.429263	24-05-07	SA_REP	7000	0.15	149	
-- Left Outer Join
Select employee_id , first_name , d.department_name,d.department_id
from employees e, departments d
where e.department_id = d.department_id (+)
order by d.department_id desc;

-- Right Outer
Select employee_id , first_name , d.department_name, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id 
order by d.department_id;

--Fulll Outer Join
Select employee_id , first_name , d.department_name, d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id ;


-- Left Outer Join
Select employee_id , first_name , d.department_name,d.department_id
from employees e, departments d
where e.department_id = d.department_id (+)
Union All
-- Right Outer
Select employee_id , first_name , d.department_name, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id 
;

Select First_name, Salary , 
department_id, Max(salary) Max_sal--,Min(salary), AVG(salary)
from employees
Group by department_id,First_name, Salary;


Select first_name , Salary, Department_id, Rank() over( partition by department_id order by salary desc nulls last) 
From employees;

-- Window Functions

SELECT EMPLOYEE_ID, First_name ,department_id, Salary,
RANK() OVER (PARTITION BY department_id
ORDER BY Salary DESC NULLS LAST) RANK,
DENSE_RANK() OVER (PARTITION BY
department_id ORDER BY salary DESC NULLS
LAST) DENSE_RANK
FROM Employees
WHERE department_id IN (30, 50)
ORDER BY department_id, RANK;


Select Dpartment_id , Count(*)
From 

;
-- Having -- Group Filter
Select department_id , count(*) as "Total Emp" 
from employees 
group by department_id;
Having count(*) > 20;

select count(a.EMPLOYEE_ID),b.DEPARTMENT_name from EMPLOYEES a,DEPARTMENTS b
where a.DEPARTMENT_ID=b.DEPARTMENT_ID
group by b.DEPARTMENT_name









