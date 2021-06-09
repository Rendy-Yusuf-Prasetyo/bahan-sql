// CASE (kayak switch case)
select last_name "Nama", hire_date "Dimulai", salary "Gaji",
case  when hire_date < to_date('1-Jan-03','DD-MON-YY')
then trunc(salary * 1)
when hire_date < to_date('01-Jan-06','DD-MON-YY')
then trunc(salary * 2)
when hire_date < to_date('01-Jan-08','DD-MON-YY')
then trunc(salary * 5)
else salary
end "Usulan Gaji"
from hr.employees where department_id = 100 ORDER BY hire_date;


select first_name||' '||last_name "Nama Lengkap", salary "Gaji Awal", hire_date "Awal Masuk",
CASE
when to_date('01-Jan-01','DD-MON-YY') < to_date(sysdate)
then trunc(salary * 5)
when to_date('01-Jan-03','DD-MON-YY') < to_date(sysdate)
then trunc(salary * 4)
when to_date('01-Jan-05','DD-MON-YY') < to_date(sysdate)
then trunc(salary * 3)
when to_date('01-Jan-08','DD-MON-YY') < to_date(sysdate)
then trunc(salary * 2)
else salary
end "Kenaikan Gaji",
to_date(sysdate) "Tanggal sekarang",
trunc((to_date(sysdate) - hire_date)/365) "Total Kerja"
from employees order by salary asc;



DECODE
select employee_id, first_name, salary, decode(manager_id, null, 'manager', 'karyawan') from hr.employees;

select employee_id, first_name||' '||last_name "Nama Lengkap", decode(hire_date, to_date('13-Jan-01','DD-MON-YY'), salary*5, salary*1) from employees;

select employee_id, first_name||' '||last_name "Nama Lengkap", decode(hire_date, to_date('13-Jan-01','DD-MON-YY'), 'Sesepuh', 'Junior') "Tingkatan" from employees;



// IF ELSE
select employee_id, last_name,
case when(sysdate - hire_date)/365 > 15
then 'Karyawan Lama'
when(sysdate - hire_date)/365 > 5 then 'Karyawan Lumayan Lama'
else 'Karyawan Baru'
end "TERM OFFICE" FROM hr.employees;


// Jawaban Nomor 1
select first_name||' '||last_name "Nama Lengkap", Salary,
case when salary < 5000
then 'Kelas 1'
when salary > 5000 and salary < 15000
then 'Kelas 2'
else 'kelas 3'
end "Tingkat"
from hr.employees;

