
--Ex 6 Task 1
create or replace procedure testit
(gotcha out it_asset_desc.asset_make%type)
as
ran_val number(10);
smallest number(10);
largest number(10);
begin
--takes the largest asset decription id, divides it by 1000 and is named largest
select round(max(asset_desc_id)/1000,0) into largest from it_asset_desc;
--takes the smallest asset descrition is and names it smallest
select min(asset_desc_id) into smallest from it_asset_desc;
--Gets a random number from in between largest and smallest
select round(dbms_random.value(smallest,largest),0)
    into ran_val from dual;
--Gets asset make from the random number
select distinct asset_make into gotcha
from it_asset_desc where asset_desc_id = ran_val;
exception
when others then 
gotcha:= 'No make found';
end;

 
--Ex 6 Task 2
--Use testit as many times as needed to get output that is a make and 
--output that matches the value in the exception block. Capture both output
--values in one screenshot by scrolling in the Dbms Output window.
declare getit varchar2(20) := 'Hello!';
begin
testit(getit);
dbms_output.put_line(getit);
end;


--Ex 6 Task 3
create or replace procedure insert_asset_rdtran3
(
--Declare a parameter of the correct type to hold the asset type description passed in
asset_type_param varchar2,
--Declare a parameter of the correct type to hold the asset make passed in
asset_make_param varchar2,
--Declare a parameter of the correct type to hold the asset model passed in
asset_model_param varchar2,
--Declare a parameter of the correct type to hold the asset extended information passed in
asset_ext_param varchar2,
  success_param  out char --Declare an output parameter
)
is -- or as
  --Declare a variable of the correct type to hold an asset type id value (*note
  --that a value for this variable is not passed to the procedure when it is called)
  --I'm providing the code for the first one next:
  asset_type_id_var   asset_type.asset_type_id%type;
 --Declare a variable of the correct type to hold an asset id value
asset_desc_id_var number;
howmany number;
begin
  select 'S' into success_param from dual; --initialize the success state

--Write a command to retrieve the asset_type_id that matches the asset type desciption
--that the user enters and that is then stored in the parameter you set up to hold the type
--description.
select asset_type_id into asset_type_id_var from asset_type where asset_type_desc = 
asset_type_param;
--Write a command to see if the asset make, asset model, asset extended 
--information, and asset type id is already in the it_asset table, since
--there is no reason to insert a duplicate of an asset that already exists.
--The best way to find out is to select a count of how many rows match to the 
--data for make, model and extension that are passed into the procedure and saved
--in parameters. The count must be selected into a variable you declare for 
--that purpose. 

select count(*) into howmany from it_asset_desc where asset_make = asset_make_param and
asset_model = asset_model_param and asset_ext = asset_ext_param;
--Then once you have the count, you must check that the count is 0 before proceeding.
--If the count is not zero, you should raise an error (such as the value_error), 
--and then handle the error with an exception block.
--In other words, set up a decision structure (if-then) so that if the count is 
--0 the processing continues, but if it's not 0 then the processing stops.
if howmany <> 0 then
  success_param := 'F';
  raise value_error;
else
--Write a command so that, if proceeding with the processing, you
--get and store the asset description id for the insert you are going to do.
--You need to get the value for the asset_desc id from the sequence created
--for that purpose.
select it_asset_desc_id_seq.nextval into asset_desc_id_var from dual;
--Write a command to insert the data held in parameters and variables into 
--the it_asset_desc table.
insert into it_asset_desc values (asset_desc_id_var,asset_type_id_var,asset_make_param,
asset_model_param,asset_ext_param);
--Write a command to commit the data.
commit;
--Write a command to end your decision structure
end if;
  exception 
    when value_error then rollback;
    when no_data_found then success_param := 'Q';rollback;
    
    --when others then
    --handle it and update the success parameter's value to indicate failure.
end;


--Ex 6 Task 4 Command 1
--Call the stored procedure and get a success result
/*Success*/
declare 
  my_out char;
begin
  insert_asset_rdtran3('Dinosaur', 'Acer', 'Swift 3 Laptop',
  '14 in. Full HD Intel Core i5-6200U 8GB DDR4 256GB',my_out);
  dbms_output.put_line(my_out);
