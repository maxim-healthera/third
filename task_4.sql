select 
    dep_id,
    department_name,
    to_date('2021-11-17', 'yyyy-MM-dd')- stats.youngest as youngest_in_days,
    to_date('2021-11-17', 'yyyy-MM-dd') - stats.oldest as oldest_in_days
from (
SELECT
    d.department_id as dep_id,
    max(hire_date) as youngest,
    min(hire_date) as oldest
FROM employees e
		JOIN departments d 
        on e.department_id=d.department_id
GROUP BY d.department_id
) stats
join departments d2
on dep_id=d2.DEPARTMENT_ID