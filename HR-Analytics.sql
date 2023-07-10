--Practice queries are written by me. Data dump was provided to me

-- 1. Which region has the most operations?
select r.region_name, count(department_id) as number_of_operations
from regions r
join countries using(region_id)
join locations using(country_id)
join departments using(location_id)
group by 1
order by 2 desc
limit 1;

-- 2. Which department has the most employees?
select d.department_name, count(employee_id) as number_of_empoyees
from departments d
join employees e using(department_id)
group by 1
order by 2 desc
limit 1;

-- 3. Which location has the most Departments?
select l.location_id, l.city, l.state_province, count(department_id) as number_of_departments
from locations l
join departments d using (location_id)
group by 1
order by 4 desc
limit 1;

-- 4. Which employee(s) is/are the latest hires?
select first_name, last_name, hire_date
from employees
where hire_date = (select max(hire_date)
from employees);

-- 5. Which region has a more operational cost?
select r.region_id, r.region_name, sum(e.salary) as operational_cost
from regions r
join countries using(region_id)
join locations using(country_id)
join departments using(location_id)
join employees e using(department_id)
group by 1
order by 3 desc
limit 1;

-- 6. How many employees have received the commission?
select count(commission_pct) as commission_received
from employees
where commission_pct is not null;

-- 7. Which departments don't have managers?
select department_name
from departments
where manager_id is null
order by department_name asc;

-- 8. Who is the employee, not assigned to any department?
select concat(first_name, ' ', last_name) as fullname
from employees
where department_id is null;

-- 9. Which department has highest average salary?
select d.department_name, avg(e.salary) as avg_salary
from departments d
join employees e using (department_id)
where d.department_id is not null
group by 1
order by 2 desc
limit 1; 

-- 10. Which city has more employees in Sales?
select l.city, count(e.employee_id) as employee_count
from locations l
join departments d using(location_id)
join employees e using(department_id)
where lower(d.department_name) = "sales"
group by 1
order by 2 desc
limit 1;