select * from jaherna42.department order by dept_name, dept_code;

insert into jaherna42.employee
values (jaherna42.emp_id_seq.nextval,'Zoe','Bloomfield',0919,'832-808-0303',
'zbloom@abcco.com','HIRE',
to_date('27-JAN-20 09:00:00 AM', 'DD-MON-RR HH:MI:SS AM'),
'SALES','Sales Media Manager',null,null,null);

select jaherna42.emp_id_seq.currval from dual;
select * from jaherna42.employee where emp_id = 437;
commit;

select * from jaherna42.it_asset_desc where asset_make = 'Apple';

select * from jaherna42.asset_type;

insert into jaherna42.it_asset_desc values (jaherna42.it_asset_desc_id_seq.nextval,
1,'Apple','MacBook Pro 14','Apple M1 Pro with 8-core CPU',null,null);

select jaherna42.it_asset_desc_id_seq.currval from dual;
select * from jaherna42.it_asset_desc where asset_desc_id = 253;
select * from jaherna42.computer;

insert into jaherna42.computer values (253,
'Apple M1 Pro with 8-core CPU','14-core GPU','16GB unified memory',
'SSD','512GB','built-in','14-inch Liquid Retina XDR display',null,null);
commit;

insert into jaherna42.ci_inventory
values (jaherna42.ci_inv_id_seq.nextval,253,'PURCHASE',
'Serial No. 8799476',
to_date('12-FEB-22 09:05:00 AM','DD-MON-RR HH:MI:SS AM'),
'WORKING',to_date('12-FEB-22 09:05:01 AM','DD-MON-RR HH:MI:SS AM'),null,null);

insert into jaherna42.it_asset_inv_summary
values(jaherna42.it_asset_inv_summary_id_seq.nextval,253,
to_date('12-FEB-22 09:06:00 AM','DD-MON-RR HH:MI:SS AM'),1,0,0,null,null);
commit;

insert into jaherna42.employee
values (jaherna42.emp_id_seq.nextval,'Josh','Sanchez',0727,'832-444-0428',
'jsanchez@abcco.com','HIRE',
to_date('27-JAN-20 09:00:00 AM', 'DD-MON-RR HH:MI:SS AM'),
'ITHELP','Apple IT Manager',313,null,null);

select jaherna42.ci_inv_id_seq.currval from dual;
select*from jaherna42.ci_inventory where ci_inv_id = 425;
select jaherna42.emp_id_seq.currval from dual;
select*from jaherna42.employee where emp_id = 448;

insert into jaherna42.employee_ci
values (425,448,'SUPPORT',to_date('27-JAN-20 12:00:00 PM', 'DD-MON-RR HH:MI:SS AM'),
null,null,null);

select*from jaherna42.computer where changed_by_user = 'RDTRAN3';

insert into jaherna42.it_asset_inv_summary
values(jaherna42.it_asset_inv_summary_id_seq.nextval,253,
to_date('12-FEB-22 12:00:00 PM', 'DD-MON-RR HH:MI:SS AM'),1,0,0+1,null,null);

insert into jaherna42.employee_ci
values(425,437,'USE',to_date('27-JAN-20 12:00:00 PM', 'DD-MON-RR HH:MI:SS AM'),
null,null,null);

select jaherna42.ci_inv_id_seq.currval from dual;
select*from jaherna42.employee where last_name like 'Bloomfield';

select*from jaherna42.it_asset_inv_summary where asset_desc_id = 253;

insert into jaherna42.it_asset_inv_summary
values(jaherna42.it_asset_inv_summary_id_seq.nextval,253,
to_date('12-FEB-22 12:00:00 PM', 'DD-MON-RR HH:MI:SS AM'),1-1,0+1,1,null,null);
commit;

--Task 5 Command 1
select emp_id,first_name,last_name,co_email,action,action_date,dept_code,
job_title from jaherna42.employee where changed_by_user = 'RDTRAN3';

--Task 5 Command 2
select asset_desc_id,asset_type_id,asset_make,asset_model,asset_ext
from jaherna42.it_asset_desc where changed_by_user = 'RDTRAN3';

