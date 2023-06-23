/* НОРМАЛИЗАЦИЯ ДАННЫХ где таблицы разбиты на несколько но потом соединяются */

create table employee 
( 
    id int primary key not null auto_increment,
    name varchar(20) not null,
);

create table company
( 
    id int primary key not null auto_increment,
    company_name varchar(100) not null,
);


/* ================ заполняем табличку ============= */


create table company_employee
( 
    employee_id int not null,
    company_id int not null,
    primary key (employee_id, company_id),
    foreign key (employee_id) references employee(id),
    foreign key (company_id_id) references company(id),

);


select * 
from employee 
    join company_employee ce on employee_id = ce.employee_id 
    join company c on c.id = ce.company_id
where company_name ='apple' ;


select c.*, name
from employee 
    join company_employee ce on employee.id = ce.employee_id 
    join company c on c.id = ce.company_id
where name ='max' ;



update employee 
    join company_employee ce on employee.id = ce.employee_id
    join company c on c.id = ce.company_id
    set name='alibaba' /* установит алибаба всем кто работает в apple */
where company_name='apple';


/* _______________________________________________________ */



delete application from application
    join client c on c.idClient = application.Client_idClient
where LastName like '_a%' 
    or LastName like '_e%' 
    or LastName like '_y%' 
    or LastName like '_u%' 
    or LastName like '_o%' 
    or LastName like '_i%' ;


select application.*, LastName from application 
    join client c on c.idClient = application.Client_idClient ;




delete application from application
    join client c on c.idClient = application.Client_idClient
where LastName regexp '^.[eyuoa].*'


/* найти город где у кого больше кредитов >>> */
select City, count(*) from client 
    join application a on client.idClient = a.Client_idClient
group by idClient, 
order by count(*) desc;
/* >>> */
select * from client where City = (select City from client 
    join application a on client.idClient = a.Client_idClient
group by idClient, 
order by count(*) desc limit 1);




select avg(Sum) as avg, client.* from client
    join application a on client.idClient = a.Client_idClient
group by idClient
order by avg desc limit 1 ;



select client.*, Sum from client
    join application a  on client.idClient = a.Client_idClient 
    order by Sum limit 1 ; 


select * from application 
where Sum > (select avg(Sum) from application) ;



select max(Sum) as max_credit, client.* from client 
    join application a on client.idClient = a.Client_idClient
group by idClient;




select count(*) from client 
    join department d on d.idDepartment = client.Department_idDepartment
union 
select count(*) from client 
    join department d on d.idDepartment = client.Department_idDepartment 
where DepartmentCity = 'london';



select (select count(*) from client 
    join department d on d.idDepartment = client.Department_idDepartment) as all_count 
    (select count(*) from client 
        join department d on d.idDepartment = client.Department_idDepartment 
where DepartmentCity = 'london') as london_count;


select * from users where id=3;



select sum(Sum) as sum, DepartmentCity
from department 
    join client c on department.idDepartment = c.Department_idDepartment
    join application a on c.idClient = a.Client_idClient
where DepartmentCity = 'london'
group by idDepartment, DepartmentCity
having sum > 5000;


select max(Sum) as max_credit, client.*, Sum, CreditState, Currency
from client 
    join application a on client.idClient = a.Client_idClient
group by idClient, Sum, CreditState, Currency;