end;


--Ex 6 Task 4 Command 2
--Verify that the record was inserted into it_asset_desc table.
select*from it_asset_desc;


--Ex 6 Task 4 Command 3
--Call the stored procedure and get a failure result
/* Failure */
declare 
  my_out char;
begin
  insert_asset_rdtran3('Dinosaur', 'Acer', 'Swift 3 Laptop',
  '14 in. Full HD Intel Core i5-6200U 8GB DDR4 256GB',my_out);
  dbms_output.put_line(my_out);
end;


/*Ex 6 Task 5 Create a function */
create or replace function name_of_function
(
   asset_make_param varchar2,
   asset_model_param varchar2
)
RETURN number
AS 
  param_num number;
begin
  select count(distinct cii.ci_inv_id)
  into param_num
  from jaherna42.ci_inventory cii
  join jaherna42.it_asset_desc ia 
  on cii.asset_desc_id = ia.asset_desc_id
  where (ia.asset_make = asset_make_param
  and ia.asset_model = asset_model_param
  and  (cii.ci_inv_id not in 
  (select ci_inv_id from jaherna42.employee_ci)
  or cii.ci_inv_id not in (
  select ci_inv_id 
  from jaherna42.employee_ci) or  
  cii.ci_inv_id in (select distinct eci.ci_inv_id 
  from jaherna42.employee_ci eci                          
  join jaherna42.ci_inventory cii 
  on eci.ci_inv_id = cii.ci_inv_id
  where cii.ci_status_code = 'WORKING' 
  and eci.date_returned is not null) 
  and (cii.ci_status_code <> 'DISPOSED')))
  and upper(cii.ci_status_code) = 'WORKING';
  
  RETURN param_num;
end;

insert into it_asset_inv_summary values
  (1,1,sysdate,
  1,1,1);

/*Ex 6 Task 5 Create a function */

create or replace function task5_rdtran
(
   asset_make_param varchar2,
   asset_model_param varchar2
)
RETURN number
AS 
  param_num number;
begin
  select count(distinct cii.ci_inv_id)
  into param_num
  from jaherna42.ci_inventory cii
  join jaherna42.it_asset_desc ia 
  on cii.asset_desc_id = ia.asset_desc_id
  where (ia.asset_make = asset_make_param
  and ia.asset_model = asset_model_param
  and  (cii.ci_inv_id not in 
  (select ci_inv_id from jaherna42.employee_ci)
  or cii.ci_inv_id not in (
  select ci_inv_id 
  from jaherna42.employee_ci) or  
  cii.ci_inv_id in (select distinct eci.ci_inv_id 
  from jaherna42.employee_ci eci                          
  join jaherna42.ci_inventory cii 
  on eci.ci_inv_id = cii.ci_inv_id
  where cii.ci_status_code = 'WORKING') 
  and (cii.ci_status_code <> 'DISPOSED')))
  and upper(cii.ci_status_code) = 'WORKING';
  
  RETURN param_num;
end;


/*Ex 6 Task 6 Demonstrate using the function */
select task5_rdtran('Dell','XPS 15') from dual;
select task5_rdtran('1fwee','2fwee') from dual;


/* Ex 6 Task 7 Create the function */
create or replace function task7_rdtran
(
   asset_make_param varchar2,
   asset_model_param varchar2
)
RETURN number
AS 
  param_num number;
begin
  select count(distinct cii.ci_inv_id)
  into param_num
  from jaherna42.ci_inventory cii
  join jaherna42.it_asset_desc ia 
  on cii.asset_desc_id = ia.asset_desc_id
  where (ia.asset_make = asset_make_param
  and ia.asset_model = asset_model_param
  and  (cii.ci_inv_id in 
  (select ci_inv_id from jaherna42.employee_ci)
  or cii.ci_inv_id in (
  select ci_inv_id 
  from jaherna42.employee_ci) or  
  cii.ci_inv_id in (select distinct eci.ci_inv_id 
  from jaherna42.employee_ci eci                          
  join jaherna42.ci_inventory cii 
  on eci.ci_inv_id = cii.ci_inv_id
  where cii.ci_status_code = 'WORKING' 
  and eci.use_or_support = 'USE')))
  and upper(cii.ci_status_code) = 'WORKING';
  
  RETURN param_num;
