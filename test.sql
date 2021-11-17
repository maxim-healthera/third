select
    d2.DEPARTMENT_NAME as dep_name,
    e.first_name || ' ' || e.last_name AS oldest_emp_name,
    e.hire_date as oldest
from employees e

join departments d2
on e.DEPARTMENT_ID=d2.DEPARTMENT_ID
where (e.department_id,e.hire_date) in (SELECT
        d.department_id as dep_id,
        max(hire_date) as youngest,
        min(hire_date) as oldest
    FROM employees e
            JOIN departments d 
            on e.department_id=d.department_id
    GROUP BY d.department_id
);



-- select 
--     d.DEPARTMENT_ID as dep_id,
--     E.first_name || ' ' || E.last_name AS manager_name,
--     d.DEPARTMENT_NAME as dep_name
-- from departments d
-- left join employees e 
-- on d.manager_id=e.EMPLOYEE_ID;