use Payroll_Service;

----UC2-----
create table employee_payroll
(EmpID int not null identity(1,1) primary key,
EmpName varchar(150) not null,
Salary float not null,
StartDate date not null
);
select * from employee_payroll 

----UC3-------

insert into  employee_payroll(EmpName,Salary,StartDate) 
values
('Shaloo',60000,'2016-09-18'),
('Ranu',10000,'2020-10-1');

select * from employee_payroll

----UC4------
select * from employee_payroll

-----UC5------
select Salary from employee_payroll where EmpName='Shaloo';

select * from employee_payroll where StartDate between cast('2015-01-01' as date) and cast(getdate() as date);

------UC6------

alter table employee_payroll add Gender char(1);
select * from employee_payroll

update employee_payroll 
set Gender='M' where EmpName ='Shaloo' or EmpName ='Ranu' ;
select * from employee_payroll

-------UC7-------
select Gender,sum(salary) as SalarySum from employee_payroll  group by Gender;

select Gender,avg(salary) as AvgSalary from employee_payroll group by Gender;

select Gender,min(salary) as MinSalary from employee_payroll  group by Gender;

select Gender,max(salary) as MaxSalary from employee_payroll  group by Gender;

select Gender,count(salary) as EmpCount from employee_payroll group by Gender;





