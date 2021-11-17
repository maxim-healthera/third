SELECT 
    e.first_name || ' ' || E.last_name AS emp_name,
    e.salary as emp_salary,
    e.job_id as emp_job,
    m.first_name || ' ' || M.last_name AS manager,
    m.job_id as manager_job,
    m.salary as manager_salary
FROM employees E 
    LEFT OUTER JOIN employees M
      ON E.manager_id = M.employee_id;