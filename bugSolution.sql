The issue is resolved by correlating the subquery to the outer query, ensuring that the average salary is calculated for each department separately.  This can be achieved using a correlated subquery or by joining the tables appropriately.

**Solution using correlated subquery:**
```sql
SELECT
    d.department_name,
    (SELECT AVG(e.salary) FROM employees e WHERE e.department_id = d.department_id) AS avg_salary
FROM
departments d;
```

**Solution using JOIN:**
```sql
SELECT
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM
departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
```