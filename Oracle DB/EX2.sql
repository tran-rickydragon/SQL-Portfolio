
select invoice_total - payment_total
-credit_total, credit_total
from jdoe22.invoices
where
invoice_total - payment_total
- credit_total >0
and sysdate - invoice_due_date > 30;
--Task 5 Spare Lenovos and Dells

select count(*), sum(line_item_amt), gla.account_description
from jdoe22.invoice_line_items ili
join jdoe22.general_ledger_accounts gla
on ili.account_number = gla.account_number
group by account_description
having count(*)> 1;

--Task 5 Spare Lenovos and Dells

select iad.asset_make, count(*)
from jaherna42.asset_type ast join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join
jaherna42.ci_inventory cii on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id
where upper(asset_type_desc) = upper('Computer')
and upper(use_or_support) <> 'USE'
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make
;

--Task 1 Employee List

select last_name || ' ' || substr(first_name,1,1) as "Employee Name",
co_mobile as "Cell No.", dept_name as "Department"
from jaherna42.employee e join jaherna42.department d
on e.dept_code = d.dept_code
order by last_name, first_name, co_mobile, dept_name
;

--Task 2 Asset Description for Assets in Use

select asset_make, asset_model, asset_type_desc, num_assgnd_use
from JAHERNA42.it_asset_desc iad join jaherna42.asset_type ast
on iad.asset_type_id = ast.asset_type_id
join jaherna42.it_asset_inv_summary iais on
iad.asset_desc_id = iais.asset_desc_id
where num_assgnd_use > 0
group by num_assgnd_use, asset_model, asset_make, asset_type_desc
;

--Task 3 Lenovos Supported

select count(cii.asset_desc_id) as "Count",
iad.asset_make as "Make",iad.asset_model as "Model"
from jaherna42.employee_ci eci
join jaherna42.ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join jaherna42.it_asset_desc iad
on cii.asset_desc_id = iad.asset_desc_id
where upper(iad.asset_make) like '%LENOVO%'
and eci.use_or_support = 'SUPPORT'
group by iad.asset_make,iad.asset_model,iad.asset_ext
;

SELECT account_number, account_description
FROM jdoe22.general_ledger_accounts gla
WHERE NOT EXISTS (SELECT * FROM 
jdoe22.invoice_line_items ili
WHERE gla.account_number = ili.account_number)
ORDER BY account_number;

--Task 4 Spare CIs 
 (using subquery)
select asset_make, asset_model, ci_status_code, num_assgnd_use
from jaherna42.it_asset_desc iad
join JAHERNA42.ci_inventory cii
on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.it_asset_inv_summary iais
on iais.asset_desc_id = iad.asset_desc_id
join jaherna42.asset_type ast
on ast.asset_type_id = iad.asset_type_id
where not exists (select * from
jaherna42.employee_ci eci
where cii.ci_inv_id = eci.ci_inv_id)
and upper(ast.asset_type_desc) = 'COMPUTER'
and upper(cii.ci_status_code) = 'WORKING'
and num_assgnd_use = 0
;
--Task 5 Spare Lenovos and Dells

select iad.asset_make, count(*)
from jaherna42.asset_type ast join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join
jaherna42.ci_inventory cii on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id
where upper(asset_type_desc) = upper('Computer')
and upper(use_or_support) <> 'USE'
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make
;
--Task 6 Spare Lenovos and Dells

select asset_make, count(*)
from jaherna42.it_asset_inv_summary iais
join jaherna42.it_asset_desc iad
on iais.asset_desc_id = iad.asset_desc_id 
join jaherna42.asset_type ast
on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii 
on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.employee_ci eci
on cii.ci_inv_id = eci.ci_inv_id
where upper(asset_type_desc) = upper('Computer')
and upper(use_or_support) <> 'USE'
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
and num_assgnd_use = 0
group by asset_make
;

--Task 7 Compare Spare Dells and Lenovos Results

select iad.asset_make, count(*)
from jaherna42.asset_type ast join jaherna42.it_asset_desc iad on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.employee_ci eci on cii.ci_inv_id = eci.ci_inv_id
where upper(asset_type_desc) = upper('Computer')
and upper(use_or_support) <> 'USE' and asset_make in ('Dell','Lenovo') and ci_status_code = 'WORKING'
group by asset_make

union

select asset_make, count(*)
from jaherna42.it_asset_inv_summary iais
join jaherna42.it_asset_desc iad on iais.asset_desc_id = iad.asset_desc_id 
join jaherna42.asset_type ast on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii  on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.employee_ci eci on cii.ci_inv_id = eci.ci_inv_id
where upper(asset_type_desc) = upper('Computer')
and upper(use_or_support) <> 'USE' and asset_make in ('Dell','Lenovo') and ci_status_code = 'WORKING' and num_assgnd_use = 0
group by asset_make
;

--Task 8 Assets Assigned After a Specific Date

select first_name || ' ' || last_name as "Employee Name",
asset_make as "Make", asset_model as "Model", date_assigned as "Date Assigned"
from JAHERNA42.employee e
join jaherna42.employee_ci eci on e.emp_id = eci.emp_id
join JAHERNA42.ci_inventory cii on cii.ci_inv_id = eci.ci_inv_id
join JAHERNA42.it_asset_desc iad on iad.asset_desc_id = cii.asset_desc_id
where date_assigned > to_date('12-JAN-20 11:00:00 AM', 'DD-MON-RR HH:MI:SS AM')
order by date_assigned
;

--Task 9 Assets Assigned in One Month of Any Year

select first_name || ' ' || last_name as "Employee Name",
asset_make as "Make", asset_model as "Model", date_assigned as "Date Assigned"
from JAHERNA42.employee e
join jaherna42.employee_ci eci on e.emp_id = eci.emp_id
join JAHERNA42.ci_inventory cii on cii.ci_inv_id = eci.ci_inv_id
join JAHERNA42.it_asset_desc iad on iad.asset_desc_id = cii.asset_desc_id
where extract(month from date_assigned) in (4)
;

--Task 10 Assets Assigned on a Specific Date

select first_name || ' ' || last_name as "Employee Name",
asset_make as "Make", asset_model as "Model", date_assigned as "Date Assigned"
from JAHERNA42.employee e
join jaherna42.employee_ci eci on e.emp_id = eci.emp_id
join JAHERNA42.ci_inventory cii on cii.ci_inv_id = eci.ci_inv_id
join JAHERNA42.it_asset_desc iad on iad.asset_desc_id = cii.asset_desc_id
where date_assigned > to_date('26-JAN-20 11:59:59 PM', 'DD-MON-RR HH:MI:SS AM')
and date_assigned < to_date('28-JAN-20 12:00:00 AM', 'DD-MON-RR HH:MI:SS AM')
;