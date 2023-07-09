
--Ex 7 Task 1
create or replace trigger dept_code_caps
before insert or update of dept_code 
on department
for each row
when (new.dept_code != upper(new.dept_code))
begin 
    :new.dept_code := upper(:new.dept_code);
end;


--Ex 7 Task 2 Command 1 INSERT or UPDATE to fire the trigger from Task 1
update department
set dept_code = 'sales'
where dept_name = 'Sales';


--Ex 7 Task 2 Command 2 SELECT to show the data that was or was not changed
select*from department;


--Ex 7 Task 3 - Create the trigger
--Implementing: A trigger to prevent an insert into the [name of table] table 
--when the type of the asset description is something other than [asset type].
create or replace trigger application_check
before insert or update of asset_desc_id --name the only column that could be updated in violation of the business rule being enforced
on application --What table? application, computer, it_service, peripheral, or server
for each row -- it is a row level trigger
declare
  asset_type_desc_var varchar2(30);--declare a variable to hold the asset's type description
begin
  select asset_type_desc into asset_type_desc_var from asset_type aty
  join it_asset_desc iad
  on aty.asset_type_id = iad.asset_type_id
  where iad.asset_desc_id = :new.asset_desc_id;
  if asset_type_desc_var != 'application' then
    RAISE_APPLICATION_ERROR(-20001,'Only assets that are the right type can be put in the table of that type.');    
  end if;
end;

select*from it_asset_desc;

--Type your name here
--Ex 7 Task 4 -- Command that is an incorrect insert into the table on which the trigger is defined
insert into application
values (1,'Dell','XPS 15');


--Ex 7 Task 5 -- Create the trigger

create or replace trigger computer_check
before insert or update of asset_desc_id --name the only column that could be updated in violation of the business rule being enforced
on computer --What table? application, computer, it_service, peripheral, or server
for each row -- it is a row level trigger
declare
  asset_type_desc_var varchar2(30);--declare a variable to hold the asset's type description
begin
  select asset_type_desc into asset_type_desc_var from asset_type aty
  join it_asset_desc iad
  on aty.asset_type_id = iad.asset_type_id
  where iad.asset_desc_id = :new.asset_desc_id;
case asset_type_desc_var
    when 'Computer' then 
        insert into computer values (:new.ASSET_DESC_ID,null,null,null,null,null,null,null);
    when 'Application' then 
        insert into application values (:new.ASSET_DESC_ID,null,null);
    when 'IT Service' then 
        insert into it_service values (:new.ASSET_DESC_ID,null);
    when 'Peripheral' then 
        insert into peripheral values (:new.ASSET_DESC_ID,null);
    when 'Server' then 
        insert into server values (:new.ASSET_DESC_ID,null,null,null,null);
end case;
end;

select*from asset_type;


--Ex 7 Task 6 Command 1 INSERT incorrectly

insert into computer
values (6,null,null,null,null,null,null,null);


--Ex 7 Task 6 Command 2 SELECT from the table where the trigger is defined
select*from computer;


--Ex 7 Task 6 Command 3 SELECT from the table where the data got inserted
select*from application;


--Ex 7 Task 7
--I think the functionallity of task 6 is useful because it automates more insertion
--On the other hand it could insert things that are labled incorrectly 

--Type your name here
--Ex 7 Task 8 - Create the trigger
create or replace trigger asset_type_seq_id
before insert on asset_type
for each row
begin
 select asset_type_id_seq.nextval
  into :new.asset_type_id
  from dual;
end;


--Ex 7 Task 9
insert into asset_type values(null,'Game');
select asset_type_id_seq.currval from dual;
select*from asset_type where asset_type_id = 21;


--Ex 7 Task 10
insert into asset_type values(12,'Audio');
select asset_type_id_seq.currval from dual;
select*from asset_type where asset_type_id = 23;


--Ex 7 Task 11
insert into asset_type (asset_type_desc) values('Chair');
select asset_type_id_seq.currval from dual;
select*from asset_type where asset_type_id = 24;


--Ex 7 Task 12 - Create the trigger
--Implementing: State which business rule you are writing code to enforce.
select*from IT_ASSET_INV_SUMMARY;
create or replace trigger it_asset_inv_summary_plus
after insert 
on ci_inventory
for each row
begin
    insert into it_asset_inv_summary values
    (IT_ASSET_INV_SUMMARY_ID_seq.nextval,:new.ASSET_DESC_ID, sysdate, 1,
     null, null);
end;


--Ex 7 Task 13 Command 1 -- DML to cause the trigger to fire
insert into ci_inventory values(ci_inv_id_seq.nextval,1,null,null,sysdate,'WORKING',sysdate);


--Ex 7 Task 13 Command 2 -- DML to show the data not changed or changed by the command
select ci_inv_id_seq.currval from dual;
select*from ci_inventory where ci_inv_id = 83;


--Ex 7 Task 13 Command 3 -- DML to select from the it_asset_inv_summary table to see the data added
select IT_ASSET_INV_SUMMARY_ID_seq.currval from dual;
select*from IT_ASSET_INV_SUMMARY where IT_ASSET_INV_SUMMARY_ID = 101;


--Ex 7 Task 14 A command that shows that the trigger raises the mutating table error
create or replace trigger update_inv_summary
before update of DATE_UNASSIGNED
on employee_ci
for each row
declare
count_use number;
asset_id_val number;
count_avl number;
count_sup number;
begin
select asset_desc_id into asset_id_val 
from ci_inventory where
ci_inv_id = :new.ci_inv_id;
select count(*) into  count_use 
from employee_ci eci
join ci_inventory cii on eci.ci_inv_id = cii.ci_inv_id
where use_or_support = 'USER' and DATE_UNASSIGNED is null
and cii.asset_desc_id = asset_id_val;
select count(*) into  count_sup 
from employee_ci eci
join ci_inventory cii on eci.ci_inv_id = cii.ci_inv_id
where use_or_support = 'SUPPORT' and DATE_UNASSIGNED is null
and cii.asset_desc_id = asset_id_val;
select count(*) into  count_avl 
from ci_inventory cii 
where ci_inv_id not in (select ci_inv_id from employee_ci
where DATE_UNASSIGNED is null) and cii.asset_desc_id = asset_id_val;
insert into it_asset_inv_summary values
(it_asset_inv_summary_id_seq.nextval,asset_id_val,sysdate,count_avl,
count_use,count_sup);
end;


--Ex 7 Task 14 A command that shows that the trigger raises the mutating table error
select*from employee_ci;
update employee_ci set DATE_UNASSIGNED = '24-APR-20' where emp_id = 2;

select*from employee;


--Ex 7 Task 15
--A trigger that will not allow an employee that is not in ITHELP to support an it asset
--it would have to be defined on the employee_ci table
--it would have to access the employee table as well
--it would be a before triggerso that an employee not in ITHELP can't be updated to support