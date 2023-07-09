--Ex 5 Task 1 Command 1 Create the Constraint

--Implementing: (3) When a CI is first added to inventory, the status should be 'WORKING'.
alter table ci_inventory
modify ci_status_code
default 'WORKING';

--Ex 5 Task 1 Command(s) 2 Demonstrate the Constraint Working

--Implementing: (3) When a CI is first added to inventory, the status should be 'WORKING'.
insert into ci_inventory
values (ci_inv_id_seq.nextval, 10,'PURCHASE','Serial No. 1234987', 
to_date('27-MAR-22 09:05:00 AM','DD-MON-RR HH:MI:SS AM'),default,
to_date('27-MAR-22 09:05:00 AM','DD-MON-RR HH:MI:SS AM'));

select * from ci_inventory;

--Ex 5 Task 2 Command 1 - Create the Constraint

--Implementing: (1) Department names are unique.
alter table department
add unique (dept_name);

--Ex 5 Task 2 Command 2 - Demonstrate the Constraint Working

--Implementing: (1) Department names are unique.
select * from department;
insert into department
values ('SALE','Sales');

--Ex 5 Task 3 Command 1 - Create the Constraint

--Implementing: (1) An employee email address should use the company domain. 
--That is, the email address should end with 'abcco.com'. 
alter table employee
add check (co_email like '%_@abcco.com%');

--Ex 5 Task 3 Command 2 - Demonstrate the Constraint Working

--Implementing: (1) An employee email address should use the company domain. 
--That is, the email address should end with 'abcco.com'. 
select * from employee;
insert into employee
values (emp_id_seq.nextval,'Josh','Sanchez',0727,'832-444-0428',
'jsanchez@abcco.com','HIRE',
to_date('27-MAR-20 09:00:00 AM', 'DD-MON-RR HH:MI:SS AM'),
'ITHELP','Apple IT Manager',null);
rollback;

select * from ci_inventory;
select * from employee_ci;
select * from it_asset_desc;
select * from asset_type;


-- Ex 5 Task 4 Write the Query

select asset_make, asset_model, asset_type_desc, unique_id, date_assigned
from employee_ci eci
join ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join it_asset_desc iad
on cii.asset_desc_id = iad.asset_desc_id
join asset_type aty
on iad.asset_type_id = aty.asset_type_id
where date_assigned > to_date('30-NOV-21 11:59:59 PM', 'DD-MON-RR HH:MI:SS AM')
and date_assigned < to_date('01-MAR-22 12:00:00 AM', 'DD-MON-RR HH:MI:SS AM')
and use_or_support = 'USE';

select add_months(sysdate,-3) from dual;
select to_char(add_months(sysdate,-3),'MM-YY') from dual;
select to_date('12-21','MM-YY') from dual;
select to_char(sysdate,'MM-YY') from dual;
select to_date('03-22','MM-YY') from dual;
select to_date('03-22','MM-YY')-1 from dual;

--Ex 5 Task 5 Create the View

create view past3
as
select asset_make, asset_model, asset_type_desc, unique_id, date_assigned
from employee_ci eci
join ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join it_asset_desc iad
on cii.asset_desc_id = iad.asset_desc_id
join asset_type aty
on iad.asset_type_id = aty.asset_type_id
where date_assigned > to_date('12-21','MM-YY')
and date_assigned < to_date('03-22','MM-YY')-1;

select*from past3;

--Ex 5 Task 7 Change Data Through the View

--Screenshot 1 The command to insert, update, or delete through the view
--and result
insert into past3 (asset_make, asset_model, asset_type_desc, unique_id, date_assigned)
values ('Dell','Inspiron 15 Laptop','Computer',
'Serial No. JCG277488',to_date('27-MAR-22 09:05:00 AM','DD-MON-RR HH:MI:SS AM'));