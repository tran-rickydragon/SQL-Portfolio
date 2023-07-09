create table it_asset_inventory (
	asset_inv_id number(10),
	--asset_id number(10) not null,
    asset_type_id number(10) not null,
    asset_make varchar2(50) not null,
    asset_model varchar2(100) not null,
    asset_ext varchar2(50),
    purchase_or_rental char(8),
    unique_id varchar2(50),
    ci_acquired_date date not null,
    ci_status_code char(8) not null,
    ci_status_date date not null,
    constraint asset_inv_pk PRIMARY KEY(asset_inv_id),
    constraint asset_inv_asset_status_code foreign key (ci_status_code)
    references ci_status(ci_status_code)
);


--Ex 9 Task 1
select owner, table_name,tablespace_name from all_tables 
where owner = 'ITAM';


--Ex 9 Task 11
grant select on v$sql to ITAM; -- if user ITAM owns the ITAM tables
grant select on v$sql to RDTRAN3; -- if YOURUSER owns the ITAM tables
grant select on v$sql to PROF;-- grant PROF the privilege

select ci_inv_id,asset_type_id,asset_make,asset_model,ia.asset_ext,
purchase_or_rental,unique_id,ci_acquired_date,ci_status_code,
ci_status_date
from ci_inventory cii
join it_asset_desc ia
on ia.asset_desc_id=cii.asset_desc_id;

create view rdtran3_combine_tables as
select ci_inv_id,asset_type_id,asset_make,asset_model,ia.asset_ext,
purchase_or_rental,unique_id,ci_acquired_date,ci_status_code,
ci_status_date
from ci_inventory cii
join it_asset_desc ia
on ia.asset_desc_id=cii.asset_desc_id;


--Ex 9 Task 2
select owner,view_name,text_length from all_views 
where view_name like 'RDTRAN3_COMBINE_TABLES';

insert into it_asset_inventory --use your new table name
select * from RDTRAN3_COMBINE_TABLES;
commit;

execute 
dbms_stats.gather_schema_stats(ownname => 'RDTRAN3', estimate_percent => NULL);


--Ex 9 Task 3
select owner,table_name, num_rows from all_tables
where table_name = 'IT_ASSET_INVENTORY';


--Ex 9 Task 4
select table_owner,index_name,table_name from user_indexes
where table_name = 'IT_ASSET_DESC' OR table_name = 'CI_INVENTORY'
OR table_name = 'IT_ASSET_INVENTORY';


--Ex 9 Task 5 using Ex 3 Task 3 Query Sample - but you must use a different query
select user as NORMALIZED, count(cii.ci_inv_id),
iad.asset_make,iad.asset_model,iad.asset_ext
--c.cpu_details, c.graphics,c.vol_memory --optional and could include others from computer
from itam.employee_ci eci
join itam.ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join itam.it_asset_desc iad on cii.asset_desc_id = iad.asset_desc_id

where upper(iad.asset_make) like '%LENOVO%'
and eci.use_or_support = 'SUPPORT'
group by iad.asset_make,iad.asset_model,iad.asset_ext;


--Ex 9 Task 6 using Ex 3 Task 3 Query Sample - but you must use a different query
select user as DENORMALIZED, count(eci.ci_inv_id),
iai.asset_make,iai.asset_model,iai.asset_ext
--c.cpu_details, c.graphics,c.vol_memory --optional and could include others from computer
from itam.employee_ci eci
--join itam.ci_inventory cii
join it_asset_inventory iai
on eci.ci_inv_id = iai.asset_inv_id
--join itam.it_asset_desc iad on cii.asset_desc_id = iad.asset_desc_id

where upper(iai.asset_make) like '%LENOVO%'
and eci.use_or_support = 'SUPPORT'
group by iai.asset_make,iai.asset_model,iai.asset_ext;


--Ex 9 Task 7 Explain the plan for the normalized tables query
explain plan for
select user as NORMALIZED, count(cii.ci_inv_id),
iad.asset_make,iad.asset_model,iad.asset_ext
--c.cpu_details, c.graphics,c.vol_memory --optional and could include others from computer
from itam.employee_ci eci
join itam.ci_inventory cii
on eci.ci_inv_id = cii.ci_inv_id
join itam.it_asset_desc iad on cii.asset_desc_id = iad.asset_desc_id

where upper(iad.asset_make) like '%LENOVO%'
and eci.use_or_support = 'SUPPORT'
group by iad.asset_make,iad.asset_model,iad.asset_ext;


--Ex 9 Task 8 Retrieve the plan for the normalized tables query
select plan_table_output from table(dbms_xplan.display());


--Ex 9 Task 9 Explain the plan for the denormalized tables query
explain plan for
select user as DENORMALIZED, count(eci.ci_inv_id),
iai.asset_make,iai.asset_model,iai.asset_ext
--c.cpu_details, c.graphics,c.vol_memory --optional and could include others from computer
from itam.employee_ci eci
--join itam.ci_inventory cii
join it_asset_inventory iai
on eci.ci_inv_id = iai.asset_inv_id
--join itam.it_asset_desc iad on cii.asset_desc_id = iad.asset_desc_id

where upper(iai.asset_make) like '%LENOVO%'
and eci.use_or_support = 'SUPPORT'
group by iai.asset_make,iai.asset_model,iai.asset_ext;


--Ex 9 Task 10 Retrieve the plan for the denormalized query
select plan_table_output from table(dbms_xplan.display());


--Ex 9 Task 12
select sql_id,parsing_schema_name,
rows_processed,cpu_time,elapsed_time,sql_fulltext from v$sql where
upper(sql_fulltext) like 'SELECT USER AS NORMAL%' or upper(sql_fulltext) like 
'SELECT USER AS NORMAL%';


--Ex 9 Task 13
select sql_id,parsing_schema_name,
rows_processed,cpu_time,elapsed_time,sql_fulltext from v$sql where
upper(sql_fulltext) like 'SELECT USER AS NORMAL%' or upper(sql_fulltext) like 
'SELECT USER AS DENORMAL%';