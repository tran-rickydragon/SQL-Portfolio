
--This is the query for Ex 3 Task 2 Task Descriptionselect 'RDTRAN3' as ME,
select 'RDTRAN3' as ME,
'Task 1' as task,
asset_make,asset_model,asset_type_desc,num_assgnd_use
from jaherna42.it_asset_desc iad join jaherna42.asset_type ast
on iad.asset_type_id = ast.asset_type_id
join jaherna42.it_asset_inv_summary iais 
on iad.asset_desc_id = iais.asset_desc_id
where num_assgnd_use > 0
group by num_assgnd_use,asset_model,asset_make,asset_type_desc;


--Explain the execution plan for the query for Ex 3 Task 2 Task Description
explain plan for
select 'RDTRAN3' as ME,  --Replace USERNAME with your username in caps
'Task 1' as task,
asset_make,asset_model,asset_type_desc,num_assgnd_use
from jaherna42.it_asset_desc iad join jaherna42.asset_type ast
on iad.asset_type_id = ast.asset_type_id
join jaherna42.it_asset_inv_summary iais 
on iad.asset_desc_id = iais.asset_desc_id
where num_assgnd_use > 0
group by num_assgnd_use,asset_model,asset_make,asset_type_desc;

select plan_table_output from table(dbms_xplan.display());


--Create the view
create or replace view rdtran3_my_view as
select 'RDTRAN3' as ME, 
asset_make,asset_model,asset_type_desc,num_assgnd_use
from jaherna42.it_asset_desc iad join jaherna42.asset_type ast
on iad.asset_type_id = ast.asset_type_id
join jaherna42.it_asset_inv_summary iais 
on iad.asset_desc_id = iais.asset_desc_id
where num_assgnd_use > 0
group by num_assgnd_use,asset_model,asset_make,asset_type_desc;

select * from rdtran3_my_view;

 Task 4
--query retrieval time: 0.21 seconds
--view retrieval time: 0.126 seconds
--The view had a faster retrieval time

 Task 5
--get the execution plan for retrieval from the view
explain plan for select * from rdtran3_my_view;

select plan_table_output from table(dbms_xplan.display());

 Task 6
--They look the same, the values all have the same values.
--It does not look like the performence was enchanced.

 Task 7
--In the template replace USERNAME with your username
select sql_id, parsing_schema_name,rows_processed,cpu_time,
elapsed_time,sql_fulltext from v$sql 
where sql_fulltext like 'select ''RDTRAN3%';

 Task 8
select sql_id, parsing_schema_name,rows_processed,cpu_time,
elapsed_time,sql_fulltext from v$sql 
where sql_fulltext like 'select * from rdtran3_my_view%';

 Task 9
--Screenshot of command and results (possibly partial)
select user,tablespace_name,block_size,initial_extent,next_extent 
from user_tablespaces;

 Task 12
--Screenshot of command and results (possibly partial)
select user,segment_name,segment_type,tablespace_name,bytes,blocks,extents 
from user_segments;

 Task 14
The user must have created a table or other object that stores data in order for
user_segments to select at least one row.

 Task 15
--Screenshot of command and results (possibly partial)
select * from user_extents;

 Task 18
--In the class server there are more extents in two places. Customers has 11 and 
--SYS_C00243485 has 2. This can be seen in task 12