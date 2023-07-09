--Task 1 Employee List
select last_name || ' ' || substr(first_name,1,1) as "Employee Name",
co_mobile as "Cell No.", dept_name as "Department"
from jaherna42.employee e join jaherna42.department d
on e.dept_code = d.dept_code
order by last_name, first_name, co_mobile, dept_name
;

--Task 2 Asset Description
select asset_make, asset_model, asset_type_desc, num_assgnd_use
from jaherna42.it_asset_desc iad 
join jaherna42.asset_type asset_type
on iad.asset_type_id = ast.asset_type_id
join jaherna42.it_asset_inv_summary iais 
on iad.asset_desc_id = iais.asset_desc_id
where num_assgnd_use > 0
group by num_assgnd_use, asset_model, asset_make, asset_type_desc
;

--Task 3 Lenovos Supported
select count(cii.asset_desc_id) as "Count", iad.asset_make as "Make", iad.asset_model as "Model"
from jaherna42.employee_ci eci
join jaherna42.ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join jaherna42.it_asset_desc iad
on cii.asset_desc_id = iad.asset_desc_id
where upper(iad.asset_make) like "%LENOVO%"
and eci.use_or_support = 'SUPPORT'
group by iad.asset_make, iad.asset_model, iad.asset_ext
;

--Task 4 Spare CIs
select asset_make, asset_model, ci_status_code, num_assgnd_use
from jaherna42.it_asset_desc iad
join jaherna42.ci_inventory cii
on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.it_asset_inv_summary iais
on iais.asset_desc_id = iad.asset_desc_id
join jaherna42.asset_type ast
on ast.asset_type_id = iad.asset_type_id
where not exists (select*
from jaherna42.employee_ci eci
where cii.ci_inv_id = eci.ci_inv_id)
and upper(ast.asset_type_desc) = 'COMPUTER'
and upper(cii.ci_status_code) = 'WORKING'
and num_assgnd_use = 0
;

--Task 5 Spare Lenovos and Dells
select iad.asset_make, count(*), ci_status_code
from jaherna42.asset_type ast 
join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii 
on iad.asset_desc_id = cii.asset_desc_id
where upper(asset_type_desc) = upper('Computer')
and cii.ci_inv_id 
not in(select ci_inv_id 
from jaherna42.employee_ci 
where use_or_support = 'USE' 
and date_unassigned is null)
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make, ci_status_code
;

--Task 6 Spare Lenovos and Dells
select iad.asset_make, count(*), ci_status_code
from jaherna42.asset_type ast 
join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii 
on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.it_asset_inv_summary iais 
on cii.asset_desc_id = iais.asset_desc_id
where upper(asset_type_desc) = upper('Computer')
and cii.ci_inv_id 
not in(select ci_inv_id 
from jaherna42.employee_ci 
where use_or_support = 'USE' 
and date_unassigned is null)
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make, ci_status_code
;

--Task 7 Compare Spare Dells and Lenovos Results
select iad.asset_make, count(*), ci_status_code
from jaherna42.asset_type ast 
join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii 
on iad.asset_desc_id = cii.asset_desc_id
where upper(asset_type_desc) = upper('Computer')
and cii.ci_inv_id 
not in(select ci_inv_id 
from jaherna42.employee_ci 
where use_or_support = 'USE' 
and date_unassigned is null)
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make, ci_status_code

UNION 

SELECT iad.asset_make, count(*), ci_status_code
from jaherna42.asset_type ast 
join jaherna42.it_asset_desc iad
on ast.asset_type_id = iad.asset_type_id
join jaherna42.ci_inventory cii 
on iad.asset_desc_id = cii.asset_desc_id
join jaherna42.it_asset_inv_summary iais 
on cii.asset_desc_id = iais.asset_desc_id
where upper(asset_type_desc) = upper('Computer')
and cii.ci_inv_id 
not in(select ci_inv_id 
from jaherna42.employee_ci 
whereuse_or_support = 'USE' 
and date_unassigned is null)
and asset_make in ('Dell','Lenovo')
and ci_status_code = 'WORKING'
group by asset_make, ci_status_code
;

--Task 8 Assets Assigned After a Specific Date
select first_name as "First Name", last_name as "Last Name", asset_make "Make", asset_model "Mode", date_assigned "Date Assigned"
from jaherna42.employee emp
join jaherna42.employee_ci eci 
on emp.emp_id = eci.emp_id
join jaherna42.ci_inventory cii 
on cii.ci_inv_id = eci.ci_inv_id
join jaherna42.it_asset_desc ita 
on ita.asset_desc_id = cii.asset_desc_id
where to_char(date_assigned, 'DD-MON-YY HH24:MI:SS') > '12-JAN-2020 11:00:00'
;

--Task 9 Assets Assigned in One Month of Any Year
select first_name as "First Name", last_name as "Last Name", asset_make "Make", asset_model "Mode", date_assigned "Date Assigned"
from jaherna42.employee emp
join jaherna42.employee_ci eci 
on emp.emp_id = eci.emp_id
join jaherna42.ci_inventory cii 
on cii.ci_inv_id = eci.ci_inv_id
join jaherna42.it_asset_desc ita 
on ita.asset_desc_id = cii.asset_desc_id
where upper(date_assigned) like '%APR%'
;

--Task 10 Assets Assigned on a Specific Date
select first_name as "First Name", last_name as "Last Name", asset_make "Make", asset_model "ModeL", date_assigned "Date Assigned"
from jaherna42.employee emp
join jaherna42.employee_ci eci 
on emp.emp_id = eci.emp_id
join jaherna42.ci_inventory cii 
on cii.ci_inv_id = eci.ci_inv_id
join jaherna42.it_asset_desc ita 
on ita.asset_desc_id = cii.asset_desc_id
where to_DATE(date_assigned) = to_DATE('15-AUG-20', 'DD-MON-YY')
;
