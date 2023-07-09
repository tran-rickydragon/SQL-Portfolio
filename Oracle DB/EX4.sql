
--Connected as MONA
--Ex 4 Task 6 Command 1
insert into ITAM.employee
values (ITAM.emp_id_seq.nextval,'Task','Test',0919,'832-808-0303',
'zbloom@abcco.com','HIRE',
to_date('27-JAN-20 09:00:00 AM', 'DD-MON-RR HH:MI:SS AM'),
'SALES','Sales Media Manager',null);
commit;

--Connected as MONA
--Ex 4 Task 6 Command 2
select * from ITAM.employee;

--Connected as MONA
--Ex 4 Task 6 Command 3
update ITAM.employee set co_email = 'tasktest@abcoo.com'
where emp_id = 9;

--Connected as MONA
--Ex 4 Task 6 Command 4
select * from ITAM.employee;

--Connected as MONA
--Ex 4 Task 6 Command 5
delete from ITAM.employee where emp_id = 9;

--Connected as MONA
--Ex 4 Task 6 Command 6
select * from ITAM.employee;

--Connected MONA
--Ex 4 Task 12
create view nameandssn
as
select first_name, last_name, lastfour_ssn
from itam.employee
;

--Connected MONA
--Ex 4 Task 13
select*from nameandssn
;