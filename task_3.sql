select
    subquery2.depart_id as depart_id,
    d3.department_name as dep_name,
    e3.first_name || ' ' || e3.last_name AS manager_name,
    subquery2.max_sal as max_sal,
    row_number() over(order by subquery2.max_sal desc) as rating,
    subquery2.avg_sal as avg_sal,
    subquery2.min_sal as min_sal,
    subquery2.emp_count as emp_count,
    subquery2.median_sal as median_sal,
    subquery2.diff_max_avg as diff_max_avg,
    subquery2.diff_min_avg as diff_min_avg
from (
        select 
            subquery.dep_id as depart_id,
            AVG(subquery.salary) as avg_sal,
            max(subquery.salary) as max_sal,
            min(subquery.salary) as min_sal,
            median(subquery.salary) as median_sal,
            (max(subquery.salary)/AVG(subquery.salary)-1)*100 as diff_max_avg,
            (1 - min(subquery.salary)/AVG(subquery.salary))*100 as diff_min_avg,
            COUNT(*) as emp_count
        from (
            select 
                d.DEPARTMENT_ID as dep_id,
                e2.SALARY as salary
            from departments d
                right join employees e2
                on d.DEPARTMENT_ID=e2.DEPARTMENT_ID
            ) subquery
        group by subquery.dep_id
    ) subquery2

left join departments d3
on d3.department_id=subquery2.depart_id

left join employees e3
on d3.manager_id=e3.employee_id

