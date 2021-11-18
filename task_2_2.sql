select 
    sub.DEPARTMENT_NAME,
    sub.EMP_NAME,
    sub.MAX_SALARY
from (
    SELECT 
        d.DEPARTMENT_NAME AS DEPARTMENT_NAME,
        first_name || ' ' || last_name AS EMP_NAME,
        SALARY AS MAX_SALARY, 
        row_number() OVER (PARTITION BY d.department_id ORDER BY salary DESC)  AS rating_in_dep
    FROM EMPLOYEES e
    LEFT JOIN DEPARTMENTS d 
    on d.DEPARTMENT_ID=e.DEPARTMENT_ID
) sub

where sub.rating_in_dep=1
order by sub.max_salary desc;