end;


/* Ex 6 Task 8 Use the function */
select task7_rdtran('Dell','XPS 15') from dual;
select task7_rdtran('1fwee','2fwee') from dual;


/* Ex 6 Task 9 Create the function */
create or replace function task9_rdtran
(
   asset_make_param varchar2,
   asset_model_param varchar2
)
RETURN number
AS 
  param_num number;
begin
  select count(distinct cii.ci_inv_id)
  into param_num
  from jaherna42.ci_inventory cii
  join jaherna42.it_asset_desc ia 
  on cii.asset_desc_id = ia.asset_desc_id
  where (ia.asset_make = asset_make_param
  and ia.asset_model = asset_model_param
  and  (cii.ci_inv_id in 
  (select ci_inv_id from jaherna42.employee_ci)
  or cii.ci_inv_id in (
  select ci_inv_id 
  from jaherna42.employee_ci) or  
  cii.ci_inv_id in (select distinct eci.ci_inv_id 
  from jaherna42.employee_ci eci                          
  join jaherna42.ci_inventory cii 
  on eci.ci_inv_id = cii.ci_inv_id
  where cii.ci_status_code = 'WORKING' 
  and eci.use_or_support = 'SUPPORT')))
  and upper(cii.ci_status_code) = 'WORKING';
  
  RETURN param_num;
end;

select * from jaherna42.it_asset_desc;

/* Ex 6 Task 10 Use the function */
select task9_rdtran('Dell','XPS 15') from dual;
select task9_rdtran('1fwee','2fwee') from dual;


/* Ex 6 Task 11 Create a procedure that uses all three functions */
create or replace procedure insert_inv_summary_rdtran3
(
  asset_make_param varchar2,
  asset_model_param varchar2,
    success_param out char
)
is
  it_asset_inv_summary_id_var  jaherna42.it_asset_inv_summary.it_asset_inv_summary_id%type;
  asset_desc_id_var            jaherna42.it_asset_inv_summary.asset_desc_id%type;
  num_available_var            jaherna42.it_asset_inv_summary.num_available%type;
  num_assgnd_use_var           jaherna42.it_asset_inv_summary.num_assgnd_use%type;
  num_assgnd_support_var       jaherna42.it_asset_inv_summary.num_assgnd_support%type;
begin
  select 'S' into success_param from dual;
   select task5_rdtran(asset_make_param, asset_model_param) 
   into num_available_var from dual;
   select task7_rdtran(asset_make_param, asset_model_param) 
   into num_assgnd_use_var from dual;
   select task9_rdtran(asset_make_param, asset_model_param) 
   into num_assgnd_support_var from dual;
  select asset_desc_id into asset_desc_id_var
  from jaherna42.it_asset_desc
  where asset_make = asset_make_param
  and asset_model = asset_model_param
  and rownum = 1;
  insert into jaherna42.it_asset_inv_summary values
  (it_asset_inv_summary_id_var,asset_desc_id_var,sysdate,num_available_var,num_assgnd_use_var,num_assgnd_support_var,'RDTRAN3',sysdate);
exception
when others then
    select 'F' into success_param from dual;
  rollback;
end;

select*from jaherna42.it_asset_inv_summary;


/* Task 12 Command 1 Success */
declare get_output char := 'N';
begin
insert_inv_summary_rdtran3('Dell','XPS 15',get_output);
dbms_output.put_line(get_output);
end;


/* Task 12 Command 2 Record Inserted by Success Use */
select * from jaherna42.it_asset_inv_summary where changed_by_user = 'RDTRAN3';


/* Task 12 Command 1 Failure */
declare get_output char := 'N';
begin
insert_inv_summary_rdtran3('Dinosaur','XPS 15',get_output);
dbms_output.put_line(get_output);
end;

explain plan for 
select last_name,first_name from customers where last_name like '%K%' 
and first_name like '%G%';
   
select plan_table_ouput from table(dbms_xplan.display());

create index cust_name on customers(last_name);
drop insdex cust_name;
create index cust_name on customers(last_name,first_name);