--Task 5 Command 3
select * from jaherna42.computer
--the ITAM documents explain what tables represent sub-entities
where changed_by_user = 'RDTRAN3';

--Task 5 Command 4
select ci_inv_id,asset_desc_id,purchase_or_rental,unique_id,ci_acquired_date,
ci_status_code,ci_status_date from jaherna42.ci_inventory 
where changed_by_user = 'RDTRAN3';

insert into jaherna42.ci_inventory
values (jaherna42.ci_inv_id_seq.nextval,253,'PURCHASE',
'Serial No. 8799472',
to_date('12-FEB-22 09:05:00 AM','DD-MON-RR HH:MI:SS AM'),
'WORKING',to_date('12-FEB-22 09:05:07 AM','DD-MON-RR HH:MI:SS AM'),null,null);
commit;

select*from jaherna42.ci_inventory where changed_by_user = 'RDTRAN3';

update jaherna42.ci_inventory set ci_status_code = 'DISPOSED'
where ci_inv_id = 428;

--Task 5 Command 5
select ci_inv_id,emp_id,use_or_support,date_assigned,date_unassigned
from jaherna42.employee_ci where changed_by_user = 'RDTRAN3';

--Task 5 Command 6
select * from jaherna42.it_asset_inv_summary 
where changed_by_user = 'RDTRAN3'
order by asset_desc_id,it_asset_inv_summary_id;

--Task 5 Command 7
select * from jaherna42.related_assets
where changed_by_user = 'RDTRAN3' ;

insert into jaherna42.related_assets
values(253,'RO',201,null,null);



select * from ex.downloads order by download_id desc;


select invoice_number, invoice_date,
numtodsinterval(current_date-invoice_date,'DAY') as days_old
from jdoe22.invoices
where numtodsinterval(current_date-invoice_date,'DAY')
> numtodsinterval(30,'DAY')
AND invoice_total - credit_total - payment_total > 0
order by days_old desc;

select vendor_name, vendor_state,
vendor_phone from jdoe22.vendors;

create or replace view vw_vendors_min_info
as
select vendor_name as "Name of Vendor",vendor_state as "US State",
vendor_phone as "Phone #" from jdoe22.vendors;

select * from vw_vendors_min_info;

insert into jdoe22.vendors values(jdoe22.vendor_id_seq.nextval,
'Dragon Co.',null,null,'Houston','TX','77056',
null,null,null,5,230,null,null);

commit;

select*from jdoe22.vendors where vendor_name like 'Dragon Co.';
 changed a values through my view
update vw_vendors_min_info
set "US State" = 'TX' 
where "Name of Vendor" like 'Dragon Co.';

select*from jaherna42.employee
where action_date > to_date('27-JAN-20 09:00:00 AM','DD-MON-RR HH:MI:SS AM');

--Task 1
select first_name || ' ' || last_name as "Employee Name",
job_title as "Job Title", co_email as "Email", action_date as "Action Date", action as "Action"
from jaherna42.employee
where action_date < to_date('18-FEB-20 12:00:00 AM','DD-MON-RR HH:MI:SS AM')
and action != 'CHANGE JOB TITLE'
and action != 'TERMINATE';

--Task 2
select jaherna42.employee.emp_id, jaherna42.employee_ci.emp_id
from jaherna42.employee
inner JOIN jaherna42.employee_ci on 
jaherna42.employee.emp_id = jaherna42.employee_ci.emp_id;

--Task 3
--replace A (but not 'A') with your first table name
select 'jaherna42.employee' as my_table,count(*) from jaherna42.employee 
union 
--replace B (but not 'B') with your second table name
select 'jaherna42.employee_ci' as my_table,count(*) from JAHERNA42.employee_ci
union 
select 'A join B' as my_table, count(*) from JAHERNA42.employee join JAHERNA42.employee_ci
on jaherna42.employee.emp_id = jaherna42.employee_ci.emp_id;

--Task 4
-- The count for table B is the same as the total join of the tables

--Task 5
select jaherna42.employee_ci.emp_id, jaherna42.employee.emp_id
from jaherna42.employee_ci
inner JOIN jaherna42.employee on 
jaherna42.employee_ci.emp_id = jaherna42.employee.emp_id;

--Task 6
select 'jaherna42.employee_ci' as my_table,count(*) from jaherna42.employee_ci
union 
select 'jaherna42.employee' as my_table,count(*) from jaherna42.employee
union 
select 'B join A' as my_table, count(*) from jaherna42.employee_ci join jaherna42.employee
on jaherna42.employee_ci.emp_id = jaherna42.employee.emp_id;

--Task 7
-- A join B and B join A returned the same results

--Task 8
select cii.ci_inv_id,asset_desc_id,emp_id,date_assigned
from jaherna42.ci_inventory cii 
join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id;


--Task 9
select cii.ci_inv_id,asset_desc_id,emp_id,date_assigned
from jaherna42.ci_inventory cii 
left join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id;


--Task 10
select cii.ci_inv_id,asset_desc_id,emp_id,date_assigned
from jaherna42.ci_inventory cii 
right join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id;


--Task 11
select cii.ci_inv_id,asset_desc_id,emp_id,date_assigned
from jaherna42.ci_inventory cii 
full join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id;

 
--Task 12
-- An inner join only results with matching data. 
-- The results has no nulls so that verifies it. 
-- An outer join returns results when there is no matching data
-- There were nulls in all the outer joins and more rows without matching data.


--Task 13
select 'X' as my_table, count(*)
from jaherna42.ci_inventory
union
select 'Y' as my_table, count(*) 
from jaherna42.employee_ci
union
select 'X join Y' as my_table,count(*)  
from jaherna42.ci_inventory x join jaherna42.employee_ci y 
on x.ci_inv_id = y.ci_inv_id
union
select 'X left join Y' as my_table, count(*)
from jaherna42.ci_inventory x left join jaherna42.employee_ci y 
on x.ci_inv_id = y.ci_inv_id
union
select 'X right join Y' as my_table, count(*)
from jaherna42.ci_inventory x right join jaherna42.employee_ci y 
on x.ci_inv_id = y.ci_inv_id
union
select 'X full join Y' as my_table, count(*)
from jaherna42.ci_inventory x full join jaherna42.employee_ci y  
on x.ci_inv_id = y.ci_inv_id;


--Task 14
select e.emp_id,first_name,ci_inv_id,date_assigned
from jaherna42.employee e 
join jaherna42.employee_ci eci
on e.emp_id = eci.emp_id;


--Task 15
select e.emp_id,first_name,ci_inv_id,date_assigned
from jaherna42.employee e 
left join jaherna42.employee_ci eci
on e.emp_id = eci.emp_id;


--Task 16
select e.emp_id,first_name,ci_inv_id,date_assigned
from jaherna42.employee e 
right join jaherna42.employee_ci eci
on e.emp_id = eci.emp_id;


--Task 17
select e.emp_id,first_name,ci_inv_id,date_assigned
from jaherna42.employee e 
full join jaherna42.employee_ci eci
on e.emp_id = eci.emp_id;


--Task 18
select 'X' as my_table, count(*)
from jaherna42.employee
union
select 'Y' as my_table, count(*) 
from jaherna42.employee_ci
union
select 'X join Y' as my_table,count(*)  
from jaherna42.employee x join jaherna42.employee_ci y 
on x.emp_id = y.emp_id
union
select 'X left join Y' as my_table, count(*)
from jaherna42.employee x left join jaherna42.employee_ci y 
on x.emp_id = y.emp_id
union
select 'X right join Y' as my_table, count(*)
from jaherna42.employee x right join jaherna42.employee_ci y 
on x.emp_id = y.emp_id
union
select 'X full join Y' as my_table, count(*)
from jaherna42.employee x full join jaherna42.employee_ci y  
on x.emp_id = y.emp_id;


--Task 20
select cii.ci_inv_id,ci_status_description
from jaherna42.ci_inventory cii
left join jaherna42.ci_status cis
on cii.ci_status_code = cis.ci_status_code
order by ci_status_description;
