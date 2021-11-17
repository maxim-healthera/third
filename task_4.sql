select 
        subquery.dep_id,
        d2.DEPARTMENT_NAME as dep_name,
        e2.first_name || ' ' || e2.last_name AS oldest_emp_name,
        to_date('2021-11-17', 'yyyy-MM-dd')-subquery.oldest as oldest,
        to_date('2021-11-17', 'yyyy-MM-dd')-subquery.youngest as youngest
from (
    SELECT
            d.department_id as dep_id,
            min(hire_date) as oldest,
            max(hire_date) as youngest
        FROM employees e
                JOIN departments d 
                on e.department_id=d.department_id
    GROUP BY d.department_id
) subquery
right join EMPLOYEES e2
on e2.DEPARTMENT_ID=subquery.dep_id

left join departments d2
on d2.DEPARTMENT_ID=subquery.dep_id

where e2.HIRE_DATE=subquery.oldest